//
//  UserSignupView.swift
//  Planary
//
//  Created by Pisit Jaiton on 9/6/2566 BE.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255.0
        let green = Double((hex >> 8) & 0xff) / 255.0
        let blue = Double(hex & 0xff) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

struct UserSignupView: View {
    @State private var selectedTab = 0
    @State var percent: CGFloat = 12.5
    @State var name = ""
    @State private var goal: Int = 0
    @State private var gender: Int = 0
    var body: some View {
        

        ZStack {
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack (){
                HStack(alignment: .center){
                    Button(action: {
                        if(selectedTab>0){
                            selectedTab = selectedTab - 1
                            percent = CGFloat(12.5 * (Float64(selectedTab)-1))
                            if(selectedTab == 0){
                                percent = CGFloat(12.5)
                            }
                        } else {
                            print("okay")
                            UserDefaults.standard.set(false, forKey: "signIn")
                        }
                        
                    }){
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24,weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)



                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .frame(width: 320,height: 10)
                            .foregroundColor(Color(hex: 0xFF454545).opacity(0.5))
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .frame(width: (percent * 340 / 100) ,height: 10)
                            .foregroundColor(Color(hex: 0xFFEB3800))
                    }
                    .padding(.trailing, 30.0)
                    .animation(.linear, value: percent)



                }
                .padding(.top, 75.0)
                
                TabView(selection: $selectedTab){
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack(alignment: .leading){
                            Text("What's your first")
                                .font(.custom("Poppins-SemiBold", size: 32))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("name?")
                                .font(.custom("Poppins-SemiBold", size: 32))
                                .foregroundColor(Color(hex: 0xFFEB3800))
                                .padding(.bottom, 1.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("You able to change it later.")
                                .font(.custom("Poppins-SemiBold", size: 15))
                                .foregroundColor(Color.white)
                                .padding(.bottom, 50.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("Add your name",text: $name)
                                .padding(20)
                            
                                .font(.custom("Poppins-SemiBold", size: 15))
                                .foregroundColor(Color.black)
                                .accentColor(Color(hex: 0xFFEB3800))
                                .background(RoundedRectangle(cornerRadius: 20))
                                .foregroundColor(Color(hex: 0xFFD9D9D9))
                            Spacer()
                            
                            
                        }
                        .padding(.horizontal, 30.0)
                        .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
                        
                        
                        
                    }
                    .ignoresSafeArea()
                    .tag(0)
                    .contentShape(Rectangle())
                    .gesture(DragGesture())
                    
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack(alignment: .leading){
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
                                }else{
                                    goal = -1
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
                                }else{
                                    goal = -1
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
                                }else{
                                    goal = -1
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
                    
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack(alignment: .leading){
    
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
                                }else{
                                    gender = 0
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
                                if(gender != 2){
                                    gender = 2
                                }else{
                                    gender = 0
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
                                        .stroke(Color.red, lineWidth: gender == 2 ? 3 : 0)
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
                    
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack(alignment: .leading){
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
                                TextField("DD",text: $name)
                                    .padding(20)
                                
                                    .font(.custom("Poppins-SemiBold", size: 15))
                                    .foregroundColor(Color.black)
                                    .accentColor(Color(hex: 0xFFEB3800))
                                    .background(RoundedRectangle(cornerRadius: 20))
                                .foregroundColor(Color(hex: 0xFFD9D9D9))
                                .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                TextField("MM",text: $name)
                                    .padding(20)
                                
                                    .font(.custom("Poppins-SemiBold", size: 15))
                                    .foregroundColor(Color.black)
                                    .accentColor(Color(hex: 0xFFEB3800))
                                    .background(RoundedRectangle(cornerRadius: 20))
                                    .foregroundColor(Color(hex: 0xFFD9D9D9))
                                    .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                TextField("YYYY",text: $name)
                                    .padding(20)
                                
                                    .font(.custom("Poppins-SemiBold", size: 15))
                                    .foregroundColor(Color.black)
                                    .accentColor(Color(hex: 0xFFEB3800))
                                    .background(RoundedRectangle(cornerRadius: 20))
                                .foregroundColor(Color(hex: 0xFFD9D9D9))
                            }
                            Spacer()
                            
                            
                        }
                        .padding(.horizontal, 30.0)
                        .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
                        
                        
                        
                    }
                        .ignoresSafeArea()
                        .tag(3)
                        .contentShape(Rectangle())
                        .gesture(DragGesture())
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut,value: selectedTab)
                .transition(.slide)
                
                Spacer()
            }
            Button(action: {
                selectedTab = selectedTab + 1
                percent = CGFloat(12.5 * (Float64(selectedTab)+1))
            }) {
                Text("Next")
                    .font(.custom("Inter-Regular_Bold", size: 16))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color(hex: 0xFFEB3800))
                    .clipShape(RoundedRectangle(cornerRadius: 100))
            }
            .padding(.horizontal, 30.0)
            .offset(y: 350)

//                TabView(selection: $selectedTab){
//                    ZStack{
//
//                        VStack{
//
//                            Text("Tab 1")
//                                .onTapGesture {
//                                    selectedTab = 1
//                                }
//                        }
//
//
//
//                    }
//                    .ignoresSafeArea()
//                    .tag(0)
//
//                    Text("Tab 2")
//                        .tag(1)
//                }
            }
            .ignoresSafeArea()
        

    }
}

struct UserSignupView_Previews: PreviewProvider {
    static var previews: some View {
        UserSignupView()
    }
}
