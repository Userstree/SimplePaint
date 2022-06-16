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
    let buttonType: DrawTools
    let isFilled: Bool
}

class ViewModel: Drawable {

    var allColorsForCards: [UIColor] = [.blue, .red, .green, .orange, .gray, .black]

    var bezierPath: UIBezierPath?
    var lineColor: UIColor = .black
    var curveType: DrawTools = .pencilButton
    var isFilled: Bool = false
    var lines = [DrawnObject]()

    func drawCurve(buttonType: DrawTools, firstPoint: CGPoint, finalPoint: CGPoint, path: inout UIBezierPath) {
        let path = buttonType.drawCurve(firstPoint: firstPoint, finalPoint: finalPoint, path: &path)
        bezierPath?.append(path)
    }

    func appendCurve() {
        lines.append(Object(color: objectColor, points: [(first, CGPoint())], buttonType: shapeType, isFilled: isFilled))
        lines.append(DrawnObject(color: color, points: <#T##[(CGPoint, CGPoint)]##[(CoreGraphics.CGPoint, CoreGraphics.CGPoint)]#>, buttonType: <#T##DrawTools##SimplePaint.DrawTools#>, isFilled: <#T##Bool##Swift.Bool#>))
    }
}
