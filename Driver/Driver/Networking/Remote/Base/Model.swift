//
//  Model.swift
//  AfetYönetimSistemi
//
//  Created by Tolga Taner on 3.06.2021.
//

import Foundation
/// This is a protocol to conform serialization or deserialization to the object.
protocol Model: Codable {
    static var decoder: JSONDecoder { get }
    static var encoder: JSONEncoder { get }
}
/// This is an extension that specify the decoder and the encoder.
extension Model {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    static var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        return encoder
    }
}
