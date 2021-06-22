//
//  EditBeerView.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 5/10/21.
//

import SwiftUI

struct EditBeerView: View {
    var body: some View {
        List (0..<2){
            index in NavigationLink(
                destination: SingularBeerView(),
                label: {
                    Text("Beer \(index+1)")
                })
        }
        
    }
}


struct SingularBeerView: View {
    var body: some View {
        VStack {
            Text("BEER INFO GOES HERE")
            
        }
        
    }
}

struct EditBeerView_Previews: PreviewProvider {
    static var previews: some View {
        EditBeerView()
    }
}
