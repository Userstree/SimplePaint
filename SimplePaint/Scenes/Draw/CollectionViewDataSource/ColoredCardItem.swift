//
// Created by Dossymkhan Zhulamanov on 14.06.2022.
//

import UIKit

class ColoredCardItem: UICollectionViewCell {

    static let identifier = "ColoredCardItem"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var card: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private func configureViews() {
        contentView.addSubview(card)
        makeConstraints()
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(with color: UIColor) {
        card.backgroundColor = color
    }
}
