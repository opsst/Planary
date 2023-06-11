//
//  UserSignupView.swift
//  Planary
//
//  Created by Pisit Jaiton on 9/6/2566 BE.
//

import SwiftUI
import Combine

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
//    @State var name = ""
    
//    @State private var day: String = ""
//    @State private var month: String = ""
//    @State private var year: String = ""
//
//    @State private var goal: Int = 0
//    @State private var gender: Int = 0
//    @State private var diet: Int = 0
//
//    @State private var selection = 0
    
    @AppStorage("name") var name = ""
    @AppStorage("oldname") var oldname = ""
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
        

        ZStack {
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            VStack (){
                HStack(alignment: .center){
                    Button(action: {
                        if(selectedTab>0){

                            selectedTab = selectedTab - 1
                            print(selectedTab)
                            percent = CGFloat(12.5 * (Float64(selectedTab)+1))
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
                            .frame(width: (percent * 320 / 100) ,height: 10)
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
                                .preferredColorScheme(.light)
                                .padding(20)
                            
                                .font(.custom("Poppins-SemiBold", size: 15))
                            
                                .foregroundColor(Color.red)
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
           
                                    .padding(20)
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
                                    .padding(20)
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
                                    .padding(20)
                                    .font(.custom("Poppins-SemiBold", size: 15))
                                    .foregroundColor(Color.black)
                                    .accentColor(Color(hex: 0xFFEB3800))
                                    .background(RoundedRectangle(cornerRadius: 20))
                                .foregroundColor(Color(hex: 0xFFD9D9D9))
                                .padding(.horizontal)
                              
                                
                            }
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
                    
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack(alignment: .leading){
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
                            Spacer()
            
                        }
                        .padding(.horizontal, 30.0)
                        .padding(/*@START_MENU_TOKEN@*/.top, 50.0/*@END_MENU_TOKEN@*/)
                        
                        
                        
                    }
                        .ignoresSafeArea()
                        .tag(4)
                        .contentShape(Rectangle())
                        .gesture(DragGesture())
                    
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack(alignment: .leading){
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
                    
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack(alignment: .leading){
    
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
                                }else{
                                    diet = 0
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
                                }else{
                                    diet = 0
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
                                }else{
                                    diet = 0
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
                    
                    ZStack{
                        Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                        VStack (alignment: .leading){
                            Spacer()
                            Text("You Ready!")
                                    .font(.custom("Poppins-Bold", size: 50))
                                    .foregroundColor(Color(hex: 0xFFEB3800))
                                    .padding(.leading, 40.0)
                                    .padding(.bottom)
                            Text("Your information is ready we hope you will strict to out plan.")
                                    .font(.custom("Poppins-Medium", size: 20))
                                    .foregroundColor(Color.white)
                                    .padding(.horizontal, 40.0)
                                    .frame(maxWidth: .infinity)
                            Spacer()
                        }

                        
                        
                        
                    }
                        .ignoresSafeArea()
                        .tag(7)
                        .contentShape(Rectangle())
                        .gesture(DragGesture())
                    
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut,value: selectedTab)
                .transition(.slide)
                
                Spacer()
            }
            Button(action: {
                if(selectedTab == 7){
                    // initSignupdata
//                    @AppStorage("name") var name = ""
//
//                    @AppStorage("day") var day = ""
//                    @AppStorage("month") var month = ""
//                    @AppStorage("year") var year = ""
//
//                    @AppStorage("goal") var goal = 0
//                    @AppStorage("gender") var gender = 0
//                    @AppStorage("diet") var diet = 0
//
//                    @AppStorage("selection") var selection = 0
//
//
//                    @AppStorage("selectedFeetIndex") var selectedFeetIndex: Int = 3
//                    @AppStorage("selectedInchesIndex") var selectedInchesIndex: Int = 6
//
//
//                    @AppStorage("selectedCentimeterIndex") var selectedCentimeterIndex = 60
//
//                    @AppStorage("selectedPoundIndex") private var selectedPoundIndex = 60
//                    @AppStorage("selectedKilogramIndex") var selectedKilogramIndex = 60
//
                    
                    print(name)
                    oldname=name
                    print(day)
                    print(month)
                    print(year)
                    
                    print(goal)
                    print(gender)
                    print(diet)
                    
                    print(selection)
                    
                    print(selectedFeetIndex)
                    print(selectedInchesIndex)
                    print(selectedCentimeterIndex)
                    print(selectedPoundIndex)
                    print(selectedKilogramIndex)
               
                    UserDefaults.standard.set(true, forKey: "haveInfo")
                }else{
                    selectedTab = selectedTab + 1
                    percent = CGFloat(12.5 * (Float64(selectedTab)+1))
                }
     
            }) {
                Text( selectedTab == 7 ? "Done" : "Next")
                    .font(.custom("Inter-Regular_Bold", size: 16))
                    .foregroundColor(selectedTab == 7 ? Color.black : Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(selectedTab == 7 ? Color.white : Color(hex: 0xFFEB3800))
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

struct FeetInchesView: View {
    @AppStorage("selectedFeetIndex") var selectedFeetIndex: Int = 3
    @AppStorage("selectedInchesIndex") var selectedInchesIndex: Int = 6
    
    let feetOptions = Array(3...8)
    let inchesOptions = Array(0...11)
    
    var body: some View {
        VStack (alignment: .leading){
            HStack(alignment: .top) {
                // Feet Picker
                Picker("Feet", selection: $selectedFeetIndex) {
                    ForEach(0..<feetOptions.count) { index in
                        Text("\(feetOptions[index]) ft")
                            .font(.custom("Inter-Regular_Bold", size: 16))
                            .foregroundColor(Color.white)
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 150)
     
                // Inches Picker
                Picker("Inches", selection: $selectedInchesIndex) {
                    ForEach(0..<inchesOptions.count) { index in
                        Text("\(inchesOptions[index]) in")
                            .font(.custom("Inter-Regular_Bold", size: 16))
                            .foregroundColor(Color.white)
                            .tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 150)
            }
            Spacer()
        }
    }
}

struct CentimeterView: View {
    @AppStorage("selectedCentimeterIndex") var selectedCentimeterIndex = 60
    
    let centimeterOptions = Array(100...200)
    
    var body: some View {
        VStack {
            // Centimeter Picker
            Picker("Centimeter", selection: $selectedCentimeterIndex) {
                ForEach(0..<centimeterOptions.count) { index in
                    Text("\(centimeterOptions[index]) cm")
                        .font(.custom("Inter-Regular_Bold", size: 16))
                        .foregroundColor(Color.white)
                        .tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100)
            .padding()
        }
    }
}


struct PoundView: View {
    @AppStorage("selectedPoundIndex") private var selectedPoundIndex = 60
    

    let poundOptions = Array(65...440)
    var body: some View {
        VStack {
            // Pound Picker
            Picker("Pound", selection: $selectedPoundIndex) {
                ForEach(0..<poundOptions.count) { index in
                    Text("\(poundOptions[index]) lb")
                        .font(.custom("Inter-Regular_Bold", size: 16))
                        .foregroundColor(Color.white)
                        .tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100)
            .padding()
        }
    }
}

struct KilogramView: View {
    @AppStorage("selectedKilogramIndex") var selectedKilogramIndex = 60
    
    let kilogramOptions = Array(30...200)
    
    var body: some View {
        VStack {
            // Kilogram Picker
            Picker("Kilogram", selection: $selectedKilogramIndex) {
                ForEach(0..<kilogramOptions.count) { index in
                    Text("\(kilogramOptions[index]) kg")
                        .font(.custom("Inter-Regular_Bold", size: 16))
                        .foregroundColor(Color.white)
                        .tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100)
            .padding()
        }
    }
}
