//
//  GenericError.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import Foundation

enum GenericError: Error {
    case emptyTextField
    var errorDescription: String {
        switch self {
        case.emptyTextField:
            return "Bütün kutucuklar eksiksiz doldurulmalıdır"
        }
    }
}
