//
// Created by Dossymkhan Zhulamanov on 15.06.2022.
//

import UIKit

extension UIStackView {
    convenience init(viewElements: [UIView]) {
        self.init()
        distribution = .fillEqually
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        for element in viewElements {
            addArrangedSubview(element)
        }
    }
}
