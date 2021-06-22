//
//  BeerListViewModel.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 5/12/21.
//

import Foundation

class beerListViewModel: ObservableObject {
    @Published var beerList:[RecordedBeer] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    // initializing the view model:
    init () {
        initalizeViewModel()
    }
    
    
    func updateRecordedBeer(updatedBeer: RecordedBeer) {
        // first we find the beer in the array beerTestData
        if let index = beerList.firstIndex(where: {$0.id == updatedBeer.id}) {
            //beerTestData[index] = beerTestData[index].updateRecordedBeer(updatedBeer: updatedBeer)
            print("Before Update: \(beerList[index]) ")
            beerList[index] = updatedBeer.updateRecordedBeer()
            print("After Update: \(beerList[index])")
        }
        
        
    }
    
    
    func initalizeViewModel() {
        beerList.append(contentsOf: [
            RecordedBeer(imageName: "RealBeerImage", beerName: "Founders IPA", beerStyle: "Bourbon Barrel Aged Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "Hoppy, Light, Great session beer' Perfect Lawn Mower beer to enjoy during a hot summer day.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: false),
            
            RecordedBeer(imageName: "BeerImage", beerName: "Founders Breakfast Stout", beerStyle: "Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            RecordedBeer(imageName: "BeerImage", beerName: "Founders IPA", beerStyle: "IPA", breweryName: "Founders", beerReleaseYear: 2018, beerDescription: "Hoppy, Light, Great session beer", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            
            RecordedBeer(imageName: "BeerImage", beerName: "Founders Breakfast Stout", beerStyle: "Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            RecordedBeer(imageName: "BeerImage", beerName: "Founders IPA", beerStyle: "IPA", breweryName: "Founders", beerReleaseYear: 2018, beerDescription: "Hoppy, Light, Great session beer", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            
            RecordedBeer(imageName: "BeerImage", beerName: "Founders Breakfast Stout", beerStyle: "Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            RecordedBeer(imageName: "BeerImage", beerName: "Founders IPA", beerStyle: "IPA", breweryName: "Founders", beerReleaseYear: 2018, beerDescription: "Hoppy, Light, Great session beer", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            
            RecordedBeer(imageName: "BeerImage", beerName: "Founders Breakfast Stout", beerStyle: "Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            RecordedBeer(imageName: "BeerImage", beerName: "Founders IPA", beerStyle: "IPA", breweryName: "Founders", beerReleaseYear: 2018, beerDescription: "Hoppy, Light, Great session beer", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            
            RecordedBeer(imageName: "BeerImage", beerName: "Founders Breakfast Stout", beerStyle: "Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            RecordedBeer(imageName: "BeerImage", beerName: "Founders IPA", beerStyle: "IPA", breweryName: "Founders", beerReleaseYear: 2018, beerDescription: "Hoppy, Light, Great session beer", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            
            RecordedBeer(imageName: "BeerImage", beerName: "Founders Breakfast Stout", beerStyle: "Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever. The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever. The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            RecordedBeer(imageName: "BeerImage", beerName: "Founders IPA", beerStyle: "IPA", breweryName: "Founders", beerReleaseYear: 2018, beerDescription: "Hoppy, Light, Great session beer", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true),
            
            RecordedBeer(imageName: "BeerImage", beerName: "Founders Breakfast Stout", beerStyle: "Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and two types of coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: true)
        ]);
    }
    
}
