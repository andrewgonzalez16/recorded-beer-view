//
//  BeerDetailView.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/22/21.
//

import SwiftUI

struct BeerDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recordedBeerViewModel: beerListViewModel
    
    @State var beer: RecordedBeer
    // To toggle Edit Beer Sheet:
    @State var editBeerDetails = false
    @Binding var beerList: [RecordedBeer]
    
    // Used for Rating:
    @State private var showRatingSlider: Bool = false
    @State private var ratingSliderValue: CGFloat
    @State private var originalRating: CGFloat
    
    @State var placeholderValue: String = ""
    @State var beerNameString: String = ""
    @State var isEditingBeerName = false
    @State var isFire = false

    //@State private var isEditing = false
    //@State private var descriptionTestString: String = ""
    //@State private var isEditingBeerName = false
    //@State private var beerNameString: String
    
    init(beerArg: RecordedBeer, beerList: Binding<[RecordedBeer]>) {
    //init(beerArg: RecordedBeer) {
        //beer = beerArg
        _beer = State(initialValue: beerArg)
        _beerNameString = State(initialValue: beerArg.name)
        _placeholderValue = State(initialValue: "Add Beer Name")
        _isFire = State(initialValue: beerArg.memorable)
        _originalRating = State(initialValue: beerArg.rating)
        _ratingSliderValue = State(initialValue: beerArg.rating)
        _beerList = beerList
        
    }
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 20) {
                        // Header:
                        Spacer()
                        BeerHeaderView(beer: beer)
                            .padding(.top, 30)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            // Beer Title:
                            VStack(alignment:.leading, spacing: 1.0) {
                                HStack {
                                    Text("Beer Name:")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
        
                                } // End of HStack
                                
                                TextField("\(placeholderValue)", text: $beerNameString)
                                    .font(.system(size: 30, weight: .heavy, design: .default))
                                    .disabled(isEditingBeerName)
                                
                            } // End of VStack
                            
                            
                            // Beer Rating and Memorable Toggle:
                            HStack (spacing: 53) {
                                // Beer rating
                                VStack(alignment:.leading, spacing: 1.0) {
                                    Text("Beer Rating:")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    // if the raitng is less than 1 we'll display an N/A value
                                    if(ratingSliderValue < 1){
                                        Button(action: {showRatingSlider.toggle()}){
                                            Text("N/A")
                                                .font(.system(size: 30, weight: .heavy, design: .default))
                                                .foregroundColor(.black)
                                        }
                                    }
                                    // Otherwise we'll display the actual value:
                                    else {
                                        
                                        Button(action: {showRatingSlider.toggle()}){
                                            Text("\(ratingSliderValue, specifier: "%.2f")")
                                                .font(.system(size: 30, weight: .heavy, design: .default))
                                                .foregroundColor(.black)
                                        }
                                        
                                    }
                                
                    
                                }
                                
                                // Beer isFire/memorable Toggle
                                VStack(alignment:.center, spacing: 6.0) {
                                    Text("Memorable:")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                
                                    Button(action: { isFire.toggle() }, label: {
                                        if (isFire) {
                                            Image(systemName: "flame.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 35, height: 30)
                                                .foregroundColor(.red)
                                                .shadow(color: .red, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                            
                                        }
                                        else {
                                            Image(systemName: "flame")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 35, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(.gray)
                                        }
                                    })
                                    
                                    
                                }
                                
                                //Beer Style
                                VStack(alignment:.leading, spacing: 1.0) {
                                    Text("Beer Style:")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    Text(beer.style)
                                        .fontWeight(.bold)
                                        .lineLimit(3)
                                    
                                }
                                // End of VStack
                            } // End of HStack
                            
                            // Beer Rating Slider:
                            if (showRatingSlider){
                                // HStack to hold buttons and slider:
                                HStack(spacing: 15) {
                                    Text("N/A")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                    
                                    Slider(value: $ratingSliderValue, in: 0.95...10, step: 0.05)
                                        .accentColor(.orange)
                                    
                                    Text("10")
                                        .font(.system(size: 16, weight: .semibold, design: .default))
                                    // Button to reset rating value:
                                    Button(action: {
                                        // Resetting value:
                                        ratingSliderValue = originalRating
                                    }){
                                        Image(systemName: "arrow.uturn.backward.circle")
                                    }
                                    
                                    // EXTRA Button to confirm rating value:
                                    Button(action: {
                                        // hiding the beer slider value:
                                        showRatingSlider.toggle()
                                    }){
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                                
                            }//: End of Beer Rating Slider
                            
                            
                            // Brewery:
                            VStack(alignment:.leading, spacing: 1.0) {
                                Text("Brewery:")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                // Beer Description:
                                Text(beer.brewery)
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                
                            } // End of VStack
                            
                            // Beer Description: Limit this to 240 Characters
                            VStack(alignment:.leading, spacing: 1.0) {
                                Text("Personal Beer Description:")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                // Beer Description:
                                Text(beer.description)
                                    //.font(.headline)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 15, weight: .heavy, design: .default))

                                
                            } // End of VStack
                            
                            // Beer Release Year:
                            VStack(alignment:.leading, spacing: 1.0) {
                                Text("Release Year:")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                if(beer.releaseYear <= 0){
                                    Text("N/A")
                                }
                                else {
                                    Text(String(beer.releaseYear))
                                }
                                
            
                                
                            } // End of VStack
                            
                            
                            // Drink Location:
                            VStack(alignment:.leading, spacing: 1.0) {
                                Text("Recorded Location:")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            // Date Recoreded:
                            VStack(alignment:.leading, spacing: 1.0) {
                                Text("Date Recorded:")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                // Beer Description:
                                Text("\(beer.date)")
                                    .font(.headline)
                                    .multilineTextAlignment(.leading)
                                
                            } // End of VStack
                            
                            
                            
                            

                            
                        }//: End of VStack
                        .padding(.horizontal, 20)
                        .frame(maxWidth: 640, alignment: .leading)
                    }//: End of VStack
                    .navigationBarTitle(beer.name, displayMode: .inline)
                    //.navigationBarHidden(true)
                                    
                }//: End of ScrollView
                .edgesIgnoringSafeArea(.top)
                
                //: Adding an 'Edit' button to pull up an edit sheet for text changes:
            .navigationBarItems(leading: backButtonView(presentationMode: presentationMode, presentBeer: $beer, ogBeerList: $beerList),trailing: EditButtonVeiw(beer: beer, editBeerDetails: $editBeerDetails))
        
        } // End of Navigation
        .navigationViewStyle(StackNavigationViewStyle())

        
    
            /*.navigationBarItems(trailing:Button(action: {
                editBeerDetails.toggle()
                print("EDIT Button PUSHED")
            }, label: {Text("Edit")})) //: END of navigationBarItems*/
        
            // Adding sheet for editing major beer details:
            /*.sheet(isPresented: $editBeerDetails, content: {
                BeerDetailViewEdit(originalBeerArg: beer, editBeerDetailsArg: $editBeerDetails)
                
            })*/
            
        
    }
}

