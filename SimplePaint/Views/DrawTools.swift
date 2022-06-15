//
// Created by Dossymkhan Zhulamanov on 15.06.2022.
//

import UIKit

enum DrawTools {
    case circleButton
    case rectangleButton
    case triangleButton
    case lineButton
    case pencilButton
}

extension DrawTools {
    var view: UIButton {
        switch self {
        case .circleButton:
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            button.imageView?.layer.transform = CATransform3DMakeScale(2.0, 2.0, 2.0)
            return button

        case .rectangleButton:
            let button = UIButton()
            button.setImage(UIImage(systemName: "rectangle.fill"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            button.imageView?.layer.transform = CATransform3DMakeScale(2.0, 2.0, 2.0)
            return button

        case .triangleButton:
            let button = UIButton()
            button.setImage(UIImage(systemName: "triangle.fill"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            button.imageView?.layer.transform = CATransform3DMakeScale(2.0, 2.0, 2.0)
            return button

        case .lineButton:
            let button = UIButton()
            button.setImage(UIImage(systemName: "line.diagonal"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            button.imageView?.layer.transform = CATransform3DMakeScale(2.0, 2.0, 2.0)
            return button

        case .pencilButton:
            let button = UIButton()
            button.setImage(UIImage(systemName: "pencil"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            button.imageView?.layer.transform = CATransform3DMakeScale(2.0, 2.0, 2.0)
            return button
        }
    }
}