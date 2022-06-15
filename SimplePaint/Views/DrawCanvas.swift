//
// Created by Dossymkhan Zhulamanov on 15.06.2022.
//

import UIKit

struct Points {
    var color: UIColor?
    var points: [CGPoint]?
}

class PaintViewModel {
    let lines = [Points]()


}

class DrawCanvas: UIView {

    var strokeWidth: CGFloat = 1.0
    var strokeColor: UIColor = .black
    var lines = [Points]()

    override func draw(_ rect: CGRect) {
        super.draw(rect)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        lines.append(Points(color: strokeColor, points: [CGPoint]() ))
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
}
