//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol HasTriangleDrawService {
    var pencilDraw: TriangleDrawProtocol { get }
}

protocol TriangleDrawProtocol {
    mutating func drawTriangle(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath)
}

final class TriangleDrawService: TriangleDrawProtocol {
    func drawTriangle(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath) {  }
}
