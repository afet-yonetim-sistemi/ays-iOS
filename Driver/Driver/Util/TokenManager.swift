//
//  TokenManager.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 7.05.2023.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()
    var accessToken: String = ""
    var refreshToken: String = ""
    
    private init() { }
}
