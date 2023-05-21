//
//  Request.swift
//  AfetYönetimSistemi
//
//  Created by Tolga Taner on 3.06.2021.
//


import Foundation

/// This is a struct to request  for any data from the web service.
struct Request {
    let builder: RequestBuilder
    let completion: (Result<Data, APIError>) -> Void
    
    /**
      Initialize a request object with builder and completion parameters.
     - parameters:
     - RequestBuilder builder
     - @escaping (Result<Data, APIError>) -> Void completion
     */
    init(builder: RequestBuilder,
         completion: @escaping (Result<Data, APIError>) -> Void) {
        self.builder = builder
        self.completion = completion
    }
    
    /**
     It sends a get request to the web service.
     - parameters:
     - RequestBuilder builder
     - @escaping (Result<Data, APIError>) -> Void completion
     */
    static func get(method: HTTPMethod = .get,
                    path: String,
                    queryItems: [URLQueryItem]?,
                    headers: [HTTPHeader]?,
                    body: Data? = nil,
                    completion: @escaping (Result<Data, APIError>) -> Void) -> Request {
        let builder = GetRequestBuilder(method: method,
                                        headers: headers,
                                        body: body,
                                        endpoint: Endpoint(path: path,
                                                           queryItems: queryItems ?? nil))
        return Request(builder: builder, completion: completion)
    }
    
}

/**
 Decodes  response data model.
 - parameters:
 - model: M.Type where M == Model
 - completion:  @escaping (Result<M, APIError>) -> Void
 */
extension Result where Success == Data, Failure == APIError {
    func decoding<M: Model>(_ model: M.Type,
                            completion: @escaping (Result<M, APIError>) -> Void) {
        DispatchQueue.global().async {
            let result = self.flatMap { data -> Result<M, APIError> in
                do {
                    let decoder = M.decoder
                    let model = try decoder.decode(M.self, from: data)
                    return .success(model)
                } catch let e as DecodingError {
                    return .failure(.decodingError(e))
                } catch {
                    return .failure(APIError.unhandledResponse)
                }
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
