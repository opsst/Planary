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
import SDWebImageSwiftUI
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
    
    @AppStorage("uuid") var uuid = ""
    
    @AppStorage("imageData") var imageData: String = ""
    
    let radius: CGFloat = CGFloat(10)
    @AppStorage("selectedFeetIndex") var selectedFeetIndex: Int = 3
    @AppStorage("selectedInchesIndex") var selectedInchesIndex: Int = 6
    @AppStorage("selectedCentimeterIndex") var selectedCentimeterIndex = 60
    
    
    @AppStorage("selectedPoundIndex") private var selectedPoundIndex = 60
    @AppStorage("selectedKilogramIndex") var selectedKilogramIndex = 60
    @State var url = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ZStack{
                Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
                VStack(spacing: 0){
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
                                    )
                            }
                    }.onAppear {
                        // Decode the Base64-encoded image data and create a UIImage
                        if let decodedData = Data(base64Encoded: imageData),
                           let decodedImage = UIImage(data: decodedData) {
                            self.image = decodedImage
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
//                                       .shadow(radius: 4)
                                       .padding([.top, .leading, .trailing],20)
                                       
                    }
                    Text("Private Information")
                        .font(.system(size: 18).weight(.bold))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundColor(Color.white)
                        .padding(.top,30)
                        .padding(.leading,20)
                    NavigationLink(destination: BirthDateView() ){
                                Rectangle()
                                       .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                       .frame(width: .infinity, height: 50)
                                       .padding(.bottom, radius)
                                       .cornerRadius(radius)
                                       .padding(.bottom, -radius)
                                       .overlay(
                                           ZStack {
                                               Text("Birthdate")
                                                   .font(.headline.weight(.bold))
                                                   .frame(maxWidth: .infinity,alignment: .leading)
                                                   .padding(.leading,20)
                                               Text("\(day)/\(month)/\(year)")
                                                   .font(.body)
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,50)
                                               Image(systemName: "chevron.right")
                                                   .frame(maxWidth: .infinity,alignment: .trailing)
                                                   .padding(.trailing,20)
                                           }
                                            .foregroundColor(Color.white)
                                       )
//                                       .shadow(radius: 4)
                                       .padding([.leading, .trailing],20)
                                       .padding(.top,10)
                        
                    }
                    NavigationLink(destination: GenderSelection() ){
                        RoundedRectangle(cornerRadius: 0)
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
//                                           .shadow(radius: 4)
                                           .padding([.leading, .trailing],20)
//                                           .padding(.top,10)
                                           
                    }
                    NavigationLink(destination: GoalView() ){
                        RoundedRectangle(cornerRadius: 0)
                                           .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                           .frame(width: .infinity, height: 50)
                                           
                                           .overlay(
                                               ZStack {
                                                   Text("Goal")
                                                       .font(.headline.weight(.bold))
                                                       .frame(maxWidth: .infinity,alignment: .leading)
                                                       .padding(.leading,20)
                                                   Text(String(goal==1 ? "Lose": goal==2 ? "Maintain": goal==3 ? "Gain": "Not Select"))
                                                       .font(.body)
                                                       .frame(maxWidth: .infinity,alignment: .trailing)
                                                       .padding(.trailing,50)
                                                   Image(systemName: "chevron.right")
                                                       .frame(maxWidth: .infinity,alignment: .trailing)
                                                       .padding(.trailing,20)
                                               }
                                                .foregroundColor(Color.white)
                                           )
//                                           .shadow(radius: 4)
                                           .padding([.leading, .trailing],20)
//                                           .padding(.top,10)
                                           
                    }
                    NavigationLink(destination: WeightView() ){
                        RoundedRectangle(cornerRadius: 0)
                                           .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                           .frame(width: .infinity, height: 50)
                                           
                                           .overlay(
                                               ZStack {
                                                   Text("Weight")
                                                       .font(.headline.weight(.bold))
                                                       .frame(maxWidth: .infinity,alignment: .leading)
                                                       .padding(.leading,20)
                                                   if selection == 0 {
                                                       Text(String(selectedPoundIndex+65)+" lb")
                                                           .font(.body)
                                                           .frame(maxWidth: .infinity,alignment: .trailing)
                                                           .padding(.trailing,50)
                                                   }else{
                                                       Text(String(selectedKilogramIndex+30)+" kg")
                                                           .font(.body)
                                                           .frame(maxWidth: .infinity,alignment: .trailing)
                                                           .padding(.trailing,50)
                                                   }
                                                   Image(systemName: "chevron.right")
                                                       .frame(maxWidth: .infinity,alignment: .trailing)
                                                       .padding(.trailing,20)
                                               }
                                                .foregroundColor(Color.white)
                                           )
//                                           .shadow(radius: 4)
                                           .padding([.leading, .trailing],20)
//                                           .padding(.top,10)
                                           
                    }
                    NavigationLink(destination: HeightView() ){
                        RoundedRectangle(cornerRadius: 0)
                                           .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                           .frame(width: .infinity, height: 50)
                                           
                                           .overlay(
                                               ZStack {
                                                   Text("Height")
                                                       .font(.headline.weight(.bold))
                                                       .frame(maxWidth: .infinity,alignment: .leading)
                                                       .padding(.leading,20)
                                                   if selection == 0 {
                                                       if selectedInchesIndex == 0 {
                                                           Text(String(selectedFeetIndex+3)+" ft")
                                                               .font(.body)
                                                               .frame(maxWidth: .infinity,alignment: .trailing)
                                                               .padding(.trailing,50)
                                                       }else{
                                                           Text(String(selectedFeetIndex+3)+" ft "+String(selectedInchesIndex)+" in")
                                                               .font(.body)
                                                               .frame(maxWidth: .infinity,alignment: .trailing)
                                                               .padding(.trailing,50)
                                                       }
                                                      
                                                   }else{
                                                       Text(String(selectedCentimeterIndex+100)+" cm")
                                                           .font(.body)
                                                           .frame(maxWidth: .infinity,alignment: .trailing)
                                                           .padding(.trailing,50)
                                                   }
                                                   
                                                   Image(systemName: "chevron.right")
                                                       .frame(maxWidth: .infinity,alignment: .trailing)
                                                       .padding(.trailing,20)
                                               }
                                                .foregroundColor(Color.white)
                                           )
//                                           .shadow(radius: 4)
                                           .padding([.leading, .trailing],20)
//                                           .padding(.top,10)
                                           
                    }
                    NavigationLink(destination: DietView() ){
                                    Rectangle()
                                           .fill(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                           .frame(width: .infinity, height: 50)
                                           .padding(.top, radius)
                                           .cornerRadius(radius)
                                           .padding(.top, -radius)
                                           .overlay(
                                               ZStack {
                                                   Text("Diet")
                                                       .font(.headline.weight(.bold))
                                                       .frame(maxWidth: .infinity,alignment: .leading)
                                                       .padding(.leading,20)
                                                   Text(String(diet==1 ? "Balance" : diet == 2 ? "Keto & Low Carb" : diet == 3 ? "High Protein" : "Not Select"))
                                                       .font(.body)
                                                       .frame(maxWidth: .infinity,alignment: .trailing)
                                                       .padding(.trailing,50)
                                                   Image(systemName: "chevron.right")
                                                       .frame(maxWidth: .infinity,alignment: .trailing)
                                                       .padding(.trailing,20)
                                               }
                                                .foregroundColor(Color.white)
                                           )
//                                           .shadow(radius: 4)
                                           .padding([.leading, .trailing],20)
//
                                           
                    }
                    
//                    Spacer()
                    
                    
                }.fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                        .ignoresSafeArea()
                }
                
                ZStack{
                    Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24,weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,20)
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
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
                            if let imageData = image?.jpegData(compressionQuality: 1.0) {
                                // Encode the image data as a Base64 string
                                let base64Image = imageData.base64EncodedString()
                                
                                // Store the image data in AppStorage
                                self.imageData = base64Image
                            }
                            showAlert.toggle()
                            
                        } .alert(isPresented: $showAlert) {
                            Alert(title: Text("Alert"), message: Text(self.StatusMessage), dismissButton: .default(Text("OK")))
                        }
                    
                   
                   
                }
                    .frame(height: 110)
                    .frame(maxHeight: .infinity,alignment: .top)

                    .edgesIgnoringSafeArea(.top)
            }
        }.navigationBarBackButtonHidden(true)
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
    @AppStorage("oldname") var oldname = ""
    @AppStorage("day") var day = ""
    @AppStorage("month") var month = ""
    @AppStorage("year") var year = ""
    @AppStorage("gender") var gender = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top,20)
                    .onTapGesture {
                        if oldname != name{
                            name = oldname
                            presentationMode.wrappedValue.dismiss()
                        }else{
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    }
                Text("Need to change")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top,20)
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
                    if oldname != name{
                        oldname = name
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        presentationMode.wrappedValue.dismiss()
                    }
                }label:
                {
                    Text("Save Change")
                        .font(.custom("Inter-Regular_Bold", size: 16))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color(hex: 0xFFEB3800))
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                }
                .offset(y: 250)
                Spacer()
                
                
            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
        .ignoresSafeArea()
        .tag(0)
        .contentShape(Rectangle())
        .gesture(DragGesture())
        .navigationBarBackButtonHidden(true)
        
    }
}

