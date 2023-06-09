//
//  PlanaryApp.swift
//  Planary
//
//  Created by Pisit Jaiton on 7/6/2566 BE.
//`

import SwiftUI


@main
struct PlanaryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var Delegate
    @AppStorage("signIn") var isSignIn = false
    @AppStorage("haveInfo") var isInfo = false

    init(){
//        print("hi")
//        printFonts()

    }
    
//    func printFonts() {
//        let fontFamilyNames = UIFont.familyNames
//
//        for familyName in fontFamilyNames{
//            print("-------------")
//            print("Font Family name -> [\(familyName)]")
//            let names = UIFont.fontNames(forFamilyName: familyName)
//            print("Font name -> \(names)")
//        }
//    }
    
    var body: some Scene {
        WindowGroup {
            if !isSignIn {
                ContentView()
                    .preferredColorScheme(.light)
                    .transition(.slide) // Apply a slide animation when transitioning
                    .animation(.easeInOut(duration: 0.3)) // Set the animation duration and easing
            } else if !isInfo {
                UserSignupView()
                    .preferredColorScheme(.light)
                    .transition(.slide)
                    .animation(.easeInOut(duration: 0.3))
            } else {
                BottomNavbarView()
                    .preferredColorScheme(.light) 
                    .transition(.slide)
                    .animation(.easeInOut(duration: 0.3))
            }
        }
    }
}
