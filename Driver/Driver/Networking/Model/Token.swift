//
//  Token.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 7.05.2023.
//

import Foundation

struct Token: Model {
    let accessToken: String
    let accessTokenExpiresAt: Int64
    let refreshToken: String
  
}

struct TokenInfo {
    let token: String
    let expiresAt: Int64
}

struct RefreshTokenInfo: Codable {
    let refreshToken: String
}
