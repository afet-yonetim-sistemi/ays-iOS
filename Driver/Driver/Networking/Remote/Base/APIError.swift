//
//  APIError.swift
//  AfetYönetimSistemi
//
//  Created by Tolga Taner on 3.06.2021.
//

import Foundation

/// This is an enum to handle upcoming error from the web service.
enum APIError: Error {
    case unknownResponse
    case serverError(Int)
    case decodingError(DecodingError)
    case networkError(Error)
    case unhandledResponse

    var message: String {
        switch self {
        case .decodingError: return "Geliştirici ile iletişime geçiniz."
        case .serverError: return "Servis hatası. Lütfen daha sonra tekrar deneyiniz."
        case .unknownResponse, .unhandledResponse: return "Bilinmeyen bir hata ile karşılaşıldı. Lütfen sonra tekrar deneyiniz."
        case .networkError(let error): return error.localizedDescription
        }
    }
}
/// This is an extension of APIError to convert upcoming response, URLResponse object to specific error.
extension APIError {
    static func error(from response: URLResponse?) -> APIError? {
        guard let http = response as? HTTPURLResponse
        else {
            return .unknownResponse
        }
        switch http.statusCode {
        case 200: return nil
        case 500: return .serverError(http.statusCode)
        default: return .unhandledResponse
        }
    }
}
