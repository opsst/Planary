//
//  ProfileView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color.gray
            Text("Profile")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
