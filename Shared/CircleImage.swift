import SwiftUI

struct CircleImage: View {
    let    ball: Ball
    var body: some View {
        Image(systemName: "star")
            .resizable()
            .frame(width: 30, height: 30)
            .offset(x: ball.x, y: ball.y)
            .foregroundColor(Color(red: ball.r, green: ball.g, blue: ball.b))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(ball: Ball)
    }
}
