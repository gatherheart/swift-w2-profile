//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/13.
//

import Foundation
import UIKit

class EditViewController: UIViewController {
    var nameText: String = ""
    var descriptionText: String = ""
    weak var avatarImage: UIImage?
    var tmpAvatarImage: UIImage?
    weak var delegate: EditViewDelegate?
    private let imagePickerController = UIImagePickerController()

    @IBOutlet weak var editAvatar: UIButton!
    @IBOutlet weak var cameraOnEditAvatar: UIImageView!
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editDescription: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        if let image: UIImage = avatarImage {
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
        editName.text = nameText
        editName.clearButtonMode = .whileEditing
        editDescription.text = descriptionText
        editDescription.clearButtonMode = .whileEditing
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true) {}
    }

    @IBAction func done(_ sender: Any) {
        self.delegate?.willEditProfile(self, nameLabel: self.editName.text ?? "", descriptionLabel: self.editDescription.text ?? "", avatar: self.tmpAvatarImage) {
            dismiss(animated: true) {}
        }
    }

}

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public enum UIImagePickerControllerSourceType: Int {
        case photoLibrary
        case camera
        case savedPhotosAlbum
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.tmpAvatarImage = image
            editAvatar.setImage(image, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction private func pickImage(_ sender: Any) {
        let type = UIImagePickerController.SourceType.photoLibrary
        guard UIImagePickerController.isSourceTypeAvailable(type) else { return }
        imagePickerController.sourceType = type
        present(imagePickerController, animated: true, completion: nil)
    }

}
