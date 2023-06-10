//
//  HomeView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("signIn") var isSignIn = false
    @State var calories : Int = 0
    @State var progressValue: Float = 0.2
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
    let kilogramOptions = Array(30...200)
    
    var body: some View {
        ZStack{
            Color(hex:0xFF181818)
                .edgesIgnoringSafeArea(.top)
            VStack (alignment: .leading){
                Text("Planary").font(.custom("Poppins-SemiBold", size: 36))
                    .foregroundColor(Color.white)
                    .padding(.bottom, 40.0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ZStack (alignment: .center){
                    VStack{
                        Text("\(kilogramOptions[selectedKilogramIndex]) kg")
                            .font(.custom("Poppins-SemiBold", size: 36))
                                .foregroundColor(Color.white)
                            
                    }
                    ProgressBar(progress: self.$progressValue)
                        .padding(.top, 20.0)
                    .frame(width: 150)
                }
                Spacer()
            }
            .padding(.horizontal, 25.0)
            .padding(/*@START_MENU_TOKEN@*/.top, 10.0/*@END_MENU_TOKEN@*/)
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.green
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(lineWidth: 34)
                .opacity(0.2)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0,to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 30,lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2))
        }
    }
}
