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

    func toURLRequest() -> URLRequest?
}

extension RequestBuilder {
    func toURLRequest() -> URLRequest? {
        guard let url = endpoint.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        return request
    }
}