struct BirthDateView: View {
    @AppStorage("day") var day = ""
    @AppStorage("month") var month = ""
    @AppStorage("year") var year = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                    .padding([.bottom,.top],20)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Text("When is your")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Birthday?")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color(hex: 0xFFEB3800))
                    .padding(.bottom, 1.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("We use this to calculate your personalized recommendations.")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    TextField("DD",text: $day)
                        .preferredColorScheme(.light)
                        .keyboardType(.numberPad)
                        .onReceive(Just(day)) { newValue in
                              let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                  day = filtered
                              }
                              if let number = Int(filtered), !(1...31).contains(number) {
                                  day = ""
                              }
                
                            
                            
                          }

                        .padding(15)
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .foregroundColor(Color.black)
                        .accentColor(Color(hex: 0xFFEB3800))
                        .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(Color(hex: 0xFFD9D9D9))
                    .padding(.horizontal)


                    TextField("MM",text: $month)
                        .preferredColorScheme(.light)
                        .keyboardType(.numberPad)
    
                        .onReceive(Just(month)) { newValue in
                              let filtered = newValue.filter { "0123456789".contains($0) }
                              if filtered != newValue {
                                  month = filtered
                              }
                            if let number = Int(filtered), !(1...12).contains(number) {
                                  month = ""
                              }
                    
                          }
                        .padding(15)
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .foregroundColor(Color.black)
                        .accentColor(Color(hex: 0xFFEB3800))
                        .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(Color(hex: 0xFFD9D9D9))
                    .padding(.horizontal)

