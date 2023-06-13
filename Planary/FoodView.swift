//
//  FoodView.swift
//  Planary
//
//  Created by Pisit Jaiton on 12/6/2566 BE.
//

import SwiftUI

struct FoodView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var searchText: String = ""
    
    @AppStorage("carbs") var carbs = 0
    @AppStorage("protein") var protein = 0
    @AppStorage("fat") var fat = 0
    @AppStorage("food") var stored = 0

    @State private var showToast = false
    let foods = [
        "Chicken Breast",
        "Salmon",
        "Broccoli",
        "Quinoa",
        "Spinach",
        "Avocado",
        "Greek Yogurt",
        "Almonds",
        "Oatmeal",
        "Blueberries"
    ]

    let carb_food = [10, 2, 6, 39, 1, 9, 6, 6, 20, 14]
    let protein_food = [24, 22, 3, 8, 3, 2, 17, 21, 6, 1]
    let fats_food = [1, 7, 1, 2, 0, 15, 0, 49, 2, 0]
    
    var filteredFoods: [String] {
        if searchText.isEmpty {
            return foods
        } else {
            return foods.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func cal(food:String) -> String{
        let index = foods.firstIndex(of: food) ?? 0
//        var mycarb = (carb_food[index] * 4)
        let sum = (carb_food[index] * 4) + (protein_food[index] * 4) + (fats_food[index] * 9)
        return String(sum)
    }
    var body: some View {

        ZStack {
            Color(UIColor(red: 0.096, green: 0.095, blue: 0.095, alpha: 1.0))
            
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .padding(.leading, 20.0)
                        .font(.system(size: 24,weight: .bold))
                        .foregroundColor(.white)

                        .onTapGesture {
                            print("HI")
                    
                            presentationMode.wrappedValue.dismiss()
                        }
                    TextField("Search Food", text: $searchText)
                        .preferredColorScheme(.dark)
                        .padding(10)
                        .padding(.horizontal, 10.0)
                        .font(.custom("Inter-Regular_Medium", size: 15))
                    
                        .foregroundColor(Color.white)
                        .accentColor(Color(hex: 0xFFEB3800))
                        .background(RoundedRectangle(cornerRadius: 20))
                        .foregroundColor(Color.black)
                    .padding(.horizontal, 20)
                }
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(filteredFoods, id: \.self) { food in
             
                            ZStack {
                                Color(hex:0xFF2B2B2B)
                                .padding(.all, 40.0)
                                .frame(maxWidth: .infinity, maxHeight: 150)
                                .background(Color(hex:0xFF2B2B2B))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                HStack {
                                        
                                    VStack (alignment: .leading){
                                        Spacer()
                                        Text(food)
                                            .font(.custom("Inter-Regular_Bold", size: 18))
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 25.0)
                                        Spacer()
                                        Text("\(cal(food: food)) Kcal")
                                            .font(.custom("Inter-Regular_Medium", size: 15))
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 25.0)
                                        Spacer()
                                    }

                                        Spacer()
                                    Button(action: {
                                        print(food)
                                        if let index = foods.firstIndex(of: food) {
                                            showToast = true
                                            carbs += carb_food[index]
                                            protein += protein_food[index]
                                            fat += fats_food[index]
                                            stored += Int(cal(food: food)) ?? 200
                
                                            presentationMode.wrappedValue.dismiss()
                                            
                                        } else {
                                            print("\(food) not found in the array.")
                                        }
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(Color(hex: 0xFFBC998E))
                                            .font(.system(size:20,weight:.bold))
                                            .frame(width: 40, height: 40)
                                            .background(Color(hex: 0xFF515050))
                                            .clipShape(Circle())
                                            .padding(.horizontal, 25.0)
                                    }
                                }
                            }
                  
                        }
                        
                    }

                    .padding()
                }
                .padding(.bottom, 50.0)
                
            }
            .padding(.top, 80.0)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .overlay(
                    ToastView(message: "Added", isShowing: $showToast)
                )
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}

struct ToastView: View {
    let message: String
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Text(message)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(10)
                .opacity(isShowing ? 1 : 0)
                .animation(.easeInOut(duration: 0.3))
        }
        .padding(.horizontal, 30)
    }
}