struct EditButtonVeiw: View {
    var beer: RecordedBeer
    @Binding var editBeerDetails: Bool
    
    var body: some View {
        HStack {
            NavigationLink(
                destination: BeerDetailViewEdit(originalBeerArg: beer, editBeerDetailsArg: $editBeerDetails),
                label: {
                    Text("Edit")
                })
        }
    }
}

struct backButtonView: View {
    @Binding var presentationMode: PresentationMode
    @Binding var presentBeer: RecordedBeer
    @Binding var ogBeerList: [RecordedBeer]
    var body: some View {
        HStack {
           Button(action: { print("cancel")
            $presentationMode.wrappedValue.dismiss()
            //print("BEFORE the update: \(presentBeer)")
            presentBeer = presentBeer.updateBeerTest()
            //print("AFTER the update: \(presentBeer)")
            ogBeerList[0] = presentBeer
            //print("\n \n \n Here is the updated list: \(ogBeerList)")
            
           }) {
            HStack(spacing:1){
                Image(systemName: "chevron.backward")
                Text("Beers")
            }
  
           }
       }
    }
}


struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
    
        //BeerDetailView(beerArg: BeerDataTest[0])
        BeerDetailView(beerArg: BeerDataTest[0], beerList: .constant([RecordedBeer(imageName: "RealBeerImage", beerName: "Founders IPA", beerStyle: "Bourbon Barrel Aged Stout", breweryName: "Founders", beerReleaseYear: 2019, beerDescription: "Hoppy, Light, Great session beer' Perfect Lawn Mower beer to enjoy during a hot summer day.", date: Date(), location: "Test Location", beerRating: 4.2, memorable: false)]))
        
    }
}
