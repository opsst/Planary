//
//  SignupView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI


struct SignupView: View {
    @State var name: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, \(name)!")
                TextField("Enter your name", text: $name)
                
                NavigationLink(destination: SecondView(name: self.$name)){
                    Text("Next")
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SecondView: View {
 @Binding var name: String
 @State var age: String = ""
  var  body: some View {
      VStack {
          Text("Hello, \(name)!")
          TextField("Enter your age", text: $age)
          
          NavigationLink(destination: ThirdView(name: $name, age: self.$age)){
              Text("Next")
          }
      }
      .navigationBarBackButtonHidden()
      .navigationBarTitleDisplayMode(.inline)
      
  }
 }

struct ThirdView: View {
 @Binding var name: String
 @Binding var age: String
  var  body: some View {
      VStack {
          Text("Name: \(name)")
          Text("Age: \(age)")
//          TextField("Enter your age", text: $age)
          
          NavigationLink(destination: BottomNavbarView()){
              Text("End")
          }
      }
      .navigationBarBackButtonHidden()
      .navigationBarTitleDisplayMode(.inline)
  }
 }

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
