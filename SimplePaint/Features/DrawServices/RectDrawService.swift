//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol HasRectDrawService {
    var pencilDraw: RectDrawProtocol { get }
}

protocol RectDrawProtocol {
    mutating func drawRect(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath)
}

final class RectDrawService: RectDrawProtocol {
    func drawRect(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath) {  }
}