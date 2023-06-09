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
            Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                        .frame(width: .infinity, height: 160)
                        .overlay(
                                Text("Account Name")
                                    .font(.system(size: 25,weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                            )
                    RoundedRectangle(cornerRadius: 360)
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 150.0)
                        .overlay(
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .padding(.bottom, 150.0)
                                    .foregroundColor(Color.white)
                            )
                    RoundedRectangle(cornerRadius: 360)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                        .padding(.bottom, 90.0)
                        .padding(.leading, 70)
                        .overlay(
                                Image(systemName: "pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 10)
                                    .padding(.bottom, 90.0)
                                    .padding(.leading, 70)
                                    .foregroundColor(Color.white)
                                    
                            )
                    
                    
                }.padding(.top, 50.0)
                    .padding(20)
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20)
                    .foregroundColor(Color.white)
                Spacer()
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20).foregroundColor(Color.white)
                Spacer()
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20).foregroundColor(Color.white)
                Spacer()
                HStack{
                    Image(systemName: "gear")
                    Text("setting")
                    Spacer()
                    Image(systemName: "greaterthan")
                        .padding(.trailing,25)
                }.padding(.leading,20).foregroundColor(Color.white)
                Spacer()
                
            }
        }.edgesIgnoringSafeArea(.top)
            .padding(.top)
            .overlay(
                ZStack{
                    Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
                    
                    Text("Profile")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                    Image(systemName: "gearshape")
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
