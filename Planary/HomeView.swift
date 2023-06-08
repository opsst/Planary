//
//  HomeView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
            Text("Planary").font(.custom("Poppins-SemiBold", size: 24))
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
