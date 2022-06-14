//
//  ViewController.swift
//  SimplePaint
//
//  Created by Dossymkhan Zhulamanov on 13.06.2022.
//
//

import UIKit


class ViewController: UIViewController {

    var allColorsForCards: [UIColor] = [.blue, .red, .green]

    private var toolbar: ToolBarView = {
        
        let bar = ToolBarView()
        bar.translatesAutoresizingMaskIntoConstraints = false

        bar.layer.cornerRadius = 16
        return bar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureViews()
        configureToolbar()
    }

    private func configureToolbar() {
        toolbar.subscribeToCollectionView(with: self)
        toolbar.addEraseButtonTarget(self, action: #selector(didEraseButtonTapped))
        toolbar.addIsFilledToggleTarget(self, action: #selector(didFilledToggleTapped))
    }
    
    @objc private func didEraseButtonTapped() {
        print("erase button tapped")
    }

    @objc private func didFilledToggleTapped() {
        print("toggle tapped")
    }

    private func configureViews() {
        view.addSubview(toolbar)
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            toolbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toolbar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            toolbar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            toolbar.heightAnchor.constraint(equalToConstant: 145)
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allColorsForCards.count
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 40, height: 50)
}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColoredCardItem.identifier, for: indexPath) as! ColoredCardItem
        cell.card.backgroundColor = allColorsForCards[indexPath.item]
        return cell
    }
}

