//
//  ViewController.swift
//  SimplePaint
//
//  Created by Dossymkhan Zhulamanov on 13.06.2022.
//
//

import UIKit


class ViewController: UIViewController {

    private var toolbar = ToolBarView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }

    private func configureToolbar() {
        toolbar.subscribeToCollectionView(with: self)
        toolbar.addEraseButtonTarget(<#T##target: Any?##Any?#>, action: <#T##Selector##ObjectiveC.Selector#>)
        toolbar.addIsFilledToggleTarget(<#T##target: Any?##Any?#>, action: <#T##Selector##ObjectiveC.Selector#>)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }


}
