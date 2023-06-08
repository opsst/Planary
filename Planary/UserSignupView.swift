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
    var body: some View {
        

            ZStack {
                Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
                VStack (){
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .frame(width: 400,height: 10)
                            .foregroundColor(Color(hex: 0xFF454545).opacity(0.5))
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .frame(width: (percent * 400 / 100) ,height: 10)
                            .foregroundColor(Color(hex: 0xFFEB3800))
                    }
                    .animation(.linear, value: percent)
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
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                Text("You able to change it later.")
                                    .font(.custom("Poppins-SemiBold", size: 15))
                                        .foregroundColor(Color.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("Add your name",text: $name)
                                    .padding(20)
                                    
                                    .font(.custom("Poppins-SemiBold", size: 15))
                                    .foregroundColor(Color(hex: 0xFFD9D9D9))
                                    .accentColor(Color(hex: 0xFFEB3800))
                                    .background(RoundedRectangle(cornerRadius: 20))
                                    .foregroundColor(Color(hex: 0xFFD9D9D9))
                                    
                                        
                            }
                            .padding(.horizontal, 30.0)



                        }
                        .ignoresSafeArea()
                        .tag(0)
                        .contentShape(Rectangle())
                        .gesture(DragGesture())

                        Text("Tab 2")
                            .tag(1)
                            .contentShape(Rectangle())
                            .gesture(DragGesture())
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .animation(.easeInOut,value: selectedTab)
                            .transition(.slide)
                    Spacer()
                }
                

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
