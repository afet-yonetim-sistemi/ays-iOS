//
//  TokenManager.swift
//  Driver
//
//  Created by Fatih Doğan on 17.05.2023.
//

import Foundation
import Security

struct TokenManager {
    
    private static let keyAccessToken = "auth_token"
    private static let keyAccessTokenExpire = "auth_token_expire"
    private static let keyRefreshToken = "refresh_token"
    private static let defaults = UserDefaults.standard
    private static let coreFoundationBooleanTrue: CFBoolean = kCFBooleanTrue
    
    static func saveAuthTokens(tokens: Token) {
        set(tokens.accessToken, forKey: keyAccessToken)
        set(String(tokens.accessTokenExpiresAt), forKey: keyAccessTokenExpire)
        set(tokens.refreshToken, forKey: keyRefreshToken)
    }
    
    static func getAccessToken() -> TokenInfo? {
        let token = get(keyAccessToken) ?? ""
        let expireString = get(keyAccessTokenExpire) ?? ""
        guard let expiresAt = Int64(expireString) else { return nil }
        return TokenInfo(token: token, expiresAt: expiresAt)
    }
    
    static func getRefreshToken() -> RefreshTokenInfo {
        let token = get(keyRefreshToken) ?? ""
        return RefreshTokenInfo(refreshToken: token)
    }
    
    static func haveAuthTokens() -> Bool {
        if let accessToken = getAccessToken() , !accessToken.token.isEmpty, !getRefreshToken().refreshToken.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    static func haveValidAutTokens() -> Bool {
        guard let accessToken = getAccessToken() else { return false }
        return Double(accessToken.expiresAt) > Date().timeIntervalSince1970
    }
    
    static func dropTokens() {
        delete(keyAccessToken)
        delete(keyRefreshToken)
        delete(keyAccessTokenExpire)
    }
    
    @discardableResult
    private static func set(_ value: String, forKey key: String) -> Bool {
        guard let value = value.data(using: String.Encoding.utf8) else {
            return false
        }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: value
        ]
        let lastResultCode = SecItemAdd(query as CFDictionary, nil)
        return lastResultCode == noErr
    }
    
    @discardableResult
    private static func get(_ key: String) -> String? {
        var result: AnyObject?
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: coreFoundationBooleanTrue
        ]
        let lastResultCode = withUnsafeMutablePointer(to: &result) {
          SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        if lastResultCode == noErr, let data = result as? Data, let string = String(data: data, encoding: .utf8) {
            return string
        }
        return nil
    }

    @discardableResult
    private static func delete(_ key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        let lastResultCode = SecItemDelete(query as CFDictionary)
        return lastResultCode == noErr
    }
}
