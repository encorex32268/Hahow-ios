//
//  CreatePostViewController.swift
//  HaHow
//
//  Created by ChenLiHan on 2019/09/02.
//  Copyright © 2019 ChenLiHan. All rights reserved.
//

import UIKit
import Photos

class CreatePostViewController: UIViewController {
    
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        photoImageView.image = UIImage(named: "照片/demo-01.jpg")
        contentTextView.text = ""
    }
   
    @IBAction func openCameraClicked(_ sender: Any) {
        openPhotoLibrary()
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneClicked(_ sender: Any) {
        //dump data
        let avatarImage = UIImage(named: "Profile Picture/Emily.png")!
        let username = "EEKK"
        let time = "2019.08.05"
        //guard => if value is null will to else
        guard let photo = photoImageView.image else {
            alert("photo error")
            return
        }
        guard let content = contentTextView.text , !content.isEmpty else {
            alert("content error")
            return
        }
        let postdata = PostData(avatarImage: avatarImage, username: username, time: time, photo: photo, content: content)
        print(postdata)
        dismiss(animated: true, completion: nil)
    }
    
    func alert(_ body : String) {
        let alert = UIAlertController(title: "Error", message: "Reson:\(body)", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        //show
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func openPhotoLibrary() {
        
        if PHPhotoLibrary.authorizationStatus() == .authorized{
            //open photos
           let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        }else{
            requestPhotosPermission()
        }
        
        
    }
    
    func requestPhotosPermission(){
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (status) in
                self.openPhotoLibrary()
            }
        }else{
            let url = URL(string:UIApplication.openSettingsURLString)!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
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
extension CreatePostViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage]as? UIImage
        photoImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
