//
//  Endpoint.swift
//  AfetYönetimSistemi
//
//  Created by Tolga Taner on 3.06.2021.
//

import Foundation

/// This is a struct  to define an endpoint.
struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem]?
    let environment: Environment = Environment()
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = environment.scheme
        components.host = environment.host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}

