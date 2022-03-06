//
//  Authentication.swift
//  login
//
//  Created by jsdysw on 2022/03/06.
//

import SwiftUI
import Alamofire

class Authentication: ObservableObject {
    @Published var isLoggedin = false
    @Published var accesstoken: String = ""
    @Published var refreshtoken: String = ""
    @Published var email: String = ""
    
    
    struct RequestBody: Codable {
        let email: String
        let refreshtoken: String
    }

    struct Response: Codable {
        let accesstoken: String?
        let message: String?
    }
    
    
    init() {
        let sendJSON = RequestBody(email: email, refreshtoken: refreshtoken)
        
        AF.request("http://localhost:3000/token", method: .post, parameters: sendJSON, encoder: JSONParameterEncoder.default).responseJSON { response in
            var tokenRes: Response
            do {
                tokenRes = try JSONDecoder().decode(Response.self, from: response.data!)
                
                if response.response?.statusCode == 200 {
                    self.updateValidation(success: true)
                    self.accesstoken = tokenRes.accesstoken ?? ""
                }
                debugPrint(tokenRes)
            } catch let error {
                print(error)
            }
        }
        
    }
    
    func updateValidation(success: Bool) {
        withAnimation{
            isLoggedin = success
        }
    }
    
    func logout() {
        updateValidation(success: false)
        accesstoken = ""
        refreshtoken = ""
        email = ""
    }
}
