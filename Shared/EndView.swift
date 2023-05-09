import SwiftUI

struct EndView: View {
    var P1: Int = 0
    var P2: Int = 0
    @Binding var isCom: Bool
    @State private var Main: Bool = false
    @State private var Restart: Bool = false
    @Binding var backgroundIndex: Int
    @Binding var chessIndex: Int
    @Binding var p1Color: Int
    @Binding var p2Color: Int
    var body: some View {
        ZStack{
            Image(backgroundName[backgroundIndex])
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            Rectangle()
                .fill(Color.pink)
                .frame(width: 500, height: 300, alignment: .center)
                .cornerRadius(10)
                .overlay(
                    VStack(spacing: 0){
                        Spacer()
                        Text("Game Over")
                            .font(.system(size:80))
                            .bold()
                            .foregroundColor(Color.white)
                        HStack {
                            Spacer()
                            Text("P1")
                                .font(.system(size: 60))
                                .foregroundColor(Color.white)
                            Spacer()
                            Text("\(P1) vs \(P2)")
                                .font(.system(size: 70))
                                .foregroundColor(Color.black)
                            Spacer()
                            Text("P2")
                                .font(.system(size: 60))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        ZStack{
                            Text("P1 WIN")
                                .bold()
                                .font(.system(size: 60))
                                .underline()
                                .opacity(P1 > P2 ? 1 : 0)
                                .foregroundColor(Color.yellow)
                            Text("EVEN")
                                .bold()
                                .font(.system(size: 60))
                                .underline()
                                .opacity(P1 == P2 ? 1 : 0)
                                .foregroundColor(Color.yellow)
                            Text("P2 WIN")
                                .bold()
                                .font(.system(size: 60))
                                .underline()
                                .opacity(P1 < P2 ? 1 : 0)
                                .foregroundColor(Color.yellow)
                        }
                        HStack{
                            Button {
                                if isSoundEffect { clickSound.playFromStart() }
                                Main.toggle()
                            } label: {
                                Text("Main Menu")
                                    .font(.custom("SilkScreen", size: 25))
                                    .kerning(-5)
                                    .bold()
                                    .frame(width: 200, height: 40, alignment: .center)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                            }
                            Button {
                                if isSoundEffect { clickSound.playFromStart() }
                                Restart.toggle()
                            } label: {
                                Text("Restart")
                                    .font(.custom("SilkScreen", size: 25))
                                    .kerning(-5)
                                    .bold()
                                    .frame(width: 200, height: 40, alignment: .center)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                            }
                        }
                        Spacer()
                    }
                )
                .fullScreenCover(isPresented: $Restart) {
                    ContentView(isCom: $isCom, backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
                }
                .fullScreenCover(isPresented: $Main) {
                    StartView(backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
                }
        }
    }
}
/*
struct EndView_Previews: PreviewProvider {
    static var previews: some View {
            EndView(P1: 8, P2: 5)
                .previewInterfaceOrientation(.landscapeLeft)
    }
}
*/
