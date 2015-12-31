//
//  GirlTableViewCell.swift
//  client_instagram
//
//  Created by angelito on 10/31/15.
//  Copyright © 2015 Angelito. All rights reserved.
//

import UIKit
import Haneke

class GirlTableViewCell: UITableViewCell {
    
    @IBOutlet weak var girlImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var girl:JSON? {
        didSet {
            self.setupGirl()
        }
    }
    
    override func prepareForReuse() {
        self.girlImageView.image = nil
    }

    func setupGirl() {
        self.captionLabel.text = self.girl?["caption"]["text"].string
        if let urlString = self.girl?["images"]["standard_resolution"]["url"] {
            let url = NSURL(string: urlString.stringValue)
            self.girlImageView.hnk_setImageFromURL(url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
