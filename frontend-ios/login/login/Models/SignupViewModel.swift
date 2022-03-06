//
//  SignupVM.swift
//  login
//
//  Created by jsdysw on 2022/03/06.
//

import Foundation
import Alamofire

class SignupViewModel {
    var email: String = ""
    var password: String = ""
    var nick: String = ""
   
    struct SignupRequestBody: Codable {
        let email: String
        let password: String
        let nick: String
    }

    struct SignupResponse: Codable {
        let message: String?
    }
    
    func signup(completion: @escaping (Bool) -> Void) {
        let singup = SignupRequestBody(email: email, password: password, nick: nick)
        AF.request("http://localhost:3000/signup", method: .post, parameters: singup, encoder: JSONParameterEncoder.default).responseJSON { response in
            var signupRes: SignupResponse
            do {
                signupRes = try JSONDecoder().decode(SignupResponse.self, from: response.data!)
                if response.response?.statusCode == 200 {
                    // signup success
                    completion(true)
                }
                debugPrint(signupRes)
            } catch let error {
                print(error)
            }
        }
    }
    
    
}
