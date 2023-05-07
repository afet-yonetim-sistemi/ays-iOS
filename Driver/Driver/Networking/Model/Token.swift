//
//  Token.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 7.05.2023.
//

import Foundation

struct TokenResponse: Model {
    var response: Token
}

public struct Token: Codable {
    public let accessToken: String
    public let refreshToken: String
}
