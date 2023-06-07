//
//  ContentView.swift
//  Planary
//
//  Created by Pisit Jaiton on 7/6/2566 BE.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        ZStack{
            Color(CGColor(red: 0.96, green: 0.0, blue: 0.0, alpha: 1.0))
            VStack{
                Text("Planary").font(.custom("Poppins-SemiBold", size: 38))
                    .foregroundColor(Color.white)
                Text("Your new Diet journey.").font(.custom("Poppins-SemiBold", size: 14))
                    .foregroundColor(Color.white)
                    .padding(.top, -30.0)
                
            }
            .padding(.bottom, 260)
            VStack{
                Button(action: {
                    print("sds")
                    // Action to perform when the button is tapped
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100.0)
                            .foregroundColor(.blue)
                            .frame(width: 350, height: 60)
                        HStack(alignment: .center){
                            AsyncImage(url: URL(string: "https://assets.stickpng.com/images/60fea6c83d624000048712b7.png")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                    
                            .frame(width: 35, height: 35)
                            .padding(.leading, 50.0)
                        
                            Spacer()
                            
                            Text("Continue with Facebook")
                                .foregroundColor(.white)
                                .font(.custom("Inter-Regular_Bold", size: 16))
                                .padding(.trailing, 40.0)
                            
                            Spacer()
                        }
                        }
                
                }
                Button(action: {
                    print("sds")
                    // Action to perform when the button is tapped
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100.0)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 60)
                        HStack(alignment: .center){
                            AsyncImage(url: URL(string: "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                    
                            .frame(width: 35, height: 35)
                            .padding(.leading, 50.0)
                        
                            Spacer()
                            
                            Text("Continue with Google")
                                .foregroundColor(.black)
                                .font(.custom("Inter-Regular_Bold", size: 16))
                                .padding(.trailing, 40.0)
                            
                            Spacer()
                        }
                        }
                
                }
                HStack(spacing: 0){
                    Text("By Signing up, you agree to our Terms. See how we use your data in our Privacy Policy.")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("Inter-Regular_Medium", size: 12))
                        .onTapGesture {
                            if let url = URL(string: "https://www.google.com") {
                                                UIApplication.shared.open(url)
                                            }
                        }
                }
                .padding(.top)
                .padding([.leading, .trailing], 50.0)
                
                
            }
            .padding(.top, 500)
            
        }.ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

