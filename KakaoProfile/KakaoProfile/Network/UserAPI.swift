//
//  UserAPI.swift
//  KakaoProfile
//
//  Created by bean Milky on 2021/01/14.
//

import Foundation

class UserAPI {
    enum Response: String {
        case success = "success", failure = "failure"
    }
    static weak var delegate: UserAPIDelegate?

    static func login(_ sender: Any, userId: String, password: String) throws {
        let param = ["userId": userId, "password": password]
        let paramData = try JSONSerialization.data(withJSONObject: param, options: [])

        let url = URL(string: "\(Config.baseURL)/login")

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")

        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("An error has occured: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }

                    let ret = jsonObject["response"] as? String
                    if ret == Response.success.rawValue {
                        delegate?.didVerification(isVerified: true)
                    }
                } catch let error as NSError {
                    print("An error has occured while parsing JSONObject: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}

protocol UserAPIDelegate: AnyObject {
    func didVerification(isVerified: Bool)
}
