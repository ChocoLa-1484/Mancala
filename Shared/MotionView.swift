import SwiftUI
let COLOR: [Color] = [Color.red, Color.yellow, Color.green, Color.pink, Color.orange, Color.purple, Color.blue]
struct MotionView: View {
    var s: String
    var body: some View {
        HStack{
            ForEach(Array(s), id:\.self) { letter in
                Text(String(letter))
                    .background(Color.clear)
                    .font(.custom("SilkScreen", size: 80))
                    .foregroundColor(COLOR[Int.random(in: 0..<7)])
            }
        }
        .frame(width: 600, height: 200, alignment: .center)
    }
}
/*
struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {

    }
}
*/
