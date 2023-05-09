import SwiftUI
import AVFoundation

extension AVPlayer {
    static let clickSound: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "mp3") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()

    func playFromStart() {
        seek(to: .zero)
        play()
    }
}
let clickSound: AVPlayer = AVPlayer.clickSound
var isSoundEffect: Bool = true
