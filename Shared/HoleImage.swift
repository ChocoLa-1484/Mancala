import SwiftUI
import AVFoundation

struct HoleImage: View {
    var body: some View {
        Text("HI")
    }
    /*
    @Binding var holes: [Hole]
    @Binding var nowPlayer: Bool
    @Binding var Ending: Bool
    @Binding var isCom: Bool
    
    var index: Int
    fileprivate func findOpacity() -> Double {
        return { () -> Double in
            if nowPlayer && index < 6 && holes[index].inside.count != 0 { return 1.0 }
            if !nowPlayer && index > 6 && holes[index].inside.count != 0 { return 1.0 }
            return 0.0
        }()
    }
    var body: some View {
        ZStack {
            let canMove = findOpacity()
            Circle()
                .stroke(Color.green, lineWidth: 8)
                .frame(width: 90, height: 90, alignment: .center)
                .opacity(canMove)
            Circle()
                .stroke(holes[index].color, lineWidth: 5)
                .frame(width: 80, height: 80, alignment: .center)
                .overlay(
                    ForEach(0..<holes[index].inside.count, id:\.self) { i in
                        BallImage(ball: holes[index].inside[i])
                    }
                )
                .onTapGesture {
                    if isEffect { clickPlayer.playFromStart() }
                    if canMove == 1.0 {
                        updateBall()
                        Ending = { () -> Bool in
                            var f = true
                            for i in 0..<6 {
                                if holes[i].inside.count != 0 {
                                    f = false
                                }
                            }
                            if f {
                                updateEnd()
                                return true
                            }
                            for i in 7..<13 {
                                if holes[i].inside.count != 0 {
                                    return false
                                }
                            }
                            updateEnd()
                            return true
                        }()
                    }
                }
        }
    }
    
    fileprivate func Capture(toIndex: Int, fromIndex: Int) {
        for j in 0..<holes[fromIndex].inside.count {
            let newBall = Ball(offsetPos: CGPoint(x: .random(in: -20...20), y: .random(in: -20...20)), color: holes[fromIndex].inside[j].color)
            holes[toIndex].inside.append(newBall)
        }
    }
    func updateEnd() {
        for i in 0..<13 {
            if i == 6 {
                continue
            }
            Capture(toIndex: (i < 6 ? 6 : 13), fromIndex: i)
        }
    }
    func updateBall() {
        let num = holes[index].inside.count
        var endIndex = index
        var next_x: CGFloat
        var next_y: CGFloat
        var newBall: Ball
        for j in 0..<num {
            endIndex = (endIndex + 1) % 14
            if nowPlayer {
                if endIndex == 13 {
                    endIndex = (endIndex + 1) % 14
                }
                if endIndex == 6 {
                    next_x = .random(in: -20...20)
                    next_y = .random(in: -40...40)
                } else {
                    next_x = .random(in: -20...20)
                    next_y = .random(in: -20...20)
                }
                newBall = Ball(offsetPos: CGPoint(x: next_x, y: next_y), color: holes[index].inside[j].color)
            } else {
                if endIndex == 6 {
                    endIndex = (endIndex + 1) % 14
                }
                if endIndex == 13 {
                    next_x = .random(in: -20...20)
                    next_y = .random(in: -40...40)
                } else {
                    next_x = .random(in: -20...20)
                    next_y = .random(in: -20...20)
                }
                newBall = Ball(offsetPos: CGPoint(x: next_x, y: next_y), color: holes[index].inside[j].color)
            }
            holes[endIndex].inside.append(newBall)
        }
        let a = holes[index].inside.popLast()
        holes[index].inside.removeAll()
        if num >= 13 {
            holes[index].inside.append(a!)
        }
        if endIndex == 6 || endIndex == 13 {
            return;
        }
        //Capture
        if !nowPlayer && endIndex > 6 && holes[endIndex].inside.count == 1 && holes[12 - endIndex].inside.count != 0 {
            Capture(toIndex: 13, fromIndex: endIndex)
            Capture(toIndex: 13, fromIndex: 12 - endIndex)
            holes[endIndex].inside.removeAll()
            holes[12 - endIndex].inside.removeAll()
        }
        if nowPlayer && endIndex < 6 && holes[endIndex].inside.count == 1 && holes[12 - endIndex].inside.count != 0 {
            Capture(toIndex: 6, fromIndex: endIndex)
            Capture(toIndex: 6, fromIndex: 12 - endIndex)
            holes[endIndex].inside.removeAll()
            holes[12 - endIndex].inside.removeAll()
        }
        nowPlayer = !nowPlayer
     
    }*/
}
/*
struct HoleImage_Previews: PreviewProvider {
    static var previews: some View {
        HoleImage()
    }
}*/
