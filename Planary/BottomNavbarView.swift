//
//  ContentView.swift
//  Planary
//
//  Created by Pisit Jaiton on 7/6/2566 BE.
//

import SwiftUI
class UserData: ObservableObject {
    @Published var name: String = ""
}
struct BottomNavbarView: View {
    init() {
        // Customize the appearance of the TabView
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(cgColor: CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
                    
            VStack {
                TabView {
                            HomeView()
                                .tabItem {
                                    Label("Today", systemImage: "house")
                                }
                            ExploreView()
                                .tabItem {
                                    Label("Explore", systemImage: "binoculars.fill")
                                }
//                            JournalView()
//                                .tabItem {
//                                    Label("Journal", systemImage: "book.closed.fill")
//                                }
                            ProfileView()
                                .tabItem {
                                    Label("Profile", systemImage: "person.crop.circle.fill")
                                }
                        }
                
                .accentColor(Color(cgColor: CGColor(red: 0.722, green: 0.235, blue: 0.08, alpha: 1)))
            } // Set the color for selected tab item
                }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        
       

    }
}

struct BottomNavbarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavbarView()
    }
}
