//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/15.
//

import UIKit
import Foundation
import WebKit

class MainViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var floatingView: UIView!
    
    private let url = URL(string: Config.daumURL)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        webView.allowsBackForwardNavigationGestures = true
        self.loadWebView()
        webView.navigationDelegate = self
        webView.uiDelegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func webViewGoBack(_ sender: Any) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
}

extension MainViewController: WKUIDelegate, WKNavigationDelegate {

    private func loadWebView() {
        if let url = self.url {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
        self.webView.addSubview(floatingView)
    }
}
