//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol HasPencilDrawService {
    var pencilDraw: PencilDrawProtocol { get }
}

protocol PencilDrawProtocol {
    mutating func drawWithPencil(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath)
}

final class PencilDrawService: PencilDrawProtocol {
    func drawWithPencil(firstPoint: CGPoint, endPoint: CGPoint, path: inout UIBezierPath) {  }
}