import SwiftUI


struct SettingView: View {
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
            VStack(alignment: .center, spacing: 10){
                Text("Setting")
                    .cornerRadius(10)
                    .font(.custom("SilkScreen", size: 60))
                HStack(spacing: 0){
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 500, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay(
                            HStack{
                                Text("Music")
                                    .foregroundColor(Color.white)
                                    .font(.custom("SilkScreen", size: 50))
                                    .kerning(-8)
                                    .frame(width: 150, height: 60, alignment: .leading)
                                Button {
                                    //UNDO
                                } label: {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 60, alignment: .center)
                                        .cornerRadius(10)
                                        .overlay(
                                            Text("1")
                                                .foregroundColor(Color.white)
                                                .font(.custom("SilkScreen", size: 50))
                                        )
                                }
                                Button {
                                    //UNDO
                                } label: {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 60, alignment: .center)
                                        .cornerRadius(10)
                                        .overlay(
                                            Text("2")
                                                .foregroundColor(Color.white)
                                                .font(.custom("SilkScreen", size: 50))
                                        )
                                }
                                Button {
                                    //UNDO
                                } label: {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 60, alignment: .center)
                                        .cornerRadius(10)
                                        .overlay(
                                            Text("OFF")
                                                .foregroundColor(Color.white)
                                                .font(.custom("SilkScreen", size: 50))
                                                .kerning(-5)
                                        )
                                }
                            }
                        )
                }
                HStack(spacing: 0){
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 500, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay(
                            HStack{
                                Text("Effect")
                                    .foregroundColor(Color.white)
                                    .font(.custom("SilkScreen", size: 50))
                                    .kerning(-8)
                                    .frame(width: 150, height: 60, alignment: .leading)
                                Button {
                                    isSoundEffect = true
                                    if isSoundEffect { clickSound.playFromStart() }
                                } label: {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 60, alignment: .center)
                                        .cornerRadius(10)
                                        .overlay(
                                            Text("ON")
                                                .foregroundColor(Color.white)
                                                .font(.custom("SilkScreen", size:50))
                                                .kerning(-5)
                                        )
                                }
                                Button {
                                    isSoundEffect = false
                                    if isSoundEffect { clickSound.playFromStart() }
                                } label: {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 60, alignment: .center)
                                        .cornerRadius(10)
                                        .overlay(
                                            Text("OFF")
                                                .foregroundColor(Color.white)
                                                .font(.custom("SilkScreen", size: 50))
                                                .kerning(-5)
                                        )
                                }
                                Rectangle()
                                    .fill(Color.pink)
                                    .frame(width: 100, height: 60, alignment: .center)
                            }
                        )
                }
            }
        }
    }
}
