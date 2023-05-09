import SwiftUI
import AVFoundation

struct StartView: View {
    @State private var isPlaying = false
    @State private var isCom = false
    @State private var isShowingSettingView = false
    @State private var isShowingTutorial = false
    @Binding var backgroundIndex: Int
    @Binding var chessIndex: Int
    @Binding var p1Color: Int
    @Binding var p2Color: Int
    var body: some View {
        ZStack {
            Image("lightsky")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            ZStack{
                Button {
                    if isSoundEffect { clickSound.playFromStart() }
                    isShowingSettingView = !isShowingSettingView
                } label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
                .frame(width: 30, height: 30)
            }
            .offset(x: -350, y: -130)
            HStack(alignment: .top){
                VStack{
                    Text("The\nMancala")
                        .font(.custom("SilkScreen", size: 70))
                        .bold()
                        .frame(width: 400, height: 200, alignment: .center)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.orange)
                        .shadow(color: Color.orange, radius: 5, x: 0, y: 0)
                    HStack(spacing: 30){
                        Button {
                            if isSoundEffect { clickSound.playFromStart() }
                            isPlaying = true
                            isCom = true
                        } label: {
                            Text("VS Computer")
                                .font(.custom("SilkScreen", size: 25))
                                .kerning(-5)
                                .bold()
                                .frame(width: 200, height: 40, alignment: .center)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                        Button {
                            if isSoundEffect { clickSound.playFromStart() }
                            isPlaying = true
                            isCom = false
                        } label: {
                            Text("VS Human")
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
                    HStack(spacing: 30){
                        Button {
                            if isSoundEffect { clickSound.playFromStart() }
                            //isPlaying = true
                        } label: {
                            Text("Statistics")
                                .font(.custom("SilkScreen", size: 25))
                                .kerning(-5)
                                .bold()
                                .frame(width: 200, height: 40, alignment: .center)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                        Button {
                            if isSoundEffect { clickSound.playFromStart() }
                            isShowingTutorial = true
                        } label: {
                            Text("How to Play")
                                .font(.custom("SilkScreen", size: 25))
                                .kerning(-5)
                                .bold()
                                .frame(width: 200, height: 40, alignment: .center)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                    }
                }
            }
            
        }
        .fullScreenCover(isPresented: $isShowingTutorial, content: {
            TutorialView(backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color
                         , p2Color: $p2Color, isShowingTutorial: $isShowingTutorial)
        })
        .fullScreenCover(isPresented: $isPlaying, content: {
            ContentView(isCom: $isCom, backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
        })
        .overlay(
            PerspectiveView(content:SettingView()
                                .frame(width: 500, height: 300)
                                .cornerRadius(20))
            .opacity(isShowingSettingView ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: isShowingSettingView)
        )
    }
}
/*
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(backgroundIndex: <#Binding<Int>#>, chessIndex: <#Binding<Int>#>)
            .previewLayout(.fixed(width: 844, height: 390))
    }
}*/
