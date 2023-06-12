//
//  ExploreView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct ExploreView: View {
    let radius: CGFloat = CGFloat(10)
    var body: some View {
       
        ZStack {
            Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
            ScrollView(showsIndicators: false){
                Text("Feature")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25,weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading,20)
                    .padding(.top,60)
                HStack(spacing: 0){
                    Rectangle()
                        .foregroundColor(Color(hex: 0xff2f6bff))
                        .frame(width: .infinity, height: 200)
                        .padding(.trailing, radius)
                        .cornerRadius(radius)
                        .padding(.trailing, -radius)
                        .padding(.leading,20)
                        .padding(.bottom,10)
                        .overlay(
                            ZStack{
                                Text("ARTICLE")
                                    .font(.custom("Poppins-SemiBold", size: 12).weight(.bold))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.white)
                                    .padding(.bottom,130)
                                    .padding(.leading,50)
                                    .opacity(0.75)
                                    .kerning(2)
                                
                                   
                                Text("Healthy Travel \nTrick")
                                    .padding(.bottom,60)
                                    .padding(.leading,50)
                                    .padding(.trailing,30)
                                    .font(.custom("Poppins-SemiBold", size: 17.4).weight(.bold))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(Color.white)
                                RoundedRectangle(cornerRadius: 360)
                                    .foregroundColor(Color(hex: 0xff00c664))
                                    .frame(width: 100, height: 35)
                                    .padding(.top,100)
                                    .padding(.trailing,10)
                                    .overlay(
                                        VStack{
                                            Text("READ NOW")
                                                .padding(.top,100)
                                                .padding(.leading,16)
                                                .font(.custom("Poppins-SemiBold", size: 12).weight(.bold))
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                                .foregroundColor(Color.white)
                                        }
                                    )
                                    .onTapGesture {
                                        if let url = URL(string: "https://jamtraveltips.com/my-best-tips/tricks-to-stay-healthy-while-traveling/") {
                                                            UIApplication.shared.open(url)
                                                        }
                                    }
                            }
                                
                        )
                    Rectangle()
                        .foregroundColor(Color(hex: 0xffa5e5ff))
                        .frame(width: 160, height: 200)
                        .padding(.leading, radius)
                        .cornerRadius(radius)
                        .padding(.leading, -radius)
                        .overlay(
                            Image("travelgirl")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 230, height: 230))
                        .padding(.trailing,20)
                        .padding(.bottom,10)
                }
                
                Text("What's Hot")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25,weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading,20)
                    .padding(.top,20)
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 20){
                        VStack (spacing: 0){
                            Rectangle()
                                .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                .frame(width: 180, height: 135)
                                .padding(.bottom, radius)
                                .cornerRadius(radius)
                                .padding(.bottom, -radius)
                                .overlay(
                                    Image("spaghetti")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: .infinity, height: .infinity)
                                       .padding(.bottom, radius)
                                       .cornerRadius(radius)
                                       .padding(.bottom, -radius)
//                                                       .padding(8)
                            )
                            Rectangle()
                                .foregroundColor(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                .frame(width: 180, height: 90)
                                .padding(.top, radius)
                                .cornerRadius(radius)
                                .padding(.top, -radius)
                                .overlay(
                                    ZStack{
                                        Text("One-Pot Spaghetti")
                                            .foregroundColor(Color.white)
                                            .font(.custom("inter", size: 15).weight(.semibold))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.leading,10)
                                            .padding(.bottom,40)
                                            
                                        Text("342.5 kcal")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 14))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.top,50)
                                            .padding(.leading,10)
                                        
                                        Image(systemName: "heart")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 16))
                                            .frame(maxWidth: .infinity,alignment: .trailing)
                                            .padding(.top,55)
                                            .padding(.trailing,10)
                                        
                                    }
                                )
                            
                        }.onTapGesture {
                            if let url = URL(string: "https://recipes.sparkpeople.com/recipe-calories.asp?recipe=262729") {
                                                UIApplication.shared.open(url)
                                            }
                        }
                        
                        VStack (spacing: 0){
                            Rectangle()
                                .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                .frame(width: 180, height: 135)
                                .padding(.bottom, radius)
                                .cornerRadius(radius)
                                .padding(.bottom, -radius)
                                .overlay(
                                    Image("curry")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 180, height: 135)
                                        .clipped()
                                        .padding(.bottom, radius)
                                        .cornerRadius(radius)
                                        .padding(.bottom, -radius)
//                                                       .padding(8)
                            )
                            Rectangle()
                                .foregroundColor(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                .frame(width: 180, height: 90)
                                .padding(.top, radius)
                                .cornerRadius(radius)
                                .padding(.top, -radius)
                                .overlay(
                                    ZStack{
                                        Text("Japanese Curry")
                                            .foregroundColor(Color.white)
                                            .font(.custom("inter", size: 15).weight(.semibold))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.leading,10)
                                            .padding(.bottom,40)
                                            
                                        Text("322 kcal")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 14))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.top,50)
                                            .padding(.leading,10)
                                        
                                        Image(systemName: "heart")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 16))
                                            .frame(maxWidth: .infinity,alignment: .trailing)
                                            .padding(.top,55)
                                            .padding(.trailing,10)
                                        
                                    }
                                )
                            
                        }.onTapGesture {
                            if let url = URL(string: "https://www.sanraku.com/is-japanese-curry-healthy-an-insight-on-nutrition/") {
                                                UIApplication.shared.open(url)
                                            }
                        }
                        
                        VStack (spacing: 0){
                            Rectangle()
                                .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                .frame(width: 180, height: 135)
                                .padding(.bottom, radius)
                                .cornerRadius(radius)
                                .padding(.bottom, -radius)
                                .overlay(
                                    Image("cake")
                                       .resizable()
                                       .scaledToFill()
                                       .frame(width: 180, height: 135)
                                       .clipped()
                                       .padding(.bottom, radius)
                                       .cornerRadius(radius)
                                       .padding(.bottom, -radius)
//                                                       .padding(8)
                            )
                            Rectangle()
                                .foregroundColor(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                .frame(width: 180, height: 90)
                                .padding(.top, radius)
                                .cornerRadius(radius)
                                .padding(.top, -radius)
                                .overlay(
                                    ZStack{
                                        Text("Cheesecake")
                                            .foregroundColor(Color.white)
                                            .font(.custom("inter", size: 15).weight(.semibold))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.leading,10)
                                            .padding(.bottom,40)
                                            
                                        Text("321 kcal")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 14))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.top,50)
                                            .padding(.leading,10)
                                        
                                        Image(systemName: "heart")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 16))
                                            .frame(maxWidth: .infinity,alignment: .trailing)
                                            .padding(.top,55)
                                            .padding(.trailing,10)
                                        
                                    }
                                )
                            
                        }.onTapGesture {
                            if let url = URL(string: "https://www.nutritionix.com/food/cheesecake/1-piece") {
                                                UIApplication.shared.open(url)
                                            }
                        }
                        
                        VStack (spacing: 0){
                            Rectangle()
                                .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                .frame(width: 180, height: 135)
                                .padding(.bottom, radius)
                                .cornerRadius(radius)
                                .padding(.bottom, -radius)
                                .overlay(
                                    Image("bluehawaii")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 180, height: 135)
                                        .clipped()
                                        .padding(.bottom, radius)
                                        .cornerRadius(radius)
                                        .padding(.bottom, -radius)
//                                                       .padding(8)
                            )
                            Rectangle()
                                .foregroundColor(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
                                .frame(width: 180, height: 90)
                                .padding(.top, radius)
                                .cornerRadius(radius)
                                .padding(.top, -radius)
                                .overlay(
                                    ZStack{
                                        Text("Blue Hawaii")
                                            .foregroundColor(Color.white)
                                            .font(.custom("inter", size: 15).weight(.semibold))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.leading,10)
                                            .padding(.bottom,40)
                                            
                                        Text("336 kcal")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 14))
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.top,50)
                                            .padding(.leading,10)
                                        
                                        Image(systemName: "heart")
                                            .foregroundColor(Color.white.opacity(0.5))
                                            .font(.custom("inter", size: 16))
                                            .frame(maxWidth: .infinity,alignment: .trailing)
                                            .padding(.top,55)
                                            .padding(.trailing,10)
                                        
                                    }
                                )
                            
                        }.onTapGesture {
                            if let url = URL(string: "https://www.diffordsguide.com/cocktails/recipe/260/blue-hawaiian") {
                                                UIApplication.shared.open(url)
                                            }
                        }
                        
                        
                
                    }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                }
                .padding(.bottom,20)
                
                
                 
                VStack(spacing: 0) {
                    Text("Popular Content")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 25,weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(.leading,20)
                    HStack(spacing:20) {
                            VStack (spacing: 0){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                    .frame(width: 160, height: 120)
                                    .overlay(
                                        Image("pop1")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: .infinity, height: .infinity)
                                            .cornerRadius(10)
                                )
                                
                                ZStack{
                                    Text("Chicken Last in the Fridge?")
                                        .foregroundColor(Color.white)
                                        .font(.custom("inter", size: 15).weight(.semibold))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,10)
                                        .padding(.bottom,40)
                                    
                                    Text("Amy Richter")
                                        .foregroundColor(Color.white.opacity(0.5))
                                        .font(.custom("inter", size: 14))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.top,50)
                                        .padding(.leading,10)
                                }
                                    
                                
                            }.onTapGesture {
                                if let url = URL(string: "https://www.healthline.com/nutrition/how-long-does-chicken-last-in-the-fridge") {
                                                    UIApplication.shared.open(url)
                                                }
                            
                            }.padding(.leading,20)
