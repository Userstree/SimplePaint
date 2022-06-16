//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

protocol FactoryProtocol {
    func make() -> UIViewController
}

final class Factory: FactoryProtocol {
    func make() -> UIViewController {
        let viewModel = ViewModel()
        return ViewController(viewModel: viewModel)
    }
}

