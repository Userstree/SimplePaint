//
//  ViewController.swift
//  SimplePaint
//
//  Created by Dossymkhan Zhulamanov on 13.06.2022.
//
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var canvas: DrawCanvas = {
        let canvas = DrawCanvas(viewModel: viewModel)
        canvas.translatesAutoresizingMaskIntoConstraints = false
        return canvas
    }()

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

    private var upperHStack: UIStackView = {
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

    @objc private func pencilButtonTapped() {
        viewModel.curveType = .pencilButton
    }

    @objc private func rectButtonTapped() {
        viewModel.curveType = .rectangleButton
    }

    @objc private func circleButtonTapped() {
        viewModel.curveType = .circleButton
    }

    @objc private func lineButtonTapped() {
        viewModel.curveType = .lineButton
    }

    @objc private func triangleButtonTapped() {
        viewModel.curveType = .triangleButton
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    private func configureViews() {
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self

        circleButton.addTarget(self, action: #selector(pencilButtonTapped), for: .touchUpInside)
        rectangleButton.addTarget(self, action: #selector(rectButtonTapped), for: .touchUpInside)
        circleButton.addTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)
        lineButton.addTarget(self, action: #selector(lineButtonTapped), for: .touchUpInside)
        triangleButton.addTarget(self, action: #selector(triangleButtonTapped), for: .touchUpInside)

        [drawingToolsStack, toggleViewHStack, colorsCollectionView, eraseButton].forEach(upperHStack.addArrangedSubview)
        [upperHStack, canvas].forEach(view.addSubview)
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            upperHStack.topAnchor.constraint(equalTo: view.topAnchor),
            upperHStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            upperHStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            upperHStack.heightAnchor.constraint(equalToConstant: 105),

            colorsCollectionView.widthAnchor.constraint(equalToConstant: 270),
            colorsCollectionView.heightAnchor.constraint(equalToConstant: 50),

            drawingToolsStack.widthAnchor.constraint(equalToConstant: 340),
            drawingToolsStack.heightAnchor.constraint(equalToConstant: 50),

            toggleViewHStack.heightAnchor.constraint(equalToConstant: 50),
            eraseButton.heightAnchor.constraint(equalToConstant: 50),
        ])

        NSLayoutConstraint.activate([
            canvas.topAnchor.constraint(equalTo: upperHStack.bottomAnchor),
            canvas.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.allColorsForCards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColoredCardItem.identifier, for: indexPath) as! ColoredCardItem
        let cardBackgroundColor = viewModel.allColorsForCards[indexPath.item]
        cell.configure(with: cardBackgroundColor)
        return cell
    }
}

