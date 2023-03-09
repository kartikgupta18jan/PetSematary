//
//  PetsListCellView.swift
//  ListView
//
//  Created by Kartik Gupta on 02/03/23.
//

import UIKit

class PetsListCellView: UICollectionViewCell {

    // MARK: - Properties
    @IBOutlet private weak var petName: UILabel!
    @IBOutlet private weak var petImage: UIImageView!
    @IBOutlet private weak var containerV: UIView!
    
    // MARK: - UIView Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        petImage.applyshadowWithCorner(containerView: containerV, cornerRadious: 10)
    }
}

extension PetsListCellView {
    // MARK: - User Defined Methods
    internal func updateView(_ pet: PetsInfo?) {
        petName.text = pet?.title ?? ""

        ImageDownloader.shared.downloadImage(with: pet?.image_url ?? "", completionHandler: { (image, cached) in

            self.petImage.image = image

        }, placeholderImage: UIImage(named: "pet"))
    }
}
