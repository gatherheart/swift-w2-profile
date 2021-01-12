//
//  ViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/11.
//

import UIKit

class FirstViewController: UIViewController{
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editProfile: UIButton!
    var toggle: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        avatar.layer.cornerRadius = avatar.frame.height/3
        nameLabel.text = "Bean"
        nameLabel.textColor = .white
        descriptionLabel.text = "Carpe diem!"
        descriptionLabel.textColor = .white
        editProfile.tintColor = .white
        editProfile.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: editProfile.frame.size.width, height: 0.3))
        lineView.backgroundColor = .white
        lineView.layer.opacity = 0.25
        editProfile.addSubview(lineView)
    }

    @IBAction func onPressEditProfile(_ sender: Any) {
        toggle = !toggle
        
        if toggle {
            nameLabel.textColor = .blue
            nameLabel.backgroundColor = .yellow
            nameLabel.alpha = 0.5
            descriptionLabel.text = "크루미션"
        }
        else {
            nameLabel.text = "Bean"
            nameLabel.textColor = .white
            descriptionLabel.text = "Carpe diem!"
            descriptionLabel.textColor = .white
            nameLabel.alpha = 1
            nameLabel.backgroundColor = .none
        }
    }
}

