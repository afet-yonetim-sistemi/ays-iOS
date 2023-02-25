//
//  Reusable.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation
/// This is a class to contain utility methods
protocol Reusable {
  static var identifier: String { get }
}

extension Reusable {
  static var identifier: String {
    String(describing: self)
  }
}
