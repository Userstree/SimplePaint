//
// Created by Dossymkhan Zhulamanov on 15.06.2022.
//

import UIKit

class ToggleView: UIView {

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

    private var isFilledLabel: UILabel = {
        let label = UILabel()
        label.text = "Fill"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var isFilledToggle: UISwitch = {
        let toggle = UISwitch(frame: .zero)
        toggle.isOn = false
        toggle.translatesAutoresizingMaskIntoConstraints = false
        return toggle
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

        [isFilledLabel, isFilledToggle].forEach(mainHStack.addArrangedSubview)

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
