//
//  APIs.swift
//  login
//
//  Created by jsdysw on 2022/03/05.
//

import Foundation
import Alamofire

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let accesstoken: String?
    let refreshtoken: String?
    let message: String?
}

func login(email: String, password: String) {

    let login = LoginRequestBody(email: email, password: password)
    
    AF.request("http://localhost:3000/login", method: .post, parameters: login, encoder: JSONParameterEncoder.default).responseJSON { response in
        
        var loginRes: LoginResponse
        do {
            loginRes = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
            debugPrint(loginRes)
            debugPrint(response.response?.statusCode)
        } catch let error {
            print(error)
        }
    }
}
