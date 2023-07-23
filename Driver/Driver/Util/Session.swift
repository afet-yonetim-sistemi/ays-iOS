//
//  Session.swift
//  Driver
//
//  Created by Fatih Doğan on 20.06.2023.
//

import Foundation

class Session {
    static let shared = Session()
    var institutionId: String = ""
    var userLastName: String = ""
    var roles: [String] = []
    var userType: String = ""
    var userFirstName: String = ""
    var username: String = ""
}

extension Session {
    static func saveSessionData(dict: [String: Any]) {
        let session = Session.shared
        session.institutionId = (dict["institutionId"] as? String) ?? ""
        session.userFirstName = (dict["userFirstName"] as? String) ?? ""
        session.userLastName = (dict["userLastName"] as? String) ?? ""
        session.username = (dict["username"] as? String) ?? ""
        session.userType = (dict["userType"] as? String) ?? ""
        session.userLastName = (dict["userLastName"] as? String) ?? ""
        session.roles = (dict["roles"] as? [String]) ?? []
    }
}
