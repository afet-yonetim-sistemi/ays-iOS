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
        
        let body: [String: Any] = ["username": username,
                    "password": password]
       
        let data =  try? JSONSerialization.data(withJSONObject: body)
        
        request = Request.get(method: .post, path: "/api/v1/authentication/token", queryItems: nil, headers: [HTTPHeader(key: "Content-Type", value: "application/json")], body: data, completion: { result in
            switch result{
            case.success(let data):
                guard let tokenResponse = try?  TokenResponse.decoder.decode(TokenResponse.self, from: data) else { return fail(APIError.unhandledResponse)}
                TokenManager.shared.accessToken = tokenResponse.response.accessToken
                TokenManager.shared.refreshToken = tokenResponse.response.refreshToken
                success()
            case .failure(let error):
                fail(error)
            }
        })
        apiClient.send(request!)
    }
    
}
