//
//  LoadImage.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/13.
//

import UIKit

extension UIImageView {
    func loadImage(withUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
