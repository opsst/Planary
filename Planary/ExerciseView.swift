//
//  ExerciseView.swift
//  Planary
//
//  Created by Pisit Jaiton on 13/6/2566 BE.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var searchText: String = ""
    
    @AppStorage("burn") var burn = 0
    
    @State private var showToast = false
    let exercise = [
        "Push-ups",
        "Squats",
        "Plank",
        "Lunges",
        "Burpees",
        "Sit-ups",
        "Mountain climbers",
        "Jumping jacks",
        "Bicycle crunches",
        "High knees"
    ]

    let exerciseCalories = [240, 200, 150, 270, 360, 210, 330, 255, 195, 285]
    
    var filteredFoods: [String] {
        if searchText.isEmpty {
            return exercise
        } else {
            return exercise.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
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
                    TextField("Search Exercise", text: $searchText)
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
                        ForEach(filteredFoods, id: \.self) { ex in
                            
                            ZStack {
                                Color(hex:0xFF2B2B2B)
                                    .padding(.all, 40.0)
                                    .frame(maxWidth: .infinity, maxHeight: 150)
                                    .background(Color(hex:0xFF2B2B2B))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                HStack {
                                    
                                    VStack (alignment: .leading){
                                        Spacer()
                                        Text(ex)
                                            .font(.custom("Inter-Regular_Bold", size: 18))
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 25.0)
                                        Spacer()
                                        Text("\(exerciseCalories[exercise.firstIndex(of: ex) ?? 0]) Kcal / 30 minutes")
                                            .font(.custom("Inter-Regular_Medium", size: 15))
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 25.0)
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                    Button(action: {
                                        print(ex)
                                        if let index = exercise.firstIndex(of: ex) {
                                            burn += exerciseCalories[index]
                                            
                                            presentationMode.wrappedValue.dismiss()
                                            
                                        } else {
                                            print("\(ex) not found in the array.")
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
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
