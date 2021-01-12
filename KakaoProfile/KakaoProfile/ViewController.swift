//
//  ViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/11.
//

import UIKit

let IMAGE_SRC = "https://avatars2.githubusercontent.com/u/40990613?s=460&u=931a32905f788ebe3b3dc3f58fc4c4069fbf0cc5&v=4"
extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        do {
          self.init(data: try Data(contentsOf: url))
        } catch {
          print("Cannot load image from url: \(url) with error: \(error)")
          return nil
        }
    }
}
class ViewController: UIViewController{
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var statusMsg: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    var toggle: Bool = false
    
    @IBAction func onPressEditBtn(_ sender: Any) {
        toggle = !toggle
        
        if toggle {
            self.userName.textColor = .blue
            self.userName.backgroundColor = .yellow
            self.userName.alpha = 0.5
            self.statusMsg.text = "크루미션"
        }
        else {
            userName.text = "Bean"
            userName.textColor = .white
            statusMsg.text = "Carpe diem!"
            statusMsg.textColor = .white
            self.userName.alpha = 1
            self.userName.backgroundColor = .none
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        profileImg.image = UIImage(url: URL(string: IMAGE_SRC))
        profileImg.layer.cornerRadius = profileImg.frame.height/3
        userName.text = "Bean"
        userName.textColor = .white
        statusMsg.text = "Carpe diem!"
        statusMsg.textColor = .white
        editBtn.tintColor = .white
        editBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

}

