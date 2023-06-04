//
//  HomeBannerTableViewCell.swift
//  TuDumm
//
//  Created by Cassiano C Salgado on 29/05/23.
//

import UIKit

class HomeBannerTableViewCell: UITableViewCell {

    @IBOutlet weak var bannerGenreLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var myListButton: UIButton!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playButton.tintColor = .white
        playButton.titleLabel?.textColor = .black
        
        myListButton.tintColor = .darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
