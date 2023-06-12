//
//  ContentView.swift
//  Planary
//
//  Created by Pisit Jaiton on 7/6/2566 BE.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import Firebase

struct ContentView: View {
    @AppStorage("uuid") var uuid = ""
//    @State private var showSignupView = false
    var body: some View {
        ZStack{
            Color(CGColor(red: 0.96, green: 0.0, blue: 0.0, alpha: 1.0))
            VStack{
                Text("Planary").font(.custom("Poppins-SemiBold", size: 38))
                    .foregroundColor(Color.white)
                Text("Your new Diet journey.").font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color.white)
                    .padding(.top, -30.0)
                
            }
            .offset(x:0,y:-100)
            VStack{
                Button(action: {
                    print("sds")
                   
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
                    guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                    // Create Google Sign In configuration object.
                    let config = GIDConfiguration(clientID: clientID)
                    GIDSignIn.sharedInstance.configuration = config

                    // Start the sign in flow!
                    GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) {  result, error in
                      guard error == nil else {
                        // ...
                          return
                      }

                      guard let user = result?.user,
                        let idToken = user.idToken?.tokenString
                                
                      else {
                          return
                      }

                      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                     accessToken: user.accessToken.tokenString)

                        Auth.auth().signIn(with: credential){result, error in
                            guard error == nil else {
                                return
                            }
        
                            print("Sign IN")
                            uuid = (result?.user.uid)!
                            UserDefaults.standard.set(true, forKey: "signIn")
                        }
                    }
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
            .offset(x:0,y:300)
            
        }.ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

