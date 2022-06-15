//
//  ViewController.swift
//  SimplePaint
//
//  Created by Dossymkhan Zhulamanov on 13.06.2022.
//
//

import UIKit


class ViewController: UIViewController {

    var allColorsForCards: [UIColor] = [.blue, .red, .green, .orange, .gray, .black]

    private var circleButton = DrawTools.circleButton.view
    private var rectangleButton = DrawTools.rectangleButton.view
    private var lineButton = DrawTools.lineButton.view
    private var triangleButton = DrawTools.triangleButton.view
    private var pencilButton = DrawTools.pencilButton.view

    private lazy var drawingToolsStack: UIStackView = {
        let elements = [circleButton, rectangleButton, lineButton, triangleButton, pencilButton]
        let stack = UIStackView(viewElements: elements)
        return stack
    }()

    private var filledLabel: UILabel = {
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

    private lazy var toggleViewHStack: UIStackView = {
        let elements = [filledLabel, isFilledToggle]
        let stack = UIStackView(viewElements: elements)
        stack.distribution = .fill
        return stack
    }()

    private var colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ColoredCardItem.self, forCellWithReuseIdentifier: ColoredCardItem.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private var eraseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()

    private var mainUpperHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 15
        stack.backgroundColor = .systemBackground
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .sheetBackgroundColor
        configureViews()
    }

    private func configureViews() {
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self

        [drawingToolsStack, toggleViewHStack, colorsCollectionView, eraseButton].forEach(mainUpperHStack.addArrangedSubview)

        view.addSubview(mainUpperHStack)
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            mainUpperHStack.topAnchor.constraint(equalTo: view.topAnchor),
            mainUpperHStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainUpperHStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainUpperHStack.heightAnchor.constraint(equalToConstant: 105),

            colorsCollectionView.widthAnchor.constraint(equalToConstant: 270),
            colorsCollectionView.heightAnchor.constraint(equalToConstant: 50),

            drawingToolsStack.widthAnchor.constraint(equalToConstant: 340),
            drawingToolsStack.heightAnchor.constraint(equalToConstant: 50),
            
            toggleViewHStack.heightAnchor.constraint(equalToConstant: 50),
            eraseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allColorsForCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColoredCardItem.identifier, for: indexPath) as! ColoredCardItem
        let cardBackgroundColor = allColorsForCards[indexPath.item]
        cell.configure(with: cardBackgroundColor)
        return cell
    }
}

