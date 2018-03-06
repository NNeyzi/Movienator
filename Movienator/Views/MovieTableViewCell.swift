//
//  MovieTableViewCell.swift
//  Movienator
//
//  Created by Nader Neyzi on 3/4/18.
//  Copyright © 2018 Nader Neyzi. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = darkColor
        titleLabel.textColor = blueishColor
        overviewLabel.textColor = lightColor

    }

}
