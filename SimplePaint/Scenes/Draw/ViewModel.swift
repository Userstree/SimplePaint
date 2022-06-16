//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol Drawable {
    func drawCurve(firstPoint: CGPoint, finalPoint: CGPoint, path:inout UIBezierPath) -> UIBezierPath
}

typealias DrawCallback = () -> Void

class ViewModel {

    var allColorsForCards: [UIColor] = [.blue, .red, .green, .orange, .gray, .black]

    lazy var lineColor: UIColor = .black
    var curveType: DrawTools = .pencilButton
    var isFilled: Bool = false
    var drawnLines = [DrawnObject]()
    var bindViewModel: DrawCallback?

    func appendCurve(firstPoint: CGPoint) {
        drawnLines.append(DrawnObject(color: lineColor, points: [ PointsPair(first: firstPoint, last: firstPoint) ], drawingTool: curveType, isFilled: isFilled))
    }

    func undo() {
        _ = drawnLines.popLast()
        bindViewModel?()
    }

    func makeCurve() {
        drawnLines.forEach { object in

            object.color.setStroke()

            object.points.forEach {  pair in

                let first = pair.first
                let last = pair.last
                var path = UIBezierPath()

                switch object.drawingTool {
                case .pencilButton:
                    drawCurve(buttonType: .pencilButton, firstPoint: first, finalPoint: last, path: &path)
                case .circleButton:
                    drawCurve(buttonType: .circleButton, firstPoint: first, finalPoint: last, path: &path)
                case .triangleButton:
                    drawCurve(buttonType: .triangleButton, firstPoint: first, finalPoint: last, path: &path)
                case .lineButton:
                    drawCurve(buttonType: .lineButton, firstPoint: first, finalPoint: last, path: &path)
                case .rectangleButton:
                    drawCurve(buttonType: .rectangleButton, firstPoint: first, finalPoint: last, path: &path)
                }

                if object.isFilled {
                    object.color.setFill()
                    path.fill()
                }

                path.lineWidth = 2
                path.stroke()
            }
        }
    }

    func drawCurve(buttonType: DrawTools, firstPoint: CGPoint, finalPoint: CGPoint, path: inout UIBezierPath) {
        buttonType.drawCurve(firstPoint: firstPoint, finalPoint: finalPoint, path: &path)
    }
}
