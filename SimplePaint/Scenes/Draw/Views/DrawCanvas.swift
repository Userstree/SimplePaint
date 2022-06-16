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

        viewModel.drawnLines.bind { [weak self] _ in
            guard let self = self else { return }
            self.setNeedsDisplay()
        }

        backgroundColor = .sheetBackgroundColor
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        viewModel.makeCurve()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        guard var firstPoint = touches.first?.location(in: nil) else { return }
        firstPoint.y -= 105
        viewModel.appendCurve(firstPoint: firstPoint)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        guard var last = touches.first?.location(in: nil) else { return }
        last.y -= 105
        guard var lastObject = viewModel.drawnLines.value.popLast() else { return }
        guard var endPoint = lastObject.points.popLast() else { return }

        endPoint.1 = last
        lastObject.points.append(endPoint)

        if lastObject.drawingTool == .pencilButton {
            lastObject.points.append((last, last))
        }
        viewModel.drawnLines.value.append(lastObject)
        setNeedsDisplay()
    }
}
