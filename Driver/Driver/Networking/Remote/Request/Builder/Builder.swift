//
//  Builder.swift
//  AfetYönetimSistemi
//
//  Created by Tolga Taner on 3.06.2021.
//

import Foundation

struct GetRequestBuilder: RequestBuilder {
    var method: HTTPMethod
    var headers: [HTTPHeader]?
    var body: Data?
    var endpoint: Endpoint
    
}

