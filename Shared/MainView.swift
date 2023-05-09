import SwiftUI
import AVFoundation
import Combine

struct MainView: View {
    @State private var balls: [Ball]
    @State private var nowPlayer: Bool = false//0 self 1 enemy
    @State private var Ending: Bool = false
    @State private var EndingAnimate: Bool = false
    @State private var ballNum: [Int] = [4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 4, 0]
    @State private var isCapture: Bool = false
    @State private var isAnimation: Bool = false
    @State private var oneMore: Bool = false
    @State var isShowingModify: Bool = false
    @Binding var isCom: Bool
    @Binding var backgroundIndex: Int
    @Binding var chessIndex: Int
    @Binding var p1Color: Int
    @Binding var p2Color: Int
    init(isCom: Binding<Bool>, backgroundIndex: Binding<Int>, chessIndex: Binding<Int>, p1Color: Binding<Int>, p2Color: Binding<Int>) {
        var balls = [Ball]()
        for i in 0..<24 {
            let ball = Ball(index: i / 4)
            balls.append(ball)
        }
        for i in 28..<52 {
            let ball = Ball(index: i / 4)
            balls.append(ball)
        }
        self.balls = balls
        self._isCom = isCom
        self._backgroundIndex = backgroundIndex
        self._chessIndex = chessIndex
        self._p1Color = p1Color
        self._p2Color = p2Color
    }
    func updateBall(index: Int, completion: @escaping () -> Void) {
        var endIndex = index
        var indexToAnimate: [(Int, Int)] = []
        for j in 0..<48 {
            if balls[j].index != index  { continue }
            isAnimation = true
            endIndex = (endIndex + 1) % 14
            endIndex = nowPlayer && endIndex == 13 ? (endIndex + 1) % 14 : endIndex
            endIndex = !nowPlayer && endIndex == 6 ? (endIndex + 1) % 14 : endIndex
            indexToAnimate.append((j, endIndex))
            ballNum[endIndex] += 1
            ballNum[balls[j].index] -= 1
        }
        movingAnimation(i: 0, indexToAnimate: indexToAnimate) {
            Capture(index: endIndex) {
                checkEnd()
                completion()
            }
        }
    }
    func movingAnimation(i: Int, indexToAnimate: [(Int, Int)], completion: @escaping () -> Void) {
        guard i < indexToAnimate.count else {
            isAnimation = false
            isCapture = false
            completion()
            return
        }
        balls[indexToAnimate[i].0].moveBall(index: indexToAnimate[i].1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            movingAnimation(i: i + 1, indexToAnimate: indexToAnimate, completion: completion)
        }
    }
    func Capture(index: Int, completion: @escaping () -> Void) {
        if index == 6 || index == 13 {
            oneMore = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                oneMore = false
            }
            completion()
            return
        }
        var indexToAnimate: [(Int, Int)] = []
        if nowPlayer && index < 6 && ballNum[index] == 1 && ballNum[12 - index] != 0 {
            isCapture = true
            for j in 0..<48 {
                if balls[j].index != index && balls[j].index != 12 - index { continue }
                indexToAnimate.append((j, 6))
                ballNum[6] += 1
                ballNum[balls[j].index] -= 1
            }
        }
        if !nowPlayer && index > 6 && ballNum[index] == 1 && ballNum[12 - index] != 0 {
            isCapture = true
            for j in 0..<48 {
                if balls[j].index != index && balls[j].index != 12 - index { continue }
                indexToAnimate.append((j, 13))
                ballNum[13] += 1
                ballNum[balls[j].index] -= 1
            }
        }
        if indexToAnimate.isEmpty {
            nowPlayer.toggle()
            completion()
        }
        else {
            movingAnimation(i: 0, indexToAnimate: indexToAnimate) {
                nowPlayer.toggle()
                completion()
            }
        }
    }
    func checkEnd() {
        Ending = { () -> Bool in
            let f = ballNum[0..<6].allSatisfy { $0 == 0 }
            if f { return true }
            let ff = ballNum[7..<13].allSatisfy { $0 == 0 }
            return ff
        }()
        if Ending { updateEnd() }
    }
    func updateEnd() {
        var indexToAnimate: [(Int, Int)] = []
        for j in 0..<48 {
            if balls[j].index == 6 || balls[j].index == 13 { continue }
            let targetIndex = balls[j].index <= 6 ? 6 : 13
            indexToAnimate.append((j, targetIndex))
            ballNum[targetIndex] += 1
            ballNum[balls[j].index] -= 1
        }
        if indexToAnimate.isEmpty { EndingAnimate = true }
        else {
            movingAnimation(i: 0, indexToAnimate: indexToAnimate) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    EndingAnimate = true
                }
            }
        }
    }
    func resetGame() {
        var balls = [Ball]()
        for i in 0..<24 {
            let ball = Ball(index: i / 4)
            balls.append(ball)
        }
        for i in 28..<52 {
            let ball = Ball(index: i / 4)
            balls.append(ball)
        }
        self.balls = balls
        self.nowPlayer = false
        self.Ending = false
        self.EndingAnimate = false
        self.ballNum = [4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 4, 0]
        self.isCapture = false
        self.isAnimation = false
        self.oneMore = false
        self.isShowingModify = false
    }
    func comMove() {
        if Ending { return }
        var comIndex = -1
        while comIndex == -1 || isAnimation {
            let r = Int.random(in: 0..<6)
            if ballNum[r] > 0 { comIndex = r }
        }
        updateBall(index: comIndex) {
            if nowPlayer {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    comMove()
                }
            }
        }
    }
    var body: some View {
        ZStack{
            Image(backgroundName[backgroundIndex])
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            MainView(isCom: $isCom, backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
            GeometryReader { geometry in
                let center = CGPoint(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY)
                ForEach(balls) { ball in
                    BallImage(ball: ball, center: center, chessIndex: $chessIndex)
                }
                HStack{
                    VStack(spacing: 20){
                        VStack(alignment: .leading, spacing: 5){
                            Text("\(ballNum[6])")
                                .fontWeight(.black)
                                .bold()
                                .frame(width: 25, height: 25)
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(colorName[p2Color], lineWidth: 5)
                        }
                        .frame(width: 80, height: 165, alignment: .center)
                        .compositingGroup()
                        Text("P2")
                            .bold()
                            .font(.title)
                            .frame(width: 80, height: 25, alignment: .center)
                            .background(nowPlayer ? Color.pink : Color.gray)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            .animation(.easeOut(duration: 0.5), value: nowPlayer)
                    }
                    VStack{
                        HStack{
                            ForEach((0..<6).reversed(), id:\.self){ i in
                                let canMove = ballNum[i] > 0 && nowPlayer && !Ending ? true : false
                                VStack(alignment: .leading, spacing: 0){
                                    Text("\(ballNum[i])")
                                        .fontWeight(.black)
                                        .bold()
                                        .frame(width: 25, height: 25)
                                    ZStack{
                                        let green = canMove && !isAnimation && !isCapture ? true : false
                                        Circle()
                                            .fill(Color.clear)
                                            .frame(width: 90, height: 90)
                                        Circle()
                                            .stroke(Color.green, lineWidth: 8)
                                            .frame(width: 90, height: 90, alignment: .center)
                                            .opacity(green ? 1 : 0)
                                            .animation(.easeOut, value: green)
                                        Circle()
                                            .stroke(colorName[p2Color], lineWidth: 5)
                                            .frame(width: 80, height: 80, alignment: .center)
                                    }
                                    .compositingGroup()
                                }
                                .onTapGesture {
                                    if isSoundEffect { clickSound.playFromStart() }
                                    if canMove && !isAnimation && !isCom {
                                        updateBall(index: i){}
                                    }
                                }
                            }
                        }
                        HStack {
                            ForEach(7..<13, id:\.self){ i in
                                let canMove = ballNum[i] > 0 && !nowPlayer && !Ending ? true : false
                                VStack(alignment: .leading, spacing: 0){
                                    Text("\(ballNum[i])")
                                        .fontWeight(.black)
                                        .bold()
                                        .frame(width: 25, height: 25)
                                    ZStack{
                                        let green = canMove && !isAnimation ? true : false
                                        Circle()
                                            .fill(Color.clear)
                                            .frame(width: 90, height: 90)
                                        Circle()
                                            .stroke(Color.green, lineWidth: 8)
                                            .frame(width: 90, height: 90, alignment: .center)
                                            .opacity(green ? 1 : 0)
                                            .animation(.easeOut, value: green)
                                        Circle()
                                            .stroke(colorName[p1Color], lineWidth: 5)
                                            .frame(width: 80, height: 80, alignment: .center)
                                    }
                                    .compositingGroup()
                                }
                                .onTapGesture {
                                    if isSoundEffect { clickSound.playFromStart() }
                                    if canMove && !isAnimation {
                                        updateBall(index: i){
                                            if nowPlayer && isCom {
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                    comMove()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    VStack(spacing: 20){
                        Text("P1")
                            .bold()
                            .font(.title)
                            .frame(width: 80, height: 25, alignment: .center)
                            .background(!nowPlayer ? Color.pink : Color.gray)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                            .animation(.easeOut(duration: 0.5), value: nowPlayer)
                        VStack(alignment: .trailing, spacing: 5){
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(colorName[p1Color], lineWidth: 5)
                            Text("\(ballNum[13])")
                                .fontWeight(.black)
                                .bold()
                                .frame(width: 25, height: 25)
                        }
                        .frame(width: 80, height: 165, alignment: .center)
                        .compositingGroup()
                    }
                    .onTapGesture {
                        if isSoundEffect { clickSound.playFromStart() }
                    }
                    .overlay(
                        PerspectiveView(content:MotionView(s: "Capture!")
                                            .frame(width: 600, height: 200)
                                            .cornerRadius(20)
                                        )
                        .opacity(isCapture ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: isCapture)
                    )
                    .overlay(
                        PerspectiveView(content:MotionView(s: "Game Over!")
                                            .frame(width: 600, height: 200)
                                            .cornerRadius(20)
                                        )
                        .opacity(Ending ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: Ending)
                    )
                    .overlay(
                        PerspectiveView(content:MotionView(s: "One More!")
                                            .frame(width: 600, height: 200)
                                            .cornerRadius(20)
                                        )
                        .opacity(oneMore && !Ending ? 1 : 0)
                        .animation(.easeOut(duration: 1), value: oneMore)
                    )
                    .overlay(
                        PerspectiveView(content:ModifyView(isShowingModify: $isShowingModify, backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
                                            .frame(width: 500, height: 300)
                                            .cornerRadius(20))
                        .opacity(isShowingModify ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isShowingModify)
                    )
                    .fullScreenCover(isPresented: $EndingAnimate, content: {
                        EndView(P1: ballNum[6], P2: ballNum[13], isCom: $isCom, backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
                    })
                    Button {
                        if isSoundEffect { clickSound.playFromStart() }
                        isShowingModify.toggle()
                    } label: {
                        Image(systemName: "pause.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                    .disabled(isShowingModify)
                    .opacity(isShowingModify ? 0 : 1)
                    .frame(width: 30, height: 30)
                    .offset(x: -350, y: -130)
                }
                .onAppear {
                    resetGame()
                }
            }
        }
    }
}
