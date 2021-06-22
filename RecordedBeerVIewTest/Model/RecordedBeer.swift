//
//  RecordedBeer.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/22/21.
//

import Foundation
import SwiftUI


struct RecordedBeer: Hashable, Codable, Identifiable {
    let id: String
    let imageName: String
    let name: String
    let style: String
    let brewery: String
    let releaseYear: Int
    let description: String
    let date: Date
    let location: String // This will need to be changed from String to an actual location object using CCLocationManager()
    let rating: CGFloat
    let memorable: Bool
    
    
    init(id: String = UUID().uuidString, imageName: String, beerName: String, beerStyle: String, breweryName: String, beerReleaseYear: Int, beerDescription: String, date: Date, location: String, beerRating: CGFloat, memorable: Bool  ) {
        self.id = id
        self.imageName = imageName
        self.date = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        self.name = beerName
        self.style = beerStyle
        self.brewery = breweryName
        self.releaseYear = beerReleaseYear
        self.description = beerDescription
        self.location = location
        self.rating = beerRating
        self.memorable = memorable
        
    }
    
    func updateRecordedBeer() -> RecordedBeer {
        return RecordedBeer(id: id, imageName: imageName, beerName: name, beerStyle: style, breweryName: brewery, beerReleaseYear: releaseYear, beerDescription: description, date: date, location: location, beerRating: rating, memorable: memorable)
    }
    
    func updateRecordedBeer1(updatedBeer: RecordedBeer) -> RecordedBeer {
        
        return RecordedBeer(id: id, imageName: updatedBeer.imageName, beerName: updatedBeer.name, beerStyle: updatedBeer.style, breweryName: updatedBeer.brewery, beerReleaseYear: updatedBeer.releaseYear, beerDescription: updatedBeer.description, date: updatedBeer.date, location: updatedBeer.location, beerRating: updatedBeer.rating, memorable: updatedBeer.memorable)
    }
    
    func updateBeerTest() -> RecordedBeer{
        return RecordedBeer(id: id, imageName: imageName, beerName: name, beerStyle: style, breweryName: brewery, beerReleaseYear: releaseYear, beerDescription: description, date: date, location: location, beerRating: 4.9, memorable: memorable)
    }
}
