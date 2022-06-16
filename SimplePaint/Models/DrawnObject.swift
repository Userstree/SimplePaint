//
// Created by Dossymkhan Zhulamanov on 16.06.2022.
//

import UIKit

struct PointsPair {
    var first: CGPoint
    var last: CGPoint
}

struct DrawnObject {
    let color: UIColor
    var points: [PointsPair]
    let drawingTool: DrawTools
    let isFilled: Bool
}