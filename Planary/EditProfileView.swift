//
//  EditProfileView.swift
//  Planary
//
//  Created by A667156 A667156 on 10/6/2566 BE.
//

import SwiftUI
import Firebase
import FirebaseStorage
import Combine
struct EditProfileView: View {
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State var StatusMessage = ""
    @State private var showAlert = false
    
    @AppStorage("name") var name = ""
    
    @AppStorage("day") var day = ""
    @AppStorage("month") var month = ""
    @AppStorage("year") var year = ""
    
    @AppStorage("goal") var goal = 0
    @AppStorage("gender") var gender = 0
    @AppStorage("diet") var diet = 0
    
    @AppStorage("selection") var selection = 0
    
    
    @AppStorage("selectedFeetIndex") var selectedFeetIndex: Int = 3
    @AppStorage("selectedInchesIndex") var selectedInchesIndex: Int = 6
 
    
    @AppStorage("selectedCentimeterIndex") var selectedCentimeterIndex = 60
    
    @AppStorage("selectedPoundIndex") private var selectedPoundIndex = 60
    @AppStorage("selectedKilogramIndex") var selectedKilogramIndex = 60
    
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
                    NavigationLink(destination: EditNameView() ){
                        RoundedRectangle(cornerRadius: 10)
                                       .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                       .frame(width: .infinity, height: 50)
                                       
                                       .overlay(
                                           ZStack {
                                               Text("Name")
                                                   .font(.headline.weight(.bold))
                                                   .frame(maxWidth: .infinity,alignment: .leading)
                                                   .padding(.leading,20)
                                               Text(name)
                                                   .font(.body)
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,50)
                                               Image(systemName: "chevron.right")
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,20)
                                           }
                                            .foregroundColor(Color.white)
                                       )
                                       .shadow(radius: 4)
                                       .padding([.top, .leading, .trailing],20)
                                       
                    }
                    NavigationLink(destination: EditNameView() ){
                        RoundedRectangle(cornerRadius: 10)
                                       .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                       .frame(width: .infinity, height: 50)
                                       
                                       .overlay(
                                           ZStack {
                                               Text("Birthdate")
                                                   .font(.headline.weight(.bold))
                                                   .frame(maxWidth: .infinity,alignment: .leading)
                                                   .padding(.leading,20)
                                               Text("")
                                                   .font(.body)
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,50)
                                               Image(systemName: "chevron.right")
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,20)
                                           }
                                            .foregroundColor(Color.white)
                                       )
                                       .shadow(radius: 4)
                                       .padding([.leading, .trailing],20)
                                       .padding(.top,10)
                        
                    }
                    NavigationLink(destination: EditNameView() ){
                        RoundedRectangle(cornerRadius: 10)
                                       .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                       .frame(width: .infinity, height: 50)
                                       
                                       .overlay(
                                           ZStack {
                                               Text("Sex")
                                                   .font(.headline.weight(.bold))
                                                   .frame(maxWidth: .infinity,alignment: .leading)
                                                   .padding(.leading,20)
                                               Text(String(gender==0 ? "Female" : "Male"))
                                                   .font(.body)
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,50)
                                               Image(systemName: "chevron.right")
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,20)
                                           }
                                            .foregroundColor(Color.white)
                                       )
                                       .shadow(radius: 4)
                                       .padding([.leading, .trailing],20)
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


struct EditNameView: View {
    @AppStorage("name") var name = ""
    @AppStorage("day") var day = ""
    @AppStorage("month") var month = ""
    @AppStorage("year") var year = ""
    @AppStorage("gender") var gender = 0
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Text("Need to change")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top,60)
                Text("your name?")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color(hex: 0xFFEB3800))
                    .padding(.bottom, 1.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Tap save change to keep your name.")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Add your name",text: $name)
                    .preferredColorScheme(.light)
                    .padding(20)
                
                    .font(.custom("Poppins-SemiBold", size: 15))
                
                    .foregroundColor(Color.red)
                    .accentColor(Color(hex: 0xFFEB3800))
                    .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(Color(hex: 0xFFD9D9D9))
                
                Button{
                    print("frank")
                }label:
                {
                    Text("Save Change")
                        .font(.custom("Inter-Regular_Bold", size: 16))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color(hex: 0xFFEB3800))
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                }
                .offset(y: 350)
                Spacer()
                
                
            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
        .ignoresSafeArea()
        .tag(0)
        .contentShape(Rectangle())
        .gesture(DragGesture())
        
    }
}
