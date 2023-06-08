//
//  +View.swift
//  Planary
//
//  Created by Pisit Jaiton on 8/6/2566 BE.
//

import SwiftUI

extension View {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
