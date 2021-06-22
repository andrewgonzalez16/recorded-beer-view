//
//  ContentView.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/21/21.
//

import SwiftUI

struct ContentView: View {
    var recordedBeerViewModel = beerListViewModel()
    
    @State var beers: [RecordedBeer]
    init () {
        _beers = State(initialValue: recordedBeerViewModel.beerList)
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            NavigationView {
                /*List(0..<2){
                    item in NavigationLink(
                        destination: BeerListView(),
                        label: {
                            Text("🍺 \(item)")
                        })
                }*/
                List {
                    ForEach(recordedBeerViewModel.beerList) {
                    //ForEach(beers) {
                        beer in NavigationLink(
                            //destination: BeerDetailView(beerArg: beer)
                            destination: BeerDetailView(beerArg: beer, beerList: $beers)
                                .navigationBarHidden(true)) {
                            BeerRowView(beer: beer)
                                .padding(.vertical, 4)
                                
                        }
                        
                         
                        
                    }
                }
                .onAppear(perform: {
                    print("APPEARED!!")
                    recordedBeerViewModel.beerList = beers
                    recordedBeerViewModel.objectWillChange.send()
                    print(recordedBeerViewModel.beerList[0])
                    
                })
                .navigationTitle("Beers")
                
            }// End of Navigation
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(recordedBeerViewModel)

        }
        
    }
    
}

struct BeerListView: View {
    var body: some View {
        Text("Hello World")
            .bold()
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
