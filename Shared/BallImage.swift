import SwiftUI

struct BallImage: View {
    let ball: Ball
    var center: CGPoint
    @Binding var chessIndex: Int
    var body: some View {
        Image(chessName[chessIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
            .position(x: ball.pos.x + center.x, y: ball.pos.y + center.y)
            .colorMultiply(ball.color)
            .animation(.easeOut, value: ball.pos.x)
            .animation(.easeOut, value: ball.pos.y)
    }
}
