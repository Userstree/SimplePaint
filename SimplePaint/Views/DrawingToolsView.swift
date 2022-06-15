//
// Created by Dossymkhan Zhulamanov on 15.06.2022.
//

import UIKit

class DrawingToolsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: .zero)
        addViews()
    }

    private var circleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var rectangleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "rectangle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var lineButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.diagonal"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var triangleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "triangle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var pencilButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private func addViews() {
        [circleButton, rectangleButton,
         lineButton, triangleButton, pencilButton].forEach(mainHStack.addArrangedSubview)

        addSubview(mainHStack)
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            mainHStack.topAnchor.constraint(equalTo: topAnchor),
            mainHStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainHStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainHStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