                    TextField("YYYY",text: $year)
                        .preferredColorScheme(.light)
                        .keyboardType(.numberPad)
    
                        .onReceive(Just(year)) { newValue in
                              let filtered = newValue.filter { "0123456789".contains($0) }
                              if filtered != newValue {
                                  year = filtered
                              }
                            if let number = Int(filtered), !(0...2023).contains(number) {
                                  year = ""
                              }
                          }
                        .padding(15)
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .foregroundColor(Color.black)
                        .accentColor(Color(hex: 0xFFEB3800))
                        .background(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(Color(hex: 0xFFD9D9D9))
                    .padding(.horizontal)
                  
                    
                }
                Button{
                    print("saved")
                    presentationMode.wrappedValue.dismiss()
                }label:
                {
                    Text("Save Change")
                        .font(.custom("Inter-Regular_Bold", size: 16))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color(hex: 0xFFEB3800))
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                }.offset(y: 200)
                Spacer()
                
                
            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
            .ignoresSafeArea()
            .tag(3)
            .contentShape(Rectangle())
            .gesture(DragGesture())
            .navigationBarBackButtonHidden(true)
    }
}

struct GenderSelection: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("gender") var gender = 0
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                    .padding([.bottom,.top],20)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Text("What's  your")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)

       
                
                Text("biological sex?")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color(hex: 0xFFEB3800))
                    .padding(.bottom, 1.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("We use this to calculate your personalized recommendations.")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    if(gender != 1){
                        gender = 1
                        print(gender)
                        presentationMode.wrappedValue.dismiss()
                    }
                    else{
                        gender = 1
                        print(gender)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Male")
                        .font(.custom("Inter-Regular_Bold", size: 18))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: gender == 1 ? 3 : 0)
                        )
                        
                        
                }
                .padding(.bottom)
                Button(action: {
                    if(gender != 0){
                        gender = 0
                        print(gender)
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        gender = 0
                        print(gender)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Female")
                        .font(.custom("Inter-Regular_Bold", size: 18))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: gender == 0 ? 3 : 0)
                        )
                        
                        
                }
                .padding(.bottom)
                Spacer()
                
                
            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
            .ignoresSafeArea()
            .tag(2)
            .contentShape(Rectangle())
            .gesture(DragGesture())
            .navigationBarBackButtonHidden(true)
    }
}

