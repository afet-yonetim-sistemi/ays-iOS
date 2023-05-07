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
            return "http://ec2-18-159-211-214.eu-central-1.compute.amazonaws.com/"
        case .production:
            return "https://production.base.url/"
        }
    }
    
    private static var selected: AppEnvironment {
         /**
          Production is default value for fail safe
          */
        guard let environment = UserDefaults.standard.string(forKey: "environment") else {
            return .production
        }
        return AppEnvironment(rawValue: environment) ?? .production
    }
    #warning("Fatih: We must change default host and scheme after service url deploy")
    static var host: String {
        URLComponents(string: selected.url)?.host ?? "production.base.url"
    }
    static var scheme: String {
        URLComponents(string: selected.url)?.scheme ?? "https"
    }
}
