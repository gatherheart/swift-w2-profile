//
//  EditVIewDelegate.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/14.
//

import UIKit

protocol EditViewDelegate: AnyObject {
    func willEditProfile(_ editView: EditViewController, nameLabel: String, descriptionLabel: String, avatar: UIImage?, completion: () -> Void)
}
