//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/13.
//

import Foundation
import UIKit

class EditViewController: UIViewController {
    private var nameText: String = ""
    private var descriptionText: String = ""
    private weak var avatarImage: UIImage?
    private var tmpAvatarImage: UIImage?
    private weak var delegate: EditViewDelegate?
    private let imagePickerController = UIImagePickerController()

    @IBOutlet weak var editAvatar: UIButton!
    @IBOutlet weak var cameraOnEditAvatar: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let image: UIImage = avatarImage {
            configureImage(image: image)
        }
        imagePickerController.delegate = self
        configureText()
    }

    private func configureImage(image: UIImage) {
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

    private func configureText() {
        name.clearButtonMode = .whileEditing
        name.text = nameText
        descriptionTextField.clearButtonMode = .whileEditing
        descriptionTextField.text = descriptionText
    }

    func changeProfile(_ sender: Any, name: String, descriptionLabel: String, avatarImage: UIImage?) {
        if let delegate = sender as? EditViewDelegate {
            self.delegate = delegate
        }
        self.nameText = name
        self.descriptionText = descriptionLabel
        if let image = avatarImage {
            self.avatarImage = image
        }
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true) {}
    }

    @IBAction func done(_ sender: Any) {
        self.delegate?.willEditProfile(self, nameLabel: self.name.text ?? "", descriptionLabel: self.descriptionTextField.text ?? "", avatar: self.tmpAvatarImage) {
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