//                            .padding(.top,12)
                        
                        VStack (spacing: 0){
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                .frame(width: 160, height: 120)
                                .overlay(
                                    Image("pop2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: .infinity, height: .infinity)
                                        .cornerRadius(10)
//                                            .padding(10)
//                                                       .padding(8)
                            )
                            
                            ZStack{
                                Text("50 Foods That Are Super Healthy")
                                    .foregroundColor(Color.white)
                                    .font(.custom("inter", size: 15).weight(.semibold))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.leading,10)
                                    .padding(.bottom,40)
                                
                                Text("Kathy W. Warwick")
                                    .foregroundColor(Color.white.opacity(0.5))
                                    .font(.custom("inter", size: 14))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.top,50)
                                    .padding(.leading,10)
                            }
                                
                            
                        }.onTapGesture {
                            if let url = URL(string: "https://www.healthline.com/nutrition/50-super-healthy-foods") {
                                                UIApplication.shared.open(url)
                                            }
                        }
                        .padding(.trailing,20)
                    }
                    HStack(spacing:20) {
                            VStack (spacing: 0){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                    .frame(width: 160, height: 120)
                                    .overlay(
                                        Image("pop3")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: .infinity, height: .infinity)
                                            .cornerRadius(10)
                                )
                                
                                ZStack{
                                    Text("Best Time to Take Vitamins?")
                                        .foregroundColor(Color.white)
                                        .font(.custom("inter", size: 15).weight(.semibold))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading,10)
                                        .padding(.bottom,40)
                                    
                                    Text("Lisa Hodgson")
                                        .foregroundColor(Color.white.opacity(0.5))
                                        .font(.custom("inter", size: 14))
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.top,50)
                                        .padding(.leading,10)
                                }
                                    
                                
                            }.onTapGesture {
                                if let url = URL(string: "https://www.healthline.com/nutrition/best-time-to-take-vitamins") {
                                                    UIApplication.shared.open(url)
                                                }
                            
                            }.padding(.leading,20)
