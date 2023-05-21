//
//  UserDefaultsManager.swift
//  Driver
//
//  Created by Fatih Doğan on 17.05.2023.
//

import Foundation

struct UserDefaultsManager {

    private static let KEY_ACCESS_TOKEN = "auth_token"
    private static let KEY_ACCESS_TOKEN_EXPIRE = "auth_token_expire"
    private static let KEY_REFRESH_TOKEN = "refresh_token"
    
    static func saveAuthTokens(tokens: Token) {
        let defaults = UserDefaults.standard
        defaults.set(tokens.accessToken, forKey: UserDefaultsManager.KEY_ACCESS_TOKEN)
        defaults.set(tokens.accessTokenExpiresAt, forKey: UserDefaultsManager.KEY_ACCESS_TOKEN_EXPIRE)
        defaults.set(tokens.refreshToken, forKey: UserDefaultsManager.KEY_REFRESH_TOKEN)
    }
    
    static func getAccessToken() -> TokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsManager.KEY_ACCESS_TOKEN) as? String ?? ""
        let expiresAt = defaults.object(forKey: UserDefaultsManager.KEY_ACCESS_TOKEN_EXPIRE) as? Int64 ?? 0
        return TokenInfo(token: token, expiresAt: expiresAt)
    }
    
    static func getRefreshToken() -> RefreshTokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsManager.KEY_REFRESH_TOKEN) as? String ?? ""
        return RefreshTokenInfo(refreshToken: token)
    }
    
    static func haveAuthTokens() -> Bool {
        return !getAccessToken().token.isEmpty && !getRefreshToken().refreshToken.isEmpty
    }
    
    static func haveValidAutTokens() -> Bool {
        return Double(getAccessToken().expiresAt) > Date().timeIntervalSince1970
    }
    
    static func dropTokens() {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: UserDefaultsManager.KEY_ACCESS_TOKEN)
        defaults.set(0 as Int64, forKey: UserDefaultsManager.KEY_ACCESS_TOKEN_EXPIRE)
        defaults.set("", forKey: UserDefaultsManager.KEY_REFRESH_TOKEN)
    }
}
