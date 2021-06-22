//
//  BeerCardView.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/22/21.
//

import SwiftUI

struct BeerCardView: View {
    var beer:  RecordedBeer
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            VStack {
                // Beer Image:
                Image(beer.imageName)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                // Beer Title:
                Text(beer.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                // Beer Headline:
                Text(beer.description)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
            }//: End of VStack
            
        }//: End of ZStack
    }
}

struct BeerCardView_Previews: PreviewProvider {
    static var previews: some View {
        BeerCardView(beer: BeerDataTest[0])
    }
}
