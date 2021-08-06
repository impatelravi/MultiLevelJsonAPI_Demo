//
//  TableViewCell.swift
//  MultiLvlJsonAPIColViewDemo
//
//  Created by Ravi Patel on 04/08/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    //MARK:- UseInterface
    //Labels
    @IBOutlet weak var lblText: UILabel!
    
    //ImageViews
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(dictData: CollectionViewResultModel) {
        lblText.text = dictData.id
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
