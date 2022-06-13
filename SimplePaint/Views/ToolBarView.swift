//
// Created by Dossymkhan Zhulamanov on 13.06.2022.
//

import UIKit

class ToolBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: .zero)

    }

    lazy private var circleButton: UIButton = {
        let button = UIButton()

        return button
    }()

    lazy private var rectangleButton: UIButton = {
        let button = UIButton()

        return button
    }()

    lazy private var lineButton: UIButton = {
        let button = UIButton()

        return button
    }()

    lazy private var triangleButton: UIButton = {
        let button = UIButton()

        return button
    }()

    lazy private var pencilButton: UIButton = {
        let button = UIButton()

        return button
    }()

    lazy private var isFilledLabel: UILabel = {
        let label = UILabel()
        label.text = "Fill"
        return label
    }()

    lazy private var isFilledToggle: UISwitch = {
        let toggle = UISwitch(frame: .zero)
        toggle.isOn = false
        return toggle
    }()

    func addIsFilledToggleTarget(_ target: Any?, action: Selector) {
        isFilledToggle.addTarget(target, action: action, for: .valueChanged)
    }

    private var colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    func subscribeToCollectionView(with viewController: UIViewController) {
        colorsCollectionView.delegate   = viewController as? UICollectionViewDelegate
        colorsCollectionView.dataSource = viewController as? UICollectionViewDataSource
    }

    lazy private var eraseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        return button
    }()

    func addEraseButtonTarget(_ target: Any?, action: Selector) {
        eraseButton.addTarget(target, action: action, for: .touchUpInside)
    }

    lazy private var buttonsHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        return stack
    }()

    lazy private var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        return stack
    }()

    private func addViews() {
        [circleButton, rectangleButton,
         lineButton, triangleButton, pencilButton].forEach(buttonsHStack.addArrangedSubview)

        [buttonsHStack, isFilledLabel,
         isFilledToggle, colorsCollectionView, eraseButton].forEach(mainHStack.addArrangedSubview)

        addSubview(mainHStack)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            mainHStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainHStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainHStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainHStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
