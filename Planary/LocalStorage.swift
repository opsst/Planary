//
//  LocalStorage.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import Foundation

class LocalStorage {
     
    private static let myKey: String = "myKey"
     
    public static var myValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: myKey)
        }
        get {
            return UserDefaults.standard.string(forKey: myKey) ?? ""
        }
    }
     
    public static func removeValue() {
        UserDefaults.standard.removeObject(forKey: myKey)
    }
     
}
