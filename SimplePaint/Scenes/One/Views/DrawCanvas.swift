//
// Created by Dossymkhan Zhulamanov on 15.06.2022.
//

import UIKit

class DrawCanvas: UIView {

    var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .sheetBackgroundColor
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        viewModel.lines.forEach { object in

            object.color.setStroke()

            object.points.forEach {  first, last in

            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        viewModel
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        guard let last = touches.first?.location(in: nil) else { return }

        guard var lastObject = viewModel.lines.popLast() else { return }
        guard var endPoint = lastObject.points.popLast() else { return }

        endPoint.1 = last
        lastObject.points.append(endPoint)

        if lastObject.buttonType == .pencilButton {
            lastObject.points.append((last, last))
        }
        viewModel.lines.append(lastObject)
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
}
