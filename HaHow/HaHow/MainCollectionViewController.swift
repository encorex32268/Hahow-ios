//
//  MainCollectionViewController.swift
//  HaHow
//
//  Created by ChenLiHan on 2019/08/30.
//  Copyright © 2019 ChenLiHan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "userCell"

class MainCollectionViewController: UICollectionViewController {
    @IBOutlet weak var mainFlowLayout: UICollectionViewFlowLayout!
    var  posts : [PostData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
mainFlowLayout.estimatedItemSize = mainFlowLayout.itemSize
        
        //伸縮
        
        posts = getPostDatas()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
//        print("\(segue.identifier)")
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainCollectionViewCell
    
        // Configure the cell
        
        let post = posts[indexPath.row]
    
        cell.avatarImageView.image = post.avatarImage
        cell.usernameLabel.text = post.username
        cell.timeLabel.text = post.time
        cell.photoImageView.image = post.photo
        cell.contentLabel.text = post.content
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


func getPostDatas() -> [PostData]{
    var posts : [PostData] = []
    
    
    for index in 1...18 {
        var namePhoto = ""
        var indexString = String(index)
        if index < 10{
            indexString = "0\(index)"
        }

        
        
        if indexString == "07" || indexString == "11"{
            namePhoto  = "照片/demo-\(indexString).jpeg"
        }else{
            namePhoto = "照片/demo-\(indexString).jpg"
        }
        
        posts.append(
            PostData(
                avatarImage: UIImage(named: "Profile Picture/Miranda.png")!,
                username: "Miranda",
                time: "2019.05.23",
                photo: UIImage(named: namePhoto)!,
                content: "Courage and resolution are the spirit and soul of virtue. ")
        )
    }
    return posts
}
