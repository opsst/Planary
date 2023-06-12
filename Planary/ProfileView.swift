//
//  ProfileView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseStorage
import GoogleSignIn
import FirebaseAuth

struct ProfileView: View {
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State private var isTapped = false
    @AppStorage("imageData") var imageData: String = ""
    @AppStorage("name") var name = ""
    @State private var showLogoutAlert = false
    let radius: CGFloat = CGFloat(10)
    var body: some View {
        NavigationView {
            ZStack {
                Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
                VStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                            .frame(width: .infinity, height: 160)
                            .overlay(
                                Text(name)
                                    .font(.system(size: 25,weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                            )
                        
                        NavigationLink(destination: EditProfileView()) {
                            if let image = self.image {
                                RoundedRectangle(cornerRadius: 360)
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(Color.gray)
                                    .padding(.bottom, 150.0)
                                    .overlay(
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(360)
                                            .scaledToFill()
                                            .foregroundColor(Color.white)
                                            .padding(.bottom, 150.0)
                                        
                                        
                                        
                                    )
                            }else{
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
                            }
                            
                        }.onAppear {
                            // Decode the Base64-encoded image data and create a UIImage
                            if let decodedData = Data(base64Encoded: imageData),
                               let decodedImage = UIImage(data: decodedData) {
                                self.image = decodedImage
                            }
                        }
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
                        
                    }
                    .padding(.top, 70.0)
                    .padding(20)
                    
                    
                    
                    
                    NavigationLink(destination: SettingView() ){
                        Rectangle()
                            .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                            .frame(width: .infinity, height: 50)
                            .padding(.bottom, radius)
                            .cornerRadius(radius)
                            .padding(.bottom, -radius)
                            .overlay(
                                ZStack {
                                    Image(systemName: "gearshape")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,20)
                                    Text("Setting")
                                        .font(.headline.weight(.bold))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,50)
                                    Image(systemName: "chevron.right")
                                        .frame(maxWidth: .infinity,alignment: .trailing)
                                        .padding(.trailing,20)
                                }
                                    .foregroundColor(Color.white)
                            )
                            .padding([.leading, .trailing],20)
                        
                        
                    }
                    NavigationLink(destination: HistoryView() ){
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                            .frame(width: .infinity, height: 50)
                            .overlay(
                                ZStack {
                                    Image(systemName: "books.vertical")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,20)
                                    Text("History")
                                        .font(.headline.weight(.bold))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,50)
                                    Image(systemName: "chevron.right")
                                        .frame(maxWidth: .infinity,alignment: .trailing)
                                        .padding(.trailing,20)
                                }
                                    .foregroundColor(Color.white)
                            )
                            .padding([.leading, .trailing],20)
                        
                        
                    }
                    NavigationLink(destination: InformationView() ){
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                            .frame(width: .infinity, height: 50)
                            .overlay(
                                ZStack {
                                    Image(systemName: "info.circle")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,20)
                                    Text("Information")
                                        .font(.headline.weight(.bold))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,50)
                                    Image(systemName: "chevron.right")
                                        .frame(maxWidth: .infinity,alignment: .trailing)
                                        .padding(.trailing,20)
                                }
                                    .foregroundColor(Color.white)
                            )
                            .padding([.leading, .trailing],20)
                        
                        
                    }
                    
                        Rectangle()
                            .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                            .frame(width: .infinity, height: 50)
                            .padding(.top, radius)
                            .cornerRadius(radius)
                            .padding(.top, -radius)
                            .overlay(
                                ZStack {
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,20)
                                    Text("Logout")
                                        .font(.headline.weight(.bold))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,50)
                                    Image(systemName: "chevron.right")
                                        .frame(maxWidth: .infinity,alignment: .trailing)
                                        .padding(.trailing,20)
                                }
                                    .foregroundColor(Color.orange)
                            )
                            .padding([.leading, .trailing],20)
                            .onTapGesture {
                            showLogoutAlert = true

                              }.alert(isPresented: $showLogoutAlert) {
                            // Create and return the Alert view
                            Alert(
                                title: Text("Logout from Planary?"),
//                                message: Text("Confirmation ?"),
                                primaryButton: .destructive(Text("Yes, Logout")) {
                                    // Perform action if user confirms
                                    
                                    do {
                                        try Auth.auth().signOut()
                                        UserDefaults.standard.set(false, forKey: "signIn")
                                        UserDefaults.standard.set(false, forKey: "haveInfo")
                                        // User successfully signed out
                                    } catch let signOutError as NSError {
                                        // An error occurred while signing out
                                        print("Error signing out: \(signOutError.localizedDescription)")
                                    }


                                },
                                secondaryButton: .cancel()
                            )
                        }
                        Spacer()
                        
                    }
                
            }.edgesIgnoringSafeArea(.top)
                .padding(.top)
                
               
                .overlay(ZStack{
                    Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
                    Text("Profile")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color.white)
                        .padding(.top,60)
//                    Image(systemName: "gearshape")
//                        .frame(maxWidth: .infinity,alignment: .trailing)
//                        .padding(.trailing,20)
//                        .foregroundColor(Color.white)
//                        .padding(.top,60)
                }
                        .frame(height: 110)
                        .frame(maxHeight: .infinity,alignment: .top)

                        .edgesIgnoringSafeArea(.top))
        }
        
        
       

    }
//    private func persistImageToStorage() {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let ref = Storage.storage().reference(withPath: uid)
//        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
//        ref.putData(imageData, metadata: nil) { metadata, err in
//            if let err = err {
//                self.StatusMessage = "Failed to push image to Storage: \(err)"
//                return
//            }
//
//            ref.downloadURL { url, err in
//                if let err = err {
//                    self.StatusMessage = "Failed to retrieve downloadURL: \(err)"
//                    return
//                }
//
//                self.StatusMessage = "Successfully stored image with url: \(url!.absoluteString)"
//                print(url!.absoluteString)
//            }
//        }
//    }
}

struct SettingView : View{
    var body: some View{
        Text("ho")
    }
}

struct HistoryView : View{
    var body: some View{
        Text("ho")
    }
}

struct InformationView : View{
    var body: some View{
        Text("ho")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
