//
//  DashboardTableViewCell.swift
//  RobustaTask
//
//  Created by Mohamed Zaki on 10/22/20.
//  Copyright © 2020 Mohamed Mahmoud Zaki. All rights reserved.
//

import UIKit
import Kingfisher

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func downloadImage(imageURL: String) {
        let url = URL(string: imageURL)
        avatarImage.kf.setImage(with: url)
    }
    
}
