//
//  BeerHeaderView.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/22/21.
//

import SwiftUI

struct BeerHeaderView: View {
    var beer: RecordedBeer
    @State private var isAnimatingImage: Bool = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Image(beer.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .padding()
                .scaleEffect(isAnimatingImage ? 0.8 : 0.4)
            
        } //: End of ZStack
        .frame(height:440)
        .onAppear() { // small, but nice touch when appearing:
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
        
        
        
    }
}

struct BeerHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BeerHeaderView(beer: BeerDataTest[0])
    }
}
