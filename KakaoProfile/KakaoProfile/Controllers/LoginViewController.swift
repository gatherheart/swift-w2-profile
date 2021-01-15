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
    let alert = UIAlertController(title: "로그인", message: "실패", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
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
            alertMessage(title: "Login Failed")
        }
    }
    
    private func alertMessage(title: String) {
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: UserAPIDelegate {
    func didVerify(isVerified: Bool) {
        if isVerified {
            // to-do: go to the webView of daum main home
            print("isVerified", isVerified)
        } else {
            alertMessage(title: "ID or Password is wrong")
        }
    }

}
