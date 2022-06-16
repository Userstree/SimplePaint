//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol HasLineDrawService {
    var pencilDraw: LineDrawProtocol { get }
}

protocol LineDrawProtocol {
    mutating func drawLine(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath)
}

final class LineDrawService: LineDrawProtocol {
    func drawLine(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath) {  }
}
