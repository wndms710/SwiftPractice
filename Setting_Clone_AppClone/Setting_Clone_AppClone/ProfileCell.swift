//
//  ProfileCell.swift
//  Setting_Clone_AppClone
//
//  Created by 조주은 on 2022/06/02.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var bottomDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let profileHigh: CGFloat = 60
        profileImageView.layer.cornerRadius = profileHigh / 2
        
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        bottomDescription.textColor = .darkGray
        bottomDescription.font = UIFont.systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
