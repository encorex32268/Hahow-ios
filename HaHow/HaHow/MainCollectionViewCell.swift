//
//  MainCollectionViewCell.swift
//  HaHow
//
//  Created by ChenLiHan on 2019/08/30.
//  Copyright © 2019 ChenLiHan. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //圓角寫法 
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width/2
        avatarImageView.clipsToBounds = true
        
        photoImageView.clipsToBounds = true
    }
}
