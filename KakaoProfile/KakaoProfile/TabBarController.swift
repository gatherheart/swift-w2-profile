//
//  TabBarController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/12.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") else { return }
        guard let secondViewController = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else { return }
        let icon1 = UITabBarItem(title: "profile", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle"))
        let icon2 = UITabBarItem(title: "login", image: UIImage(systemName: "character"), selectedImage: UIImage(systemName: "character"))
        
        firstViewController.tabBarItem = icon1
        secondViewController.tabBarItem = icon2

        let tabViews = [firstViewController, secondViewController]
        self.setViewControllers(tabViews, animated: true)
    }

}
