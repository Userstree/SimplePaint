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
        addViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
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

    func addIsFilledToggleTarget(_ target: Any?, action: Selector) {
        isFilledToggle.addTarget(target, action: action, for: .valueChanged)
    }

    private var colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ColoredCardItem.self, forCellWithReuseIdentifier: ColoredCardItem.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .blue
        return collectionView
    }()

    func subscribeToCollectionView(with viewController: UIViewController) {
        colorsCollectionView.delegate = viewController as! UICollectionViewDelegate
        colorsCollectionView.dataSource = viewController as! UICollectionViewDataSource
    }

    private var eraseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func addEraseButtonTarget(_ target: Any?, action: Selector) {
        eraseButton.addTarget(target, action: action, for: .touchUpInside)
    }

    private var buttonsHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        return stack
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
         lineButton, triangleButton, pencilButton].forEach(buttonsHStack.addArrangedSubview)

        [buttonsHStack, isFilledLabel,
         isFilledToggle, colorsCollectionView, eraseButton].forEach(mainHStack.addArrangedSubview)

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
