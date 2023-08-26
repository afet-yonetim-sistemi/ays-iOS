//
//  RequestBuilder.swift
//  AfetYönetimSistemi
//
//  Created by Tolga Taner on 3.06.2021.
//

import Foundation

protocol RequestBuilder {
    var method: HTTPMethod { get }
    var endpoint: Endpoint { get }
    var headers: [HTTPHeader]? { get }
    var body: Data? { get }
    func toURLRequest() -> URLRequest?
}

extension RequestBuilder {
    func toURLRequest() -> URLRequest? {
        guard let url = endpoint.url else { return nil }
        var request = URLRequest(url: url)
        if let headers {
            headers.forEach({request.setValue($0.value, forHTTPHeaderField: $0.key)})
        }
        if let body {
            request.httpBody = body
        }
        request.httpMethod = method.rawValue.uppercased()
        return request
    }
}
