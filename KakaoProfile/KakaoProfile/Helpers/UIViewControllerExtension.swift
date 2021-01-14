//
//  UIViewControllerExtension.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/14.
//

import Foundation
import UIKit

extension UIViewController {
    func showToast(vc: UIViewController, msg: String, sec: Double) {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
            
        vc.present(alert, animated: true, completion: nil)
            
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + sec) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
