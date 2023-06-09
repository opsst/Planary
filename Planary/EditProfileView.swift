//
//  EditProfileView.swift
//  Planary
//
//  Created by A667156 A667156 on 10/6/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseStorage
struct EditProfileView: View {
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    var body: some View {
        NavigationView {
            ZStack{
                Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
                VStack{
                    RoundedRectangle(cornerRadius: 360)
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 0)
                        .overlay(
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.bottom, 0)
                                .foregroundColor(Color.white)
                        ).padding(.top,100)
                    Text("Add Profile Photo")
                        .font(.system(size: 18).weight(.bold))
                        .foregroundColor(Color(CGColor(red: 0.96, green: 0.0, blue: 0.0, alpha: 1.0)))
                        .padding(.top,10)
                    Spacer()
                    
                   
                }
                ZStack{
                    Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
//                        Image(systemName: "arrow.backward")
//                            .frame(maxWidth: .infinity,alignment: .leading)
//                            .padding(.leading,20)
//                            .foregroundColor(Color.white)
//                            .padding(.top,60)
                    Text("My Profile")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                    Text("Save")
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .font(.system(size: 18).weight(.bold))
                        .padding(.trailing,20)
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                        .onTapGesture {
                            
                        }
                    
                   
                   
                }
                    .frame(height: 110)
                    .frame(maxHeight: .infinity,alignment: .top)

                    .edgesIgnoringSafeArea(.top)
            }
        }
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