struct GoalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("goal") var goal = 0
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                    .padding([.bottom,.top],20)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                HStack {
                    Text("What")
                        .font(.custom("Poppins-SemiBold", size: 32))
                        .foregroundColor(Color.white)
                    .frame(alignment: .leading)
                    Text("goal")
                        .font(.custom("Poppins-SemiBold", size: 32))
                        .foregroundColor(Color(hex: 0xFFEB3800))
                    Text("do you")
                        .font(.custom("Poppins-SemiBold", size: 32))
                        .foregroundColor(Color.white)

                }
                
                Text("have in mind?")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 1.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Make us know your target.")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    if(goal != 1){
                        goal = 1
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        goal = -1
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Lose Weight")
                        .font(.custom("Inter-Regular_Bold", size: 18))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: goal == 1 ? 3 : 0)
                        )
                        
                }
                .padding(.bottom)
                Button(action: {
                    if(goal != 2){
                        goal = 2
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        goal = -1
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Maintain Weight")
                        .font(.custom("Inter-Regular_Bold", size: 18))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: goal == 2 ? 3 : 0)
                        )
                        
                }
                .padding(.bottom)
                Button(action: {
                    if(goal != 3){
                        goal = 3
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        goal = -1
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Gain Weight")
                        .font(.custom("Inter-Regular_Bold", size: 18))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: goal == 3 ? 3 : 0)
                        )
                        
                }
                Spacer()
                
                
            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
            .ignoresSafeArea()
            .tag(1)
            .contentShape(Rectangle())
            .gesture(DragGesture())
            .navigationBarBackButtonHidden(true)
    }
}
struct WeightView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("selection") var selection = 0
    @AppStorage("selectedPoundIndex") private var selectedPoundIndex = 60
    @AppStorage("selectedKilogramIndex") var selectedKilogramIndex = 60
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                    .padding([.bottom,.top],20)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Text("When is your")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("weight?")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color(hex: 0xFFEB3800))
                    .padding(.bottom, 1.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("We use this to calculate your personalized recommendations.")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ZStack {
                    Color(hex: 0xFF303030)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    HStack(spacing: 0){
                        Button(action: {
                            selection = 0
                        }) {
                            Text("Pounds")
                                .font(.custom("Inter-Regular_Bold", size: 15))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(Color(hex: selection == 0 ? 0xFF6C6C6C : 0xFF303030))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        Button(action: {
                            selection = 1
                        }) {
                            Text("Kilograms")
                                .font(.custom("Inter-Regular_Bold", size: 15))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(Color(hex: selection == 1 ? 0xFF6C6C6C : 0xFF303030))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                
                }
                VStack(alignment: .center){
                    if selection == 0 {
                                PoundView()
                            } else {
                                KilogramView()
                            }
                }
                .frame(maxWidth: .infinity)
                
//                            TabView(selection: $selection) {
//                                        CentimeterView()
//                                      FeetInchesView()
//
//
//
//
//                                  }
                Spacer()

            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
            .ignoresSafeArea()
            .tag(5)
            .contentShape(Rectangle())
            .gesture(DragGesture())
            .navigationBarBackButtonHidden(true)
    }
}
struct HeightView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("selectedCentimeterIndex") var selectedCentimeterIndex = 60
    @AppStorage("selection") var selection = 0
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                    .padding([.bottom,.top],20)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Text("When is your")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("height?")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color(hex: 0xFFEB3800))
                    .padding(.bottom, 1.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("We use this to calculate your personalized recommendations.")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ZStack {
                    Color(hex: 0xFF303030)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    HStack(spacing: 0){
                        Button(action: {
                            selection = 0
                        }) {
                            Text("Feet/Inches")
                                .font(.custom("Inter-Regular_Bold", size: 15))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(Color(hex: selection == 0 ? 0xFF6C6C6C : 0xFF303030))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        Button(action: {
                            selection = 1
                        }) {
                            Text("Centimeters")
                                .font(.custom("Inter-Regular_Bold", size: 15))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                .background(Color(hex: selection == 1 ? 0xFF6C6C6C : 0xFF303030))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                
                }
                VStack(alignment: .center){
                    if selection == 0 {
                                FeetInchesView()
                            } else {
                                CentimeterView()
                            }
                }
                .frame(maxWidth: .infinity)
                
//                            TabView(selection: $selection) {
//                                        CentimeterView()
//                                      FeetInchesView()
//
//
//
//
//                                  }
                if selection == 0 {
                    Button{
                        print("frank")
                        presentationMode.wrappedValue.dismiss()
                    }label:
                    {
                        Text("Save Change")
                            .font(.custom("Inter-Regular_Bold", size: 16))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color(hex: 0xFFEB3800))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    }.offset(y: -137)
                }else {
                    Button{
                        print("frank")
                        presentationMode.wrappedValue.dismiss()
                    }label:
                    {
                        Text("Save Change")
                            .font(.custom("Inter-Regular_Bold", size: 16))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color(hex: 0xFFEB3800))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    }.offset(y: -0)
                }
                
               
                Spacer()

            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
            .ignoresSafeArea()
            .tag(4)
            .contentShape(Rectangle())
            .gesture(DragGesture())
            .navigationBarBackButtonHidden(true)
    }
}
struct DietView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("diet") var diet = 0
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack(alignment: .leading){
                Image(systemName: "chevron.left")
                    .font(.system(size: 24,weight: .bold))
                    .foregroundColor(.white)
                    .padding([.bottom,.top],20)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Text("Which diet plans")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                
                Text("do you prefer?")
                    .font(.custom("Poppins-SemiBold", size: 32))
                    .foregroundColor(Color(hex: 0xFFEB3800))
                    .padding(.bottom, 20.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button(action: {
                    if(diet != 1){
                        diet = 1
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        diet = 0
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    HStack{
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Balance")
                                .font(.custom("Poppins-Bold", size: 32))
                            Text("Diet")
                                .font(.custom("Poppins-Bold", size: 32))
                            
                        }
                        Spacer()
                        Text("Start with something casual, If you are new we recommend this plan.")
                            .frame(maxWidth: 150)
                            .font(.custom("Inter-Regular_Medium", size: 14))
                            .multilineTextAlignment(.leading)
                        
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .foregroundColor(diet == 1 ? Color.white : Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 130)
                    .background( diet == 1 ? Color(hex:  0xFFEB3800) :Color.white )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                }
                .padding(.bottom)
                
                Button(action: {
                    if(diet != 2){
                        diet = 2
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        diet = 0
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    HStack{
                        VStack (alignment: .leading, spacing: 0) {
                            Text("Keto &")
                                .font(.custom("Poppins-Bold", size: 32))
                            Text("Low Carb")
                                .font(.custom("Poppins-Bold", size: 32))
                            
                        }
                        
                        
                        Spacer()
                        
                        Text("Drop the carbs, make it more advance by taking more healthy fats.")
                            .frame(maxWidth: 150)
                            .font(.custom("Inter-Regular_Medium", size: 14))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .foregroundColor(diet == 2 ? Color.white : Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 130)
                    .background( diet == 2 ? Color(hex:  0xFFEB3800) :Color.white )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                .padding(.bottom)
                
                Button(action: {
                    if(diet != 3){
                        diet = 3
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    HStack{
                        VStack (alignment: .leading, spacing: 0) {
                            Text("High")
                                .font(.custom("Poppins-Bold", size: 32))
                            Text("Protein")
                                .font(.custom("Poppins-Bold", size: 32))
                            
                        }
                        
                        
                        Spacer()
                        
                        Text("Just eat more protein And stay full with loads of protein.")
                            .frame(maxWidth: 150)
                            .font(.custom("Inter-Regular_Medium", size: 14))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .foregroundColor(diet == 3 ? Color.white : Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 130)
                    .background( diet == 3 ? Color(hex:  0xFFEB3800) :Color.white )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                .padding(.bottom)
                Spacer()
                
                
            }
            .padding(.horizontal, 30.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
            
            
            
        }
        .ignoresSafeArea()
        .tag(6)
        .contentShape(Rectangle())
        .gesture(DragGesture())
        .navigationBarBackButtonHidden(true)
    }
}

