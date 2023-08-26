//
//  APIClient.swift
//  AfetYönetimSistemi
//
//  Created by Tolga Taner on 3.06.2021.
//

import Foundation
/// This is an enum to define HTTP method that is needed when request to the web service.
enum HTTPMethod: String {
    case get
    case post
}
/// This is a struct that contains a session during the handshaking.
struct APIClient {
    private let session: URLSession
    private let queue: DispatchQueue = DispatchQueue(label: Key.label.rawValue, qos: .userInitiated)

    private enum Key: String {
        case label = "AfetYönetimSistemi"
    }

    init(configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
        session = URLSession(configuration: configuration)
    }
    /**
     It sends a request to the web service that is created before.
     ## Important Notes ##
     It sends a request at a time.
     - parameters:
     -request: Request
     */
    func send(_ request: Request) {
        guard let urlRequest = request.builder.toURLRequest() else {
            fatalError("Make sure that expected url request is created successfully.")
        }
        queue.async {
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                let result: Result<Data, APIError>
                if let error = error {
                    result = .failure(.networkError(error))
                }
                else if let apiError = APIError.error(from: response) {
                    result = .failure(apiError)
                }
                else {
                    result = .success(data ?? Data())
                }
                DispatchQueue.main.async {
                    request.completion(result)
                }
            }
            task.resume()
        }
    }
}

