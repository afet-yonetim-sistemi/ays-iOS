//
//  AppContainer.swift
//  AfetYönetimSistemi
//
//  Created by Fatih Doğan on 14.02.2023.
//

import Foundation

let appContainer = AppContainer()
let apiManager = APIManager()

final class AppContainer {
    let router = AppRouter()
}
