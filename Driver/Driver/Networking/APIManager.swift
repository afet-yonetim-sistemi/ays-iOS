//
//  APIManager.swift
//  Driver
//
//  Created by Mehmet fatih DOĞAN on 7.05.2023.
//

import Foundation

final class APIManager: NSObject {
    var request: Request?
    var apiClient = APIClient()
    
    func login(username: String, password: String, success: @escaping () -> Void, fail: @escaping (Error?) -> Void) {
        
       let autBody = AuthBody(username: username, password: password)
        guard let jsonData = try? JSONEncoder().encode(autBody) else { return fail(APIError.encodingError)}
        request = Request.get(method: .post, path: "/api/v1/authentication/token", queryItems: nil, headers: [HTTPHeader(key: "Content-Type", value: "application/json")], body: jsonData, completion: { result in
            switch result{
            case.success(let data):
                guard let tokenResponse = try?  Token.decoder.decode(ServiceResponse<Token>.self, from: data) else { return fail(APIError.unhandledResponse)}
                UserDefaultsManager.saveAuthTokens(tokens: tokenResponse.response)
                success()
            case .failure(let error):
                fail(error)
            }
        })
        apiClient.send(request!)
    }
    
    func refreshToken( success: @escaping () -> Void, fail: @escaping (Error?) -> Void) {
        
        let token = UserDefaultsManager.getRefreshToken()
        guard let jsonData = try? JSONEncoder().encode(token) else { return fail(APIError.encodingError)}
        
        request = Request.get(method: .post, path: "/api/v1/authentication/token/refresh", queryItems: nil, headers: [HTTPHeader(key: "Content-Type", value: "application/json")], body: jsonData, completion: { result in
            switch result {
            case.success(let data):
                guard let tokenResponse = try?  Token.decoder.decode(ServiceResponse<Token>.self, from: data) else { return fail(APIError.unhandledResponse)}
                UserDefaultsManager.saveAuthTokens(tokens: tokenResponse.response)
                success()
            case .failure(let error):
                UserDefaultsManager.dropTokens()
                fail(error)
            }
        })
        apiClient.send(request!)
    }
}
