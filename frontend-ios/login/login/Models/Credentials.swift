//
//  Credentials.swift
//  login
//
//  Created by jsdysw on 2022/03/02.
//

import Foundation

class Credentials: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
