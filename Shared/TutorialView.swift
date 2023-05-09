import SwiftUI
let scripts: [String] = ["遊戲目標是讓靠近自己這排的右邊大洞裝滿愈多的寶石，遊戲結束時將比較雙方大洞的寶石數量。",
    "一開始每人有 24 顆寶石，一個小洞裝 4 顆。",
    "輪到玩家的回合時，玩家可移動自己某個小洞的寶石。(大洞的寶石無法移動，大洞的寶石數量代表分數)",
    "寶石將一個個逆時針移動到旁邊的洞",
    "玩家移動的最後一顆寶石落在自己的大洞時，可以再次移動自己小洞的寶石。",
    "寶石移動時不可落在對手的大洞，若遇到對手的大洞，請視而不見跳過。",
    "玩家移動的最後一顆寶石落在自己空的小洞，而且此洞的對面也有寶石時，\n兩個洞的寶石將被收到玩家的大洞，開心地進補大量分數。",
    "當某一邊的小洞沒有寶石時遊戲結束，此時畫面上小洞的寶石也會成為分數，它們將全部移動到大洞。",
    "大洞裡寶石較多的玩家獲勝。"]
struct TutorialView: View {
    @State private var scriptsIndex: Int = 0
    @State private var isStart: Bool = true
    @State private var isEnd: Bool = false
    @Binding var backgroundIndex: Int
    @Binding var chessIndex: Int
    @Binding var p1Color: Int
    @Binding var p2Color: Int
    @Binding var isShowingTutorial: Bool
    var body: some View {
        ZStack {
            Image(backgroundName[backgroundIndex])
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: 700, height: 300, alignment: .center)
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.red, lineWidth: 15)
                        .frame(width: 700, height: 300, alignment: .center)
                    VStack{
                        Text(scripts[scriptsIndex])
                            .frame(width: 500, height: 300, alignment: .center)
                            .font(.body)
                        HStack (spacing: 100){
                            Button {
                                scriptsIndex -= 1
                                isStart = scriptsIndex == 0 ? true : false
                                isEnd = scriptsIndex == 8 ? true : false
                            } label: {
                                Text("Back")
                                    .font(.system(size: 25))
                                    .frame(width: 200, height: 40, alignment: .center)
                                    .background(Color.red)
                                    .foregroundColor(.black)
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                            }
                            .disabled(isStart)
                            .opacity(isStart ? 0 : 1)
                            Button {
                                scriptsIndex += 1
                                isStart = scriptsIndex == 0 ? true : false
                                isEnd = scriptsIndex == 8 ? true : false
                            } label: {
                                Text("Next")
                                    .font(.system(size: 25))
                                    .frame(width: 200, height: 40, alignment: .center)
                                    .background(Color.red)
                                    .foregroundColor(.black)
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                            }
                            .disabled(isEnd)
                            .opacity(isEnd ? 0 : 1)
                        }
                    }
                }
            }
            Button {
                if isSoundEffect { clickSound.playFromStart() }
                isShowingTutorial = false
            } label: {
                Image(systemName: "x.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
            }
            .frame(width: 30, height: 30)
            .offset(x: -320, y: -120)
        }
    }
}
/*
struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
*/
