import SwiftUI
import AVFoundation

@main
struct MancalaApp: App {
    @State var backgroundIndex: Int = 0
    @State var chessIndex: Int = 0
    @State var p1Color: Int = 0
    @State var p2Color: Int = 1
    var body: some Scene {
        WindowGroup {
            StartView(backgroundIndex: $backgroundIndex, chessIndex: $chessIndex, p1Color: $p1Color, p2Color: $p2Color)
        }
    }
}
