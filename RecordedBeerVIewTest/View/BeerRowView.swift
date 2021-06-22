//
//  BeerRowView.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/22/21.
//

import SwiftUI

struct BeerRowView: View {
    var beer: RecordedBeer
    
    var body: some View {
        HStack {
            Image(beer.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(8)
            
            
            VStack(alignment: .leading, spacing: 3) {
                Text (beer.name)
                    .font(.system(size: 20))
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(0.4)
                Text("\(beer.rating, specifier: "%.2f")")
                    .font(.system(size: 15))
                Text(beer.description)
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
                
            }//: End of Vstack:
        } //: End of HStack
        
        
        
    }
}

struct BeerRowView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRowView(beer: BeerDataTest[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
