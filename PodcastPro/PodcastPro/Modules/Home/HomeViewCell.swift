//
//  HomeViewCell.swift
//  PodcastPro
//
//  Created by Sultan Rifaldy on 25/05/23.
//

import UIKit

class HomeViewCell: UITableViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var moreButtonLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.layer.masksToBounds = true
    }

}


