//
//  SecondViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/12.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var password: UITextField!

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(rgb: 0xFFE812)
    }

    @IBAction func onPressLogin(_ sender: Any) {
        self.login()
    }

    func login() {
        do {
            UserAPI.delegate = self
            try UserAPI.login(self, userId: userId?.text ?? "", password: password?.text ?? "")
        } catch {
            return
        }
    }
}

extension LoginViewController: UserAPIDelegate {
    func didVerification(isVerified: Bool) {
        if isVerified {
            // to-do go to the webView of daum main home
            print("isVerified", isVerified)
        }
    }

}
