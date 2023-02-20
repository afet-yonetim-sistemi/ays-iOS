//
//  Reusable.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

protocol Reusable {
  static var identifier: String {get}
}

extension Reusable {
  static var identifier: String {
    return String(describing: self)
  }
}
