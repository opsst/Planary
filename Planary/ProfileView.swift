//
//  ProfileView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color.white)
                        .frame(width: .infinity, height: 160)
                    RoundedRectangle(cornerRadius: 360)
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 150.0)
                    
                    
                }.padding(.top, 50.0)
                    .padding(20)
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20)
                Spacer()
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20)
                Spacer()
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20)
                Spacer()
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20)
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.top)
            .padding(.vertical)
            .overlay(
                ZStack{
                    Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
                    
                    Text("Profile")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                    Image(systemName: "bookmark")
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding(.trailing,20)
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                   
                   
                }
                    .frame(height: 110)
                    .frame(maxHeight: .infinity,alignment: .top)
                    
                    .edgesIgnoringSafeArea(.top)
                    
                    
        )
        
       

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
