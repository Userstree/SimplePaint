//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol Drawable {
    func drawCurve(firstPoint: CGPoint, finalPoint: CGPoint, path:inout UIBezierPath) -> UIBezierPath
}

extension Drawable {
    func drawCurve(firstPoint: CGPoint, finalPoint: CGPoint, path: inout UIBezierPath) -> UIBezierPath {
        path.move(to: firstPoint)
        path.addLine(to: finalPoint)
        return path
    }
}

struct DrawnObject {
    let color: UIColor
    var points: [(CGPoint, CGPoint)]
    let drawingTool: DrawTools
    let isFilled: Bool
}

class ViewModel: Drawable {

    var allColorsForCards: [UIColor] = [.blue, .red, .green, .orange, .gray, .black]

    var bezierPath: UIBezierPath?
    lazy var lineColor: UIColor = .black
    var curveType: DrawTools = .pencilButton
    var isFilled: Bool = false
    var lines = [DrawnObject]()

    func drawCurve(buttonType: DrawTools, firstPoint: CGPoint, finalPoint: CGPoint, path: inout UIBezierPath) {
        let path = buttonType.drawCurve(firstPoint: firstPoint, finalPoint: finalPoint, path: &path)
        bezierPath?.append(path)
    }

    func appendCurve(firstPoint: CGPoint) {
        lines.append(DrawnObject(color: lineColor, points: [ (firstPoint, CGPoint()) ], drawingTool: curveType, isFilled: isFilled))
    }

    func makeCurve() {
        lines.forEach { object in

            object.color.setStroke()

            object.points.forEach {  first, last in
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
}
