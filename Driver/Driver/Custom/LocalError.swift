//
//  LocalError.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import Foundation

enum LocalError: Error {
    case emptyTextField
    var errorDescription: String {
        switch self {
        case.emptyTextField:
            return "Bu alan boş olmamalıdır."
        }
    }
}
