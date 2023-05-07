//
//  Token.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 7.05.2023.
//

import Foundation

struct TokenResponse: Decodable {
    var response: Token
}

public struct Token: Model {
    public let accessToken: String
    public let refreshToken: String
}
