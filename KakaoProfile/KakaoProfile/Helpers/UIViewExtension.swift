//
//  UIViewExtension.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/14.
//

import Foundation
import UIKit

extension UIView {
    func roundView(by n: CGFloat) {
        self.layer.cornerRadius = self.frame.width / n
        self.clipsToBounds = true
    }

    func setBorder(thick: CGFloat, color: CGColor) {
        self.layer.borderWidth = thick
        self.layer.borderColor = color
    }
}
