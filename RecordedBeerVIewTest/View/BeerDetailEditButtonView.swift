//
//  BeerDetailEditButtonView.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/30/21.
//

import SwiftUI

struct BeerDetailEditButtonView: View {
    @Binding var editBeerDetails: Bool
    var body: some View {
        HStack {
            Button(action: {
                editBeerDetails.toggle()
                print("EDIT Button PUSHED")
            }) {
                Text("Edit")
            }
        }
        // Adding sheet for editing major beer details:
        /*.sheet(isPresented: $editBeerDetails, content: {
            BeerDetailViewEdit(originalBeerArg: beer, editBeerDetailsArg: $editBeerDetails)
            
        })*/
    }
}

struct BeerDetailEditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailEditButtonView(editBeerDetails: .constant(true))
    }
}
