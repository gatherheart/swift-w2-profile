//
//  ViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/11.
//

import UIKit
import Foundation

class FirstViewController: UIViewController {

    var toggle: Bool = false

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!

    override func viewDidLoad() {

        super.viewDidLoad()
        self.view.backgroundColor = .gray
        avatar.layer.cornerRadius = avatar.frame.height/3
        nameLabel.text = "Bean"
        nameLabel.textColor = .white
        descriptionLabel.text = "Carpe diem!"
        descriptionLabel.textColor = .white
        editProfileButton.tintColor = .white
        editProfileButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: editProfileButton.frame.size.width, height: 0.3))
        lineView.backgroundColor = .white
        lineView.layer.opacity = 0.25
        editProfileButton.addSubview(lineView)

        let imageUrlString = "https://avatars2.githubusercontent.com/u/40990613?s=460&u=931a32905f788ebe3b3dc3f58fc4c4069fbf0cc5&v=4"
        guard let imageUrl: URL = URL(string: imageUrlString) else {
            return
        }

        avatar.loadImage(withUrl: imageUrl)
    }

    @IBAction func onPressEditProfile(_ sender: Any) {
        toggle = !toggle
        if toggle {
            nameLabel.textColor = .blue
            nameLabel.backgroundColor = .yellow
            nameLabel.alpha = 0.5
            descriptionLabel.text = "크루미션"
        } else {
            nameLabel.text = "Bean"
            nameLabel.textColor = .white
            descriptionLabel.text = "Carpe diem!"
            descriptionLabel.textColor = .white
            nameLabel.alpha = 1
            nameLabel.backgroundColor = .none
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController {
            destination.delegate = self
            destination.nameText = self.nameLabel.text ?? ""
            destination.descriptionText = self.descriptionLabel.text ?? ""
            destination.avatarImage = self.avatar.image
        }
    }
}

extension FirstViewController: EditViewDelegate {
    func willEditProfile(_ editView: EditViewController, nameLabel: String, descriptionLabel: String, avatar: UIImage?, completion: () -> Void) {
        self.nameLabel.text = nameLabel
        self.descriptionLabel.text = descriptionLabel
        if let image = avatar {
            self.avatar.image = image
        }
        completion()
    }

}
