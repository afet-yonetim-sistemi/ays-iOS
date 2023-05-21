//
//  ServiceResponse.swift
//  Driver
//
//  Created by Fatih Doğan on 17.05.2023.
//

import Foundation

struct ServiceResponse<T:Codable>: Codable {
    var response: T
}
