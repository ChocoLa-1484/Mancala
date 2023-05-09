import SwiftUI
let posX: [CGFloat] = [205, 105, 5, -95, -195, -295, -385, -295, -195, -95, 5, 105, 205, 295]
let posY: [CGFloat] = [-50, -50, -50, -50, -50, -50, -10, 75, 75, 75, 75, 75, 75, 15]
let offY: [CGFloat] = [20, 20, 20, 20, 20, 20, 40, 20, 20, 20, 20, 20, 20, 40]

struct Ball: Identifiable {
    let id = UUID()
    var index: Int
    var pos: CGPoint
    var color: Color
    
    init(index: Int) {
        self.index = index
        self.pos = CGPoint(x: posX[index] + .random(in: -15...15), y: posY[index] + .random(in: -offY[index]...offY[index]))
        self.color = Color(red: .random(in: 0.5...0.9), green: .random(in: 0.5...0.9), blue: .random(in: 0.5...0.9))
    }
    
    mutating func moveBall (index: Int) {
        self.index = index
        self.pos = CGPoint(x: posX[index] + .random(in: -15...15), y: posY[index] + .random(in: -offY[index]...offY[index]))
    }
}
