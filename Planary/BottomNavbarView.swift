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
    
    var body: some View {
        ZStack{
            TabView{
                HomeView()
                    .tabItem(){
                        Image(systemName: "house")
                        Text("Today")
                    }
                ExploreView()
                    .tabItem(){
                        Image(systemName: "binoculars.fill")
                        Text("Explore")
                    }
                JournalView()
                    .tabItem(){
                        Image(systemName: "book.closed.fill")
                        Text("Journal")
                    }
                ProfileView()
                    .tabItem(){
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
        }
            
        
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavbarView()
    }
}
