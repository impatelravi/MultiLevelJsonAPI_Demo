//
//  CollectionViewCell.swift
//  MultiLvlJsonAPIDemo
//
//  Created by Ravi Patel on 02/08/21.
//

import SDWebImage
import UIKit

class CollectionViewCell: UICollectionViewCell {
    //UserInterface
    //ImageView
    @IBOutlet weak var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(dictData: CollectionViewResultModel) {
        let gif = dictData.media.map({ $0.gifURL })
        for i in gif {
            print(i)
            let url_new = URL(string: i)
            imgView.sd_setImage(with: url_new) { (image, error, cache, url) in
                if let image = image {
                    self.imgView.image = image
                }
            }
        }
    }
}

