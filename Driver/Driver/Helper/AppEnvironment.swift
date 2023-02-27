//
//  AppEnvironment.swift
//  Driver
//
//  Created by Fatih Doğan on 27.02.2023.
//

import Foundation

/// AppEnvironment enum reads the settings bundle and change environment according to the user's preference
enum AppEnvironment: String {
    case production, development
    
    var url: String {
        // FIXME: Change after servis deploy
        switch self {
        case .development:
            return "https://development.base.url/"
        case .production:
            return "https://production.base.url/"
        }
    }
    
    static var selected: AppEnvironment {
         /**
          Production is default value for fail safe
          */
             let defaultValue = AppEnvironment.production
             if let environment = UserDefaults.standard.string(forKey: "environment") {
               return AppEnvironment(rawValue: environment) ?? defaultValue
             }
             return defaultValue
    }
    #warning("Fatih: We must change default host and scheme after service url deploy")
    static var host: String {
        URLComponents(string: selected.url)?.host ?? "production.base.url"
    }
    static var scheme: String {
        URLComponents(string: selected.url)?.scheme ?? "https"
    }
}
