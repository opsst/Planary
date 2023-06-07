import SwiftUI

struct NextView: View {
    @Binding var userData: UserData

    var body: some View {
        VStack {
            Text("Your name: \(userData.name)")
                .padding()
        }
    }
}
