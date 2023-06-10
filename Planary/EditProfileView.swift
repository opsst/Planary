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
    @State var StatusMessage = ""
    @State private var showAlert = false
    var body: some View {
        NavigationView {
            ZStack{
                Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
                VStack{
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        if let image = self.image {
                            RoundedRectangle(cornerRadius: 360)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.gray)
                                .padding(.bottom, 0)
                                .overlay(
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(64)
                                        .padding(.bottom, 0)
                                        .foregroundColor(Color.white)
                                ).padding(.top,100)
                        } else {
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
                        }
                    }
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        Text("Add Profile Photo")
                            .font(.system(size: 18).weight(.bold))
                            .foregroundColor(Color(CGColor(red: 0.96, green: 0.0, blue: 0.0, alpha: 1.0)))
                        .padding(.top,10)
                    }
                    Spacer()
                    
                   
                }.fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                        .ignoresSafeArea()
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
                            persistImageToStorage()
                            showAlert.toggle()
                            
                        } .alert(isPresented: $showAlert) {
                            Alert(title: Text("Alert"), message: Text(self.StatusMessage), dismissButton: .default(Text("OK")))
                        }
                    
                   
                   
                }
                    .frame(height: 110)
                    .frame(maxHeight: .infinity,alignment: .top)

                    .edgesIgnoringSafeArea(.top)
            }
        }
    }
    private func persistImageToStorage() {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let ref = Storage.storage().reference(withPath: uid)
            guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
            ref.putData(imageData, metadata: nil) { metadata, err in
                if let err = err {
                    self.StatusMessage = "Failed to push image to Storage: \(err)"
                    return
                }
     
                ref.downloadURL { url, err in
                    if let err = err {
                        self.StatusMessage = "Failed to retrieve downloadURL: \(err)"
                        return
                    }
     
                    self.StatusMessage = "Successfully stored image with url: \(url!.absoluteString)"
                    print(url!.absoluteString)
                }
            }
        }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
