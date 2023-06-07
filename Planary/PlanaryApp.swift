//
//  PlanaryApp.swift
//  Planary
//
//  Created by Pisit Jaiton on 7/6/2566 BE.
//

import SwiftUI

@main
struct PlanaryApp: App {
    
    init(){
        print("hi")
        printFonts()
    }
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        
        for familyName in fontFamilyNames{
            print("-------------")
            print("Font Family name -> [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font name -> \(names)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            BottomNavbarView()
        }
    }
}
