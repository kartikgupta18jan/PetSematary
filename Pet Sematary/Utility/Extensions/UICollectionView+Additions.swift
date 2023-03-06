//
//  UICollectionView+Additions.swift
//  ListView
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    // MARK: - Class Properties
    static var identifier: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
