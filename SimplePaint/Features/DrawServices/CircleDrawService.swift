//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol HasCircleDrawService {
    var pencilDraw: CircleDrawProtocol { get }
}

protocol CircleDrawProtocol {
    mutating func drawCircle(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath)
}

final class CircleDrawService: CircleDrawProtocol {
    func drawCircle(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath) {  }
}
