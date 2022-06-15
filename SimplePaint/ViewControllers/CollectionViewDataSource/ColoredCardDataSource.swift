//
// Created by Dossymkhan Zhulamanov on 14.06.2022.
//

import UIKit

enum Section {
    case main
}

//enum ColorCard: Hashable {
//    case red
//    case blue
//    case green
//
//    var value: UIColor {
//        get {
//            switch self {
//            case .green:
//                return .green
//            case .blue:
//                return .blue
//            case .red:
//                return .red
//            }
//        }
//    }
//
//    func hash(into hasher: inout Hasher) {
//        switch self {
//
//        case .blue:
//            hasher.combine(UIColor.blue)
//        case .red:
//            hasher.combine(UIColor.red)
//        case .green:
//            hasher.combine(UIColor.green)
//        }
//    }
//}
//
//extension ColorCard: Equatable {
//    public static func ==(lhs: ColorCard, rhs: ColorCard) -> Bool {
//
//        switch (lhs, rhs) {
//        case (.blue, .blue), (.red, .red), (.green, .green):
//            return true
//        default:
//            return false
//        }
//    }
//}

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
