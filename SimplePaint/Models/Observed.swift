//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

class Observed<T> {

    typealias Listener = (T) -> ()
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        value = v
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}