//                            .padding(.top,12)
                        
                        VStack (spacing: 0){
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1)))
                                .frame(width: 160, height: 120)
                                .overlay(
                                    Image("pop4")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: .infinity, height: .infinity)
                                        .cornerRadius(10)
//                                            .padding(10)
//                                                       .padding(8)
                            )
                            
                            ZStack{
                                Text("14 Creative Ways to Use Food Scraps")
                                    .foregroundColor(Color.white)
                                    .font(.custom("inter", size: 15).weight(.semibold))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.leading,10)
                                    .padding(.bottom,40)
                                
                                Text("Adrienne Seitz")
                                    .foregroundColor(Color.white.opacity(0.5))
                                    .font(.custom("inter", size: 14))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.top,50)
                                    .padding(.leading,10)
                            }
                                
                            
                        }.onTapGesture {
                            if let url = URL(string: "https://www.healthline.com/nutrition/uses-for-food-scraps") {
                                                UIApplication.shared.open(url)
                                            }
                        }
                        .padding(.trailing,20)
                        }.padding(.top,10)
                    
                    
                }.padding(.bottom,100)
                        
            
                
                
            }
            .padding(.vertical)
           
//            .overlay(
//                ZStack{
//                    Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
//                    Image(systemName: "magnifyingglass")
//                        .frame(maxWidth: .infinity,alignment: .leading)
//                        .padding(.leading,20)
//                        .foregroundColor(Color.white)
//                        .padding(.top,60)
//                    Text("Explore")
//                        .font(.system(size: 20).weight(.bold))
//                        .foregroundColor(Color.white)
//                        .padding(.top,60)
//                    Image(systemName: "bookmark")
//                        .frame(maxWidth: .infinity,alignment: .trailing)
//                        .padding(.trailing,20)
//                        .foregroundColor(Color.white)
//                        .padding(.top,60)
//
//
//                }
//                    .frame(height: 110)
//                    .frame(maxHeight: .infinity,alignment: .top)
//
//                    .edgesIgnoringSafeArea(.top)
//
//
//        )
        } .ignoresSafeArea()
        
    }
}


struct CardView: View {
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)))
            .frame(width: 180, height: 200)
            .overlay(
                ZStack{
                    Text("Fasting")
                        .foregroundColor(Color(hex: 0xff509d6d))
                        .font(.custom("Poppins-SemiBold", size: 18).weight(.bold))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,20)
                    Text("4 X 16 h")
                        .foregroundColor(Color(hex: 0xff509d6d))
                        .font(.custom("Poppins-SemiBold", size: 18).weight(.bold))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.top,40)
                }
            )
    }
}


struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
