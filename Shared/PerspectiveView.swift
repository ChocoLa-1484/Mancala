import SwiftUI

struct PerspectiveView<Content: View>: View {
    let content: Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                content
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                Color.clear
                    .overlay(
                        Rectangle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                            .opacity(0.5)
                            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .compositingGroup()
                            .blendMode(.overlay)
                    )
            }
        }
    }
}
/*
struct PerspectiveView_Previews: PreviewProvider {
    static var previews: some View {
        //PerspectiveView()
    }
}*/
