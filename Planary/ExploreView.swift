//
//  ExploreView.swift
//  Planary
//
//  Created by A667156 A667156 on 7/6/2566 BE.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
       
        ZStack {
            Color(cgColor: CGColor(red: 0.094, green: 0.095, blue: 0.095, alpha: 1))
            ScrollView(showsIndicators: false){
                Text("Feature")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25,weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading,20)
                    .padding(.top,60)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.red)
                    .frame(width: .infinity, height: 200)
                    
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,10)
                
                Text("Join a Challenge")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25,weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading,20)
                ScrollView(.horizontal,showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(0..<10) { index in
                                    CardView(index: index)
                                }
                            }
                            .padding(.leading,20)
                }
                .padding(.bottom,10)
                Text("Popular Content")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25,weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading,20)
                VStack(spacing: 20) {
                    
                            HStack(spacing: 20) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.red)
                                    .frame(width: 170, height: 100)
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.red)
                                    .frame(width: 170, height: 100)
                            }
                            
                            HStack(spacing: 20) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.red)
                                    .frame(width: 170, height: 100)
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.red)
                                    .frame(width: 170, height: 100)
                            }
                            
                            HStack(spacing: 20) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.red)
                                    .frame(width: 170, height: 100)
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.red)
                                    .frame(width: 170, height: 100)
                            }
                        }
                        
            
                
                
            }
            .padding(.vertical)
            .overlay(
                ZStack{
                    Color(CGColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1))
                    Image(systemName: "magnifyingglass")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading,20)
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                    Text("Explore")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                    Image(systemName: "bookmark")
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding(.trailing,20)
                        .foregroundColor(Color.white)
                        .padding(.top,60)
                   
                   
                }
                    .frame(height: 110)
                    .frame(maxHeight: .infinity,alignment: .top)
                    
                    .edgesIgnoringSafeArea(.top)
                    
                    
        )
        }
        
    }
}


struct CardView: View {
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue)
            .frame(width: 180, height: 200)
            .overlay(
                Text("Card \(index + 1)")
                    .foregroundColor(.white)
                    .font(.title)
            )
    }
}


struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
