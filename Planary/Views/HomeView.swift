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
            Text("Planary").font(.custom("Poppins-SemiBold", size: 24))
            Color.red
            Text("Home")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
