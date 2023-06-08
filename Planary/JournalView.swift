//
//  JournalView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        ZStack{
            Color.blue
            Text("Journal")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
