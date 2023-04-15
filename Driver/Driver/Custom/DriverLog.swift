//
//  DriverLog.swift
//  Driver
//
//  Created by Fatih Doğan on 26.02.2023.
//

import Foundation

/// This is a class to prevent the print method from negatively affecting the application.
class DriverLog: NSObject {
    public static func print(_ item:Any?){
        #if DEBUG
            if let logItem = item{
                Swift.print(logItem)
            }
        #endif
    }
}
