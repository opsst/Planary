//
//  HomeView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct HomeView: View {
    @State var percent: CGFloat = 12.5
    
    @AppStorage("signIn") var isSignIn = false

    @State var progressValue: Float = 0.0
    @State private var isPresented = false
    @State private var showModal = false
    @State var overEat = false
    
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
    
    @AppStorage("selectedPoundIndex")  var selectedPoundIndex = 60
    @AppStorage("selectedKilogramIndex") var selectedKilogramIndex = 60
    
    @AppStorage("maxkcal") var maxkcal = 0
    
    @AppStorage("carbs") var carbs = 0
    @AppStorage("maxcarbs") var maxcarbs = 50
    @AppStorage("protein") var protein = 0
    @AppStorage("maxprotein") var maxprotein = 50
    @AppStorage("fat") var fat = 0
    @AppStorage("maxfat") var maxfat = 50
    
    @AppStorage("food") var food = 0
    @AppStorage("burn") var burn = 0
    
    
    
    
    let feetOptions = Array(3...8)
    let inchesOptions = Array(0...11)
    let centimeterOptions = Array(100...200)
    let poundOptions = Array(65...440)
    let kilogramOptions = Array(30...200)

    func calculateBMR0(weight: Double, heightFeet: Double, heightInches: Double, age: Int, isMale: Bool) -> Double {
        
        print("isBMR Feet")
        let weightInPounds = weight // Assuming weight is already in pounds
        let heightInInches = (heightFeet * 12) + heightInches // Convert height to total inches
        
        // Calculate BMR based on Harris-Benedict equation
        var bmr: Double = 0.0
        var thisgoal: Double = 0.0
        if(goal == 1){
            thisgoal = -500.0
        } else if goal == 3 {
            thisgoal = 500.0
        }
        
        print(thisgoal)
        if isMale {
            bmr = 66 + (6.23 * weightInPounds) + (12.7 * heightInInches) - (6.8 * Double(age)) + thisgoal
        } else {
            bmr = 655 + (4.35 * weightInPounds) + (4.7 * heightInInches) - (4.7 * Double(age)) + thisgoal
        }
        
        print(bmr)
        if(Int(bmr) + burn < food){
            overEat = true
        }else {
            overEat = false
        }
        return bmr
    }
    
    
    func nutritionToPercent(){
        if (diet == 1){
            maxcarbs = maxkcal * 50 / 100 / 4
            maxprotein = maxkcal * 30 / 100  / 4
            maxfat = maxkcal * 20 / 100  / 9
        } else if (diet == 2){
            maxcarbs = maxkcal * 5 / 100 / 4
            maxprotein = maxkcal * 25 / 100 / 4
            maxfat = maxkcal * 75 / 100 / 9
        }else if (diet == 3){
            maxcarbs = maxkcal * 30 / 100 / 4
            maxprotein = maxkcal * 40 / 100 / 4
            maxfat = maxkcal * 30 / 100 / 9
        }
        print(maxcarbs, maxprotein ,maxfat,maxkcal)
    }
    
    func findInpercent() {

        if selection == 0{
            let nowCal = Float(calculateBMR0(weight: Double(poundOptions[selectedPoundIndex]), heightFeet: Double(feetOptions[selectedFeetIndex]), heightInches: Double(inchesOptions[selectedInchesIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: (gender == 1))) - Float(food) + Float(burn)
            let sumCal = Float(calculateBMR0(weight: Double(poundOptions[selectedPoundIndex]), heightFeet: Double(feetOptions[selectedFeetIndex]), heightInches: Double(inchesOptions[selectedInchesIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: (gender == 1)))
            let sum = nowCal / sumCal
            maxkcal = Int(sumCal)
                 DispatchQueue.main.async {
                     progressValue = 1-sum
                 }
        }else{
            let nowCal = Float(Int(calculateBMR1(weight: Double(kilogramOptions[selectedKilogramIndex]), height: Double(centimeterOptions[selectedCentimeterIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: Bool(gender == 1)))) - Float(food) + Float(burn)
            let sumCal = Float(calculateBMR1(weight: Double(kilogramOptions[selectedKilogramIndex]), height: Double(centimeterOptions[selectedCentimeterIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: Bool(gender == 1)))
            
            let sum = nowCal / sumCal
            maxkcal = Int(sumCal)
                 DispatchQueue.main.async {
                     progressValue = 1-sum
                 }
        }
        
        nutritionToPercent()

    }

    func calculateBMR1(weight: Double, height: Double, age: Int, isMale: Bool) -> Double {
        print("isBMR KG")
        
        let weightInKg = weight // Assuming weight is already in kilograms
        let heightInCm = height // Assuming height is already in centimeters
        
        print(weight , height, age ,isMale)
        // Calculate BMR based on Harris-Benedict equation
        var bmr: Double = 0.0
        var thisgoal: Double = 0.0
        if(goal == 1){
            thisgoal = -500.0
        } else if goal == 3 {
            thisgoal = 500.0
        }
        
        if isMale {
            bmr = 66 + (13.75 * weightInKg) + (5 * heightInCm) - (6.75 * Double(age)) + thisgoal
        } else {
            bmr = 655 + (9.56 * weightInKg) + (1.85 * heightInCm) - (4.68 * Double(age)) + thisgoal
        }
        print(bmr)
        if(Int(bmr) + burn < food){
            overEat = true
        }else {
            overEat = false
        }
        return bmr
    }
    func calculateAge(day: Int, month: Int, year: Int) -> Int? {
        print("age")
        print(day, month, year)
        let currentDate = Date()
        let calendar = Calendar(identifier: .buddhist) // Use the Buddhist calendar identifier
        
        // Convert the A.D. year to B.E.
        let buddhistYear = year + 543
        
        // Create a DateComponents object with the given birthdate
        var birthdateComponents = DateComponents()
        birthdateComponents.day = day
        birthdateComponents.month = month
        birthdateComponents.year = buddhistYear // Use the converted B.E. year
        
        // Get the current date components
        let currentComponents = calendar.dateComponents([.day, .month, .year], from: currentDate)
        
        // Create a new Date object using the birthdate components
        if let birthdate = calendar.date(from: birthdateComponents) {
            // Calculate the difference between the birthdate and current date
            let ageComponents = calendar.dateComponents([.year], from: birthdate, to: currentDate)
            
            // Extract the year component to get the age
            let age = ageComponents.year
            
            print(age)
            return age
        }
        
        return 20
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading){
                
                Color(hex:0xFF181818)
                    .edgesIgnoringSafeArea(.top)
                    .onAppear{
                        findInpercent()

                    }
                ScrollView {
                    VStack (alignment: .leading){
                   
                        Text("Calories")
                            .font(.custom("Inter-Regular_Bold", size: 20))
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)

                        HStack {
                            Spacer()
                            ZStack (alignment: .center){
                                VStack{
                                    Text(selection == 0 ?
                                         String(abs(Int(calculateBMR0(weight: Double(poundOptions[selectedPoundIndex]), heightFeet: Double(feetOptions[selectedFeetIndex]), heightInches: Double(inchesOptions[selectedInchesIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: (gender == 1))) - food + burn ))
                                         :
                                            String(abs(Int(calculateBMR1(weight: Double(kilogramOptions[selectedKilogramIndex]), height: Double(centimeterOptions[selectedCentimeterIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: Bool(gender == 1)))-food + burn ))
                                    )
                                        .font(.custom("Poppins-Bold", size: 30))
                                        .foregroundColor(Color.white)
                                    Text(!overEat ? "KCAL LEFT" : "KCAL OVER")
                                        .font(.custom("Poppins-Medium", size: 10))
                                        .foregroundColor(Color.white)
                                        
                                }
                                .padding(.top)
                                ProgressBar(progress: self.$progressValue, overEat: $overEat)
                                    .padding(.top, 20.0)
                                .frame(width: 150)
                            }
                            Spacer()
                            Spacer()
                            VStack(alignment: .leading){
                                Spacer()
                                HStack {
                                    Image(systemName: "flag.fill")
                                        .padding(.trailing, 4.0)
                                        .font(.system(size: 24))
                                        .foregroundColor(Color.blue)
                                    VStack(alignment: .leading) {
                                        Text("Goal")
                                            .font(.custom("Inter-Regular_Bold", size: 16))
                                            .foregroundColor(Color.blue)
                                        Text(selection == 0 ?
                                             String(Int(calculateBMR0(weight: Double(poundOptions[selectedPoundIndex]), heightFeet: Double(feetOptions[selectedFeetIndex]), heightInches: Double(inchesOptions[selectedInchesIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: (gender == 1)))) :
                                                String(Int(calculateBMR1(weight: Double(kilogramOptions[selectedKilogramIndex]), height: Double(centimeterOptions[selectedCentimeterIndex]), age: calculateAge(day: Int(day) ?? 1, month: Int(month) ?? 1, year: Int(year) ?? 2000) ?? 20, isMale: Bool(gender == 1)))))
                                            .font(.custom("Inter-Regular_Medium", size: 14))
                                            .foregroundColor(Color.white)
                                    }
                                }
                                Spacer()
                                HStack {
                                    Image(systemName: "fork.knife")
                                        .padding(.trailing, 4.0)
                                        .font(.system(size: 24))
                                        .foregroundColor(Color.green)
                                    VStack (alignment: .leading){
                                        Text("Food")
                                            .font(.custom("Inter-Regular_Bold", size: 16))
                                            .foregroundColor(Color.green)
                                        
                                        Text(String(food))
                                            .font(.custom("Inter-Regular_Medium", size: 14))
                                            .foregroundColor(Color.white)
                                    }
                                }
                                Spacer()
                                HStack {
                                    Image(systemName: "figure.run")
                                        .padding(.trailing, 2.0)
                                        .font(.system(size: 24))
                                        .foregroundColor(Color.orange)
                                    VStack(alignment: .leading) {
                                        Text("Workout")
                                            .font(.custom("Inter-Regular_Bold", size: 16))
                                            .foregroundColor(Color.orange)
                                            
                                        Text(String(burn))
                                            .font(.custom("Inter-Regular_Medium", size: 14))
                                            .foregroundColor(Color.white)
                                    }
                                }
                                Spacer()
                            }
                            .padding(.leading, 20.0)
                            Spacer()
                        }
                        .frame(maxHeight:200)
                        .padding(.bottom, 20.0)
                        HStack {
                            Text("Stats")
                                .font(.custom("Inter-Regular_Bold", size: 20))
                            .foregroundColor(Color.white)
                            Spacer()
                            diet == 1 ? Image(systemName: "leaf.fill")
                            :
                                
                            diet == 2 ? Image(systemName: "mug.fill")
                            :Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                            Text(diet == 1 ? "Balanced Diet": diet == 2 ?"Ketogenic & Low Carb": "High Protein")
                                .font(.custom("Inter-Regular_SemiBold", size: 16))
                                .foregroundColor(diet == 1 ? Color.green: diet == 2 ? Color.orange :Color.blue)
                        }
                        .padding(.bottom, 30.0)
                        .foregroundColor(diet == 1 ? Color.green: diet == 2 ? Color.orange :Color.blue)
                        
                        HStack{
               
                            VStack{
                                Text("Carbs")
                                    .font(.custom("Inter-Regular_Bold", size: 12))
                                    .foregroundColor((Double(carbs) / Double(maxcarbs)) * 100 > 100 ? Color.red :Color.white)
                                    .padding(.bottom, 5.0)
                                ZStack{
                                    ZStack(alignment: .leading){
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width: 100,height: 10)
                                            .foregroundColor(Color(hex: 0xFF454545).opacity(0.5))
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width:(Double(carbs) / Double(maxcarbs)) * 100 > 100 ? 100 :carbs == 0 ? 0 : CGFloat((Double(carbs) / Double(maxcarbs)) * 100) ,height: 10)
                                            .foregroundColor((Double(carbs) / Double(maxcarbs)) * 100 > 100 ? Color.red :Color.white)
                                    }
                                    .animation(.linear, value: carbs)
                                }
                                .padding(.bottom, 5.0)
                                Text("\(carbs) g / \(maxcarbs) g")
                                    .font(.custom("Inter-Regular_Bold", size: 12))
                                    .foregroundColor((Double(carbs) / Double(maxcarbs)) * 100 > 100 ? Color.red :Color.white)
                                    .padding(.bottom, 5.0)
                            }
                            Spacer()
                            VStack{
                                Text("Protein")
                                    .font(.custom("Inter-Regular_Bold", size: 12))
                                    .foregroundColor((Double(protein) / Double(maxprotein)) * 100 > 100 ? Color.red : Color.white)
                                    .padding(.bottom, 5.0)
                                ZStack{
                                    ZStack(alignment: .leading){
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width: 100,height: 10)
                                            .foregroundColor(Color(hex: 0xFF454545).opacity(0.5))
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width:(Double(protein) / Double(maxprotein)) * 100 > 100 ? 100: protein == 0 ? 0 :CGFloat((Double(protein) / Double(maxprotein)) * 100.0) ,height: 10)
                                            .foregroundColor((Double(protein) / Double(maxprotein)) * 100 > 100 ? Color.red : Color.white)
                                    }
                                    .animation(.linear, value: protein)
                                }
                                .padding(.bottom, 5.0)
                                Text("\(protein) g / \(maxprotein) g")
                                    .font(.custom("Inter-Regular_SemiBold", size: 12))
                                    .foregroundColor((Double(protein) / Double(maxprotein)) * 100 > 100 ? Color.red :Color.white)
                                    .padding(.bottom, 5.0)
                            }
                            Spacer()
                            VStack{
                                Text("Fat")
                                    .font(.custom("Inter-Regular_SemiBold", size: 12))
                                    .foregroundColor((Double(fat) / Double(maxfat)) * 100 > 100 ? Color.red :Color.white)
                                    .padding(.bottom, 5.0)
                                ZStack{
                                    ZStack(alignment: .leading){
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width: 100,height: 10)
                                            .foregroundColor(Color(hex: 0xFF454545).opacity(0.5))
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width: (Double(fat) / Double(maxfat)) * 100 > 100 ? 100 :fat == 0 ? 0 : CGFloat((Double(fat) / Double(maxfat)) * 100) ,height: 10)
                                            .foregroundColor((Double(fat) / Double(maxfat)) * 100 > 100 ? Color.red: Color.white)
                                    }
                                    .animation(.linear, value: fat)
                                }
                                .padding(.bottom, 5.0)
                                Text("\(fat) g / \(maxfat) g")
                                    .font(.custom("Inter-Regular_SemiBold", size: 12))
                                    .foregroundColor((Double(fat) / Double(maxfat)) * 100 > 100 ? Color.red : Color.white)
                                    .padding(.bottom, 5.0)
                            }
                            

                        }
                        .padding(.bottom, 20.0)
                        HStack {
                            Text("Goal ->")
                                .font(.custom("Inter-Regular_Bold", size: 20))
                                .foregroundColor(Color.white)
                                .padding(.bottom, 10.0)
                        
                            Text(goal == 1 ? "On Cutting": goal == 2 ? "On Maintain" :"On Bulking")
                                .font(.custom("Inter-Regular", size: 16))
                                .foregroundColor(Color.white)
                                .padding(.bottom, 10.0)
                        }
                    
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(hex:0xFF2B2B2B))
                            .frame(height: 260)
                            VStack{
                                Image("scalew")
                                    .resizable()
                                    .padding(.top)
                                    .frame( maxWidth: 150,  maxHeight: 150)
                                Text("You're lose 5 kilograms!")
                                    .font(.custom("Inter-Regular_Bold", size: 20))
                                .foregroundColor(Color.white)
                                .padding(.bottom, 20.0)
                                VStack {
                                    ZStack(alignment: .leading){
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width: 300,height: 10)
                                            .foregroundColor(Color(hex: 0xFF454545).opacity(0.5))
                                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                                            .frame(width: 90 ,height: 10)
                                            .foregroundColor(Color(hex: 0xFFEB3800))
                                
                                    }
                                    HStack{
                                        
                                        Text(selection == 0 ? "\(poundOptions[selectedPoundIndex]) lbs":
                                                "\(kilogramOptions[selectedKilogramIndex]) kg")
                                            .font(.custom("Inter-Regular_SemiBold", size: 12))
                                            .foregroundColor(Color.white)
                                            .padding(.leading, 20.0)
                                        Spacer()
                                        Text(selection == 0 ? "\(poundOptions[selectedPoundIndex]-20) lbs":
                                                "\(kilogramOptions[selectedKilogramIndex]-8) kg")
                                            .font(.custom("Inter-Regular_SemiBold", size: 12))
                                            .foregroundColor(Color.white)
                                            .padding(.trailing, 20.0)
                                    
                                    }
                                }
                                Spacer()
                            }
                            .frame(height: 260)
                        }
                        .padding(.bottom, 20.0)
                        HStack {
                            Text("Exercise")
                                .font(.custom("Inter-Regular_Bold", size: 20))
                                .foregroundColor(Color.white)
                                .padding(.bottom, 10.0)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(hex:0xFF2B2B2B))
                            .frame(height: 100)
                            HStack{
    
                                Image(systemName: "dumbbell.fill")
                                    .padding(.leading, 25.0)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color(hex: 0xFFEB3800))
//                                    .resizable()
//                                    .padding(.top)
//                                    .frame( maxWidth: 100,  maxHeight: 60)
                                VStack (alignment: .leading){
                                    Text("Daily Goal")
                                        .font(.custom("Inter-Regular_Bold", size: 16))
                                        .foregroundColor(Color.white)
                                        .padding(.bottom, 1.0)
                                    Text("\(burn) / 250 Kcal")
                                        .font(.custom("Inter-Regular_Medium", size: 14))
                                    .foregroundColor(Color.white)
                                }
                                .padding(.leading, 15.0)

                                Spacer()
                                NavigationLink(destination: FoodView())  {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color(hex: 0xFFBC998E))

                                        .font(.system(size:20,weight:.bold))
                                        .frame(width: 40, height: 40)
                                        .background(Color(hex: 0xFF515050))
                                        .clipShape(Circle())
                                        .padding(.trailing, 25.0)
                                }
                            }
                            .frame(height: 100)
                        }
                        .padding(.bottom, 50.0)
            
                        Spacer()
                    }
                    .padding(.horizontal, 25.0)
                .padding(.top, 80)
                }
                Color(hex:0xFF181818)
                    .frame(maxHeight:110)
                    .ignoresSafeArea()
                HStack {
                    Text("Planary").font(.custom("Poppins-SemiBold", size: 30))
                        .foregroundColor(Color.white)
                        .padding(.bottom, 30.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25.0)
                    NavigationLink(destination: FoodView())  {
                        HStack {
                            Image(systemName: "plus")
    
                            Text("Add Food")
                            

                        }
                        .foregroundColor(Color(hex: 0xFFBC998E))
                        .font(.system(size:14,weight:.bold))
                        .frame(width: 120, height: 40)
                        .background(Color(hex: 0xFF515050))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.bottom, 25.0)
                        .padding(.horizontal, 25.0)

                    }
//                    Image(systemName: "plus")
//                        .foregroundColor(Color(hex: 0xFFBC998E))
//                        .font(.system(size:20,weight:.bold))
//                        .frame(width: 40, height: 40)
//                        .background(Color(hex: 0xFF515050))
//                        .clipShape(Circle())
//                        .onTapGesture{
//                            showModal = true
//                        }
//                        .sheet(isPresented: $showModal){
//
//                        }
//                        .padding(.bottom, 25.0)
//                        .padding(.horizontal, 25.0)

        
                }
                .padding(.vertical)
                    


            }
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
    @Binding var overEat: Bool
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
                .foregroundColor(!self.overEat ? color: Color.red)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2))
        }
        
    }
    
}


