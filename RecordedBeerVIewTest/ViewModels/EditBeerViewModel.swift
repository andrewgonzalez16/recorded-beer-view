//
//  EditBeerViewModel.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 5/11/21.
//

import Foundation
import SwiftUI
// Used for CRUD operations on beer object:
class EditBeerViewModel: ObservableObject {
    @Published var originalBeer: RecordedBeer
    
    // initializing the view model:
    init (originalBeer: RecordedBeer) {
        self.originalBeer = originalBeer
        
    }
    
    func updateBeer(updatedBeer: RecordedBeer){
        print("Before Update: \(updatedBeer) ")
        print("After Update: \(updatedBeer) ")
        
    }
    
//    func updateRecordedBeer(updatedBeer: RecordedBeer) {
//        // first we find the beer in the array beerTestData
//        if let index = beerTestData.firstIndex(where: {$0.id == updatedBeer.id}) {
//            //beerTestData[index] = beerTestData[index].updateRecordedBeer(updatedBeer: updatedBeer)
//            print("Before Update: \(beerTestData[index]) ")
//            beerTestData[index] = updatedBeer.updateRecordedBeer()
//            print("After Update: \(beerTestData[index])")
//        }
//
//
//    }
    
    
}
