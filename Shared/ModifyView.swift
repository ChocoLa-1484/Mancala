import SwiftUI
let backgroundName: [String] = ["sky", "sea", "forest"]
let chessName: [String] = ["diamond", "redstone", "gold", "emerald", "lapis"]
let colorName: [Color] = [Color.red, Color.blue, Color.yellow, Color.orange, Color.gray, Color.pink, Color.black, Color.green, Color.purple]
struct ModifyView: View {
    @State private var showingBackground: Bool = false
    @State private var showingChessboard: Bool = false
    @State private var showingChess: Bool = false
    @State private var Main: Bool = false
    @State private var Restart: Bool = false
    @Binding var isCom: Bool
    @Binding var isShowingModify: Bool
    @Binding var backgroundIndex: Int
    @Binding var chessIndex: Int
    @Binding var p1Color: Int
    @Binding var p2Color: Int
    var body: some View {
        ZStack{
            ZStack{
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 500, height: 300)
                    .cornerRadius(10)
                Rectangle()
                    .stroke(Color.red, lineWidth: 10)
                    .frame(width: 500, height: 300)
                    .cornerRadius(10)
            }
            Button {
                if isSoundEffect { clickSound.playFromStart() }
                showingBackground = false
                showingChess = false
                showingChessboard = false
                isShowingModify.toggle()
            } label: {
                Image(systemName: "x.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
            }
            .frame(width: 30, height: 30)
            .offset(x: -210, y: -120)
            VStack(alignment: .center, spacing: 20){
                Button {
                    if isSoundEffect { clickSound.playFromStart() }
                    showingBackground.toggle()
                } label: {
                    Text("Backgroud")
                        .font(.custom("SilkScreen", size: 25))
                        .kerning(-5)
                        .bold()
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                }
                .opacity(showingBackground || showingChess || showingChessboard ? 0 : 1)
                .disabled(showingBackground || showingChess || showingChessboard)
                Button {
                    if isSoundEffect { clickSound.playFromStart() }
                    showingChessboard.toggle()
                } label: {
                    Text("Chessboard")
                        .font(.custom("SilkScreen", size: 25))
                        .kerning(-5)
                        .bold()
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                }
                .opacity(showingBackground || showingChess || showingChessboard ? 0 : 1)
                .disabled(showingBackground || showingChess || showingChessboard)
                Button {
                    if isSoundEffect { clickSound.playFromStart() }
                    showingChess.toggle()
                } label: {
                    Text("Chess")
                        .font(.custom("SilkScreen", size: 25))
                        .kerning(-5)
                        .bold()
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                }
                .opacity(showingBackground || showingChess || showingChessboard ? 0 : 1)
                .disabled(showingBackground || showingChess || showingChessboard)
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
                    .opacity(showingBackground || showingChess || showingChessboard ? 0 : 1)
                    .disabled(showingBackground || showingChess || showingChessboard)
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
                    .opacity(showingBackground || showingChess || showingChessboard ? 0 : 1)
                    .disabled(showingBackground || showingChess || showingChessboard)
                }
            }
            .overlay(
                ZStack{
                    VStack{
                        Text("Background")
                            .font(.system(size: 50))
                            .frame(width: 400, height: 80)
                            .opacity(showingBackground ? 1 : 0)
                        HStack{
                            Button {
                                if isSoundEffect { clickSound.playFromStart() }
                                backgroundIndex = (backgroundIndex - 1 + 3) % 3
                            } label: {
                                Image(systemName: "chevron.left.circle")
                                    .foregroundColor(.blue)
                            }
                            .opacity(showingBackground ? 1 : 0)
                            .disabled(!showingBackground)
                            Image(backgroundName[backgroundIndex])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 180)
                                .opacity(showingBackground ? 1 : 0)
                            Button {
                                if isSoundEffect { clickSound.playFromStart() }
                                backgroundIndex = (backgroundIndex + 1) % 3
                            } label: {
                                Image(systemName: "chevron.right.circle")
                                    .foregroundColor(.blue)
                            }
                            .opacity(showingBackground ? 1 : 0)
                            .disabled(!showingBackground)
                        }
                    }
                    .overlay(
                        Button {
                            if isSoundEffect { clickSound.playFromStart() }
                            showingBackground = false
                        } label: {
                            Image(systemName: "arrow.uturn.left")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.red)
                                .frame(width: 30, height: 30)
                        }
                        .opacity(showingBackground ? 1 : 0)
                        .disabled(!showingBackground)
                        .frame(width: 30, height: 30)
                        .offset(x: 200, y: -100)
                    )
                    VStack{
                        Text("Chess")
                            .font(.system(size: 50))
                            .frame(width: 400, height: 80)
                            .opacity(showingChess ? 1 : 0)
                        HStack{
                            Button {
                                if isSoundEffect { clickSound.playFromStart() }
                                chessIndex = (chessIndex - 1 + 5) % 5
                            } label: {
                                Image(systemName: "chevron.left.circle")
                                    .foregroundColor(.blue)
                            }
                            .opacity(showingChess ? 1 : 0)
                            .disabled(!showingChess)
                            Image(chessName[chessIndex])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .opacity(showingChess ? 1 : 0)
                            Button {
                                if isSoundEffect { clickSound.playFromStart() }
                                chessIndex = (chessIndex + 1) % 5
                            } label: {
                                Image(systemName: "chevron.right.circle")
                                        .foregroundColor(.blue)
                            }
                            .opacity(showingChess ? 1 : 0)
                            .disabled(!showingChess)
                        }
                    }
                    .overlay(
                        Button {
                            if isSoundEffect { clickSound.playFromStart() }
                            showingChess = false
                        } label: {
                            Image(systemName: "arrow.uturn.left")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.red)
                                .frame(width: 30, height: 30)
                        }
                        .opacity(showingChess ? 1 : 0)
                        .disabled(!showingChess)
                            .frame(width: 30, height: 30)
                        .offset(x: 200, y: -100)
                    )
                    VStack{
                        Text("Chessboard")
                            .font(.system(size: 50))
                            .frame(width: 400, height: 80)
                            .opacity(showingChessboard ? 1 : 0)
                        HStack{
                            VStack{
                                Text("P1")
                                    .foregroundColor(colorName[p1Color])
                                    .font(.system(size: 30))
                                    .opacity(showingChessboard ? 1 : 0)
                                HStack{
                                    Button {
                                        if isSoundEffect { clickSound.playFromStart() }
                                        p1Color = (p1Color - 1 + 9) % 9
                                        if p1Color == p2Color { p1Color = (p1Color - 1 + 9) % 9 }
                                    } label: {
                                        Image(systemName: "chevron.left.circle")
                                            .foregroundColor(.blue)
                                    }
                                    .opacity(showingChessboard ? 1 : 0)
                                    .disabled(!showingChessboard)
                                    Circle()
                                        .stroke(colorName[p1Color], lineWidth: 5)
                                        .frame(width: 80, height: 80, alignment: .center)
                                    .opacity(showingChessboard ? 1 : 0)
                                    Button {
                                        if isSoundEffect { clickSound.playFromStart() }
                                        p1Color = (p1Color + 1) % 9
                                        if p1Color == p2Color { p1Color = (p1Color + 1) % 9 }
                                    } label: {
                                        Image(systemName: "chevron.right.circle")
                                            .foregroundColor(.blue)
                                    }
                                    .opacity(showingChessboard ? 1 : 0)
                                    .disabled(!showingChessboard)
                                }
                            }
                            .compositingGroup()
                            VStack{
                                Text("P2")
                                    .foregroundColor(colorName[p1Color])
                                    .font(.system(size: 30))
                                    .opacity(showingChessboard ? 1 : 0)
                                HStack{
                                    Button {
                                        if isSoundEffect { clickSound.playFromStart() }
                                        p2Color = (p2Color - 1 + 9) % 9
                                        if p1Color == p2Color { p2Color = (p2Color - 1 + 9) % 9 }
                                    } label: {
                                        Image(systemName: "chevron.left.circle")
                                            .foregroundColor(.blue)
                                    }
                                    .opacity(showingChessboard ? 1 : 0)
                                    .disabled(!showingChessboard)
                                    Circle()
                                        .stroke(colorName[p2Color], lineWidth: 5)
                                        .frame(width: 80, height: 80, alignment: .center)
                                    .opacity(showingChessboard ? 1 : 0)
                                    Button {
                                        if isSoundEffect { clickSound.playFromStart() }
                                        p2Color = (p2Color + 1) % 9
                                        if p1Color == p2Color { p2Color = (p2Color + 1) % 9 }
                                    } label: {
                                        Image(systemName: "chevron.right.circle")
                                            .foregroundColor(.blue)
                                    }
                                    .opacity(showingChessboard ? 1 : 0)
                                    .disabled(!showingChessboard)
                                }
                            }
                            .compositingGroup()
                        }
                    }
                    .overlay(
                        Button {
                            if isSoundEffect { clickSound.playFromStart() }
                            showingChessboard = false
                        } label: {
                            Image(systemName: "arrow.uturn.left")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.red)
                                .frame(width: 30, height: 30)
                        }
                        .opacity(showingChessboard ? 1 : 0)
                        .disabled(!showingChessboard)
                        .frame(width: 30, height: 30)
                        .offset(x: 200, y: -100)
                    )
                    .fullScreenCover(isPresented: $Restart) {
                        ContentView(isCom: $isCom, backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
                    }
                    .fullScreenCover(isPresented: $Main) {
                        StartView(backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
                    }
                }
            )
             
        }
    }
}
/*
struct ModifyView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyView()
    }
}*/
