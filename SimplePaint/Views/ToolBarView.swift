//
// Created by Dossymkhan Zhulamanov on 13.06.2022.
//

import UIKit

class ToolBarView: UIView {

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

    lazy private var perncilleButton: UIButton = {
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

    lazy private var colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    

}
