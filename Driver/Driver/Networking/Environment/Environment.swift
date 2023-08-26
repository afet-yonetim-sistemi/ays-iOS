//
//  Environment.swift
//  Driver
//
//  Created by Tolga Taner on 25.02.2023.
//

import Foundation
/// This is a struct to contain scheme and host depends on the environment.
struct Environment {
    var scheme: String = AppEnvironment.scheme
    var host: String = AppEnvironment.host
}

