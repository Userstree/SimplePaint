//
// Created by Dossymkhan Zhulamanov on 14.06.2022.
//

import UIKit

enum Section {
    case main
}

typealias DataSource = UICollectionViewDiffableDataSource<Section, UIColor>

//class ColorsDiffableDataSource {
//
//}

func makeDataSource(collectionView: UICollectionView) -> DataSource {
    let dataSource = DataSource(collectionView: collectionView) {
        (collection, indexPath, cardColor) in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColoredCardItem.identifier, for: indexPath) as? ColoredCardItem
        cell?.configure(with: cardColor)
        return cell
    }

    return dataSource
}
