//
//  JailbreakChecker.swift
//  Driver
//
//  Created by Turan Çabuk on 26.02.2023.
//

import Foundation

import UIKit

import UIKit

/// This class contains functions that check whether the device that wants to login to the application has a jailbreak or not.
class JailbreakChecker {
    
    /**
     This function checks whether the device that wants to login contains jailbreak libraries and returns a Bool value.
     ## Important Notes ##
     This func returns a Bool value to allow or block the device in the appDelegate.
     */
    func isJailbroken() -> Bool {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            fileManager.fileExists(atPath: "/bin/bash") ||
            fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
            fileManager.fileExists(atPath: "/etc/apt") ||
            fileManager.fileExists(atPath: "/private/var/lib/apt/") ||
            fileManager.fileExists(atPath: "/Applications/FakeCarrier.app") ||
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/DynamicLibraries/Veency.plist") ||
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist") ||
            fileManager.fileExists(atPath: "/private/var/stash")
        {
            return false
        }
        return true
    }
    func performAction() {
        if isJailbroken() {
            print("Unable to operate on jailbroken device")
            return
        }
        // Resume on non-jailbroken device
    }
}
