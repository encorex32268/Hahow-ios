//
//  ProfileViewController.swift
//  HaHow
//
//  Created by ChenLiHan on 2019/08/30.
//  Copyright © 2019 ChenLiHan. All rights reserved.
//

import UIKit

private let NOTIFICATION_KEY = "notification_key"

class ProfileViewController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var useremailLabel: UILabel!
    @IBOutlet weak var postValueLabel: UILabel!
    @IBOutlet weak var followsValueLabel: UILabel!
    @IBOutlet weak var followedValueLabel: UILabel!
    @IBOutlet weak var notificationOnOff: UILabel!
    
    @IBOutlet weak var notificationSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width/2
        avatarImageView.clipsToBounds = true
        
        avatarImageView.image  = UIImage(named: "Profile Picture/Miranda.png")
        usernameLabel.text = "Miranda Kerr"
        useremailLabel.text = "super_sexy@gmail.com"
        postValueLabel.text = "80"
        followsValueLabel.text = "2000"
        followedValueLabel.text = "128"
        
        let ud = UserDefaults.standard
        let isOnOff = ud.bool(forKey: NOTIFICATION_KEY)
        notificationSwitch.isOn = isOnOff
        setSwitchStatus(isOnOff)
        
        
    }
    

    @IBAction func switchListener(_ sender: UISwitch) {
        //user sharedpreferance
        let ud = UserDefaults.standard
        ud.set(notificationSwitch.isOn, forKey: NOTIFICATION_KEY)
        ud.synchronize()
        setSwitchStatus(notificationSwitch.isOn)
        
    }
    
    
    func setSwitchStatus(_ onOff : Bool) {
        if onOff {
            notificationOnOff.text = "on"
        }else{
            notificationOnOff.text = "off"
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
