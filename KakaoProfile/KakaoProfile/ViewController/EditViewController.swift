//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/13.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var nameText: String = ""
    var descriptionText: String = ""
    weak var avatar: UIImageView?
    private let imagePickerController = UIImagePickerController()

    @IBOutlet weak var editAvatar: UIButton!
    @IBOutlet weak var cameraOnEditAvatar: UIImageView!
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editDescription: UITextField!
    
    public enum UIImagePickerControllerSourceType : Int {
        case photoLibrary
        case camera
        case savedPhotosAlbum
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        if let image: UIImage = avatar?.image {
            editAvatar.setTitle("", for: .normal)
            editAvatar.layer.cornerRadius = editAvatar.frame.height/3
            editAvatar.setImage(image, for: .normal)
            cameraOnEditAvatar.image = UIImage(systemName: "camera.circle.fill")
            cameraOnEditAvatar.tintColor = .white
            cameraOnEditAvatar.backgroundColor = .black
            cameraOnEditAvatar.layer.cornerRadius = cameraOnEditAvatar.frame.height/2
            cameraOnEditAvatar.layer.borderWidth = 2
            cameraOnEditAvatar.layer.borderColor = UIColor.white.cgColor
        }
        imagePickerController.delegate = self
        editName.clearButtonMode = .whileEditing
        editDescription.clearButtonMode = .whileEditing
    }
    
    
    @IBAction private func pickImage(_ sender: Any) {
        let type = UIImagePickerController.SourceType.photoLibrary
        guard UIImagePickerController.isSourceTypeAvailable(type) else { return }
        imagePickerController.sourceType = type
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true) { }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            editAvatar.setImage(image, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
    

}
