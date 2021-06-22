//
//  BeerDetailViewEdit.swift
//  RecordedBeerVIewTest
//
//  Created by Andrew Gonzalez on 4/29/21.
//

import SwiftUI


struct BeerDetailViewEdit: View {
    @Environment(\.presentationMode) var presentationMode
    //@StateObject var editBeerViewModel = EditBeerViewModel()
    
    var originalBeer: RecordedBeer
    var updatedBeer: RecordedBeer
    // List of binding variables for editing:
    @State var updatedBeerName: String
    @State var updatedRating: CGFloat
    @State var updatedBrewery: String
    @State var updatedStyle: String
    @State var updatedBeerDescription: String
    @State var updatedReleaseYear: Int
    @State var updatedLocation: String
    @State var updatedDate: Date
    @State var isFire: Bool
    
    // Used for Rating:
    @State private var showRatingSlider: Bool = true
    @State private var ratingSliderValue: CGFloat = 0
    
    
    // Used For Release Year Picker:
    @State private var pickerVisible = false
    @State private var releaseYearSelected: Int = 100
    @State private var originalYearSelected: Int = 100
    
    
    @State var beerDescriptionTextHeight: CGFloat = 0
    var beerDescriptionTextFieldHeight: CGFloat = 100
    
    @State var beerStyleTextHeight: CGFloat = 0
    
    
    @State var placeHolderDict: [String:String] = [
        "beerNamePlaceHolder" : "Add Beer Name...",
        "ratingPlaceHolder" : "Add Beer Rating...",
        "breweryPlaceHolder" : "Add Brewery...",
        "stylePlaceHolder" : "Add Style...",
        "beerDescriptionPlaceHolder" : "Add Description...",
        "releaseYearPlaceHolder" : "Add Release Year...",
        "locationPlaceHolder" : "Add Location...",
        "datePlaceHolder" : "Add Date...",
    ]
    
    
    
    
    
    @Binding var editBeerDetails: Bool
    
    init(originalBeerArg: RecordedBeer, editBeerDetailsArg: Binding<Bool>){
        originalBeer = originalBeerArg
        updatedBeer = originalBeerArg
        _editBeerDetails = editBeerDetailsArg
        // initializing the values to be edited:
        _updatedBeerName = State(initialValue: originalBeerArg.name)
        _updatedRating = State(initialValue: originalBeerArg.rating)
        _updatedBrewery = State(initialValue: originalBeerArg.brewery)
        _updatedStyle = State(initialValue: originalBeerArg.style)
        _updatedBeerDescription = State(initialValue: originalBeerArg.description)
        _updatedReleaseYear = State(initialValue: originalBeerArg.releaseYear)
        _updatedLocation = State(initialValue: originalBeerArg.location)
        _updatedDate = State(initialValue: originalBeerArg.date)
        _isFire = State(initialValue: originalBeerArg.memorable)
        _ratingSliderValue = State(initialValue: originalBeerArg.rating)
        
        
        // For Beer Year selection
        if((originalBeerArg.releaseYear) != 0 && (originalBeerArg.releaseYear > 1900)){
            // This will initially set the selection of release year properly so that the selection starts at the correct year and not at 1900
            _releaseYearSelected = State(initialValue: originalBeerArg.releaseYear - 1900)
            _originalYearSelected =  State(initialValue: originalBeerArg.releaseYear - 1900)
        }
        
    }
    
    var body: some View {
        
        ScrollView (.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // Header:
                Spacer()
                // THIS IS TEMPORARY
                // THIS HAS TO CHANGE TO MAKE IT AN IMAGE PICKER:
                BeerHeaderView(beer: updatedBeer)
                    .padding(.top, 30)
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Beer Title:
                    VStack(alignment:.leading, spacing: 1.0) {
                        HStack {
                            Text("Beer Name:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                        } // End of HStack
                        
                        TextField("\(placeHolderDict["beerNamePlaceHolder"] ?? "Add a Value...")", text: $updatedBeerName )
                            .font(.system(size: 30, weight: .heavy, design: .default))
                        
                    } // End of Beer Name VStack
                    
                    
                    // Beer Rating and Memorable Toggle:
                    HStack (spacing: 53) {
                        // Beer rating
                        VStack(alignment:.leading, spacing: 1.0) {
                            Text("Beer Rating:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            // if the raitng is less than 1 we'll display an N/A value
                            if(updatedRating < 1){
                                Button(action: {showRatingSlider.toggle()}){
                                    Text("N/A")
                                        .font(.system(size: 30, weight: .heavy, design: .default))
                                        .foregroundColor(.black)
                                }
                            }
                            // Otherwise we'll display the actual value:
                            else {
                                
                                Button(action: {showRatingSlider.toggle()}){
                                    Text("\(updatedRating, specifier: "%.2f")")
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
                                        .shadow(color: .red, radius: 5, x: 0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0)
                                    
                                }
                                else {
                                    Image(systemName: "flame")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35, height: 30, alignment: .center)
                                        .foregroundColor(.gray)
                                }
                            })
                            
                            
                        }
                        
                        //Beer Style
                        VStack(alignment:.leading, spacing: 1.0) {
                            Text("Beer Style:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            /*TextField("\(placeHolderDict["stylePlaceHolder"] ?? "Add a Value...")", text: $updatedStyle )
                             .lineLimit(2)
                             .font(.system(size: 20, weight: .bold, design: .default))*/
                            if updatedStyle.isEmpty {
                                Text("\(placeHolderDict["stylePlaceHolder"] ?? "Add a Value...")")
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 10))
                            }
                            
                            DynamicHeightTextField(text: $updatedStyle, height: $beerStyleTextHeight)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .frame(width: 100, height: 75)
                            
                        }
                        // End of VStack
                    } // End of Beer Rating/Memorable/Style HStack
                    
                    // Beer Rating Slider:
                    if (showRatingSlider){
                        // HStack to hold buttons and slider:
                        HStack(spacing: 15) {
                            Text("N/A")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                            
                            Slider(value: $updatedRating, in: 0.95...10, step: 0.05)
                                .accentColor(.orange)
                            
                            Text("10")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                            // Button to reset rating value:
                            Button(action: {
                                // Resetting value:
                                updatedRating = originalBeer.rating
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
                        HStack {
                            Text("Brewery:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                        } // End of HStack
                        
                        TextField("\(placeHolderDict["breweryPlaceHolder"] ?? "Add a Value...")", text: $updatedBrewery )
                            .font(.system(size: 17, weight: .semibold, design: .default))
                        
                    }
                    
                    // Beer Description with Dynamic TextField:
                    
                    VStack(alignment:.leading, spacing: 1.0) {
                        Text("Personal Beer Description:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        // Beer Description:
                        if updatedBeerDescription.isEmpty {
                            Text("\(placeHolderDict["beerDescriptionPlaceHolder"] ?? "")")
                                .foregroundColor(.secondary)
                                .font(.system(size: 10))
                        }
                        ZStack {
                            Color(UIColor.secondarySystemBackground)
                            DynamicHeightTextField(text: $updatedBeerDescription, height: $beerDescriptionTextHeight)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .padding(.init(top: -7, leading: 0, bottom: 0, trailing: -17))
                                .frame(width: 390, height: 70)
                            
                        } //: End of ZStack
                        
                        
                    } //: End of Beer Description Container
                    
                    
                    // Beer Release
                    VStack(alignment: .leading, spacing: 1.0){
                        Text("Release Year:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        HStack {
                            // If the beer has a current release year value display the release year as a button
                            if (updatedReleaseYear != 0){
                                Button(action: {
                                    self.pickerVisible.toggle()
                                }){
                                    Text(String (updatedReleaseYear))
                                }
                                .foregroundColor(self.pickerVisible ? .red : .blue)
                            }
                            else { // Other wise display a text value:
                                Button(action: {
                                    self.pickerVisible.toggle()
                                }){
                                    Text("Select Year")
                                }
                                .foregroundColor(self.pickerVisible ? .red : .blue)
                            }
                            
                            
                            Button(action: {
                                // Resetting value:
                                updatedReleaseYear = originalBeer.releaseYear
                                releaseYearSelected = originalYearSelected
                            }){
                                Image(systemName: "arrow.uturn.backward.circle")
                            }
                            
                        } //: END of HStack for Release Year Buttons
                        
                        if pickerVisible {
                            HStack {
                                Spacer()
                                Picker(selection: $releaseYearSelected, label: Text("Release Year")) {
                                    ForEach(1900 ..< 2100) { number in
                                        Text(String(number))
                                    }
                                }.pickerStyle(WheelPickerStyle())
                                
                                
                            }
                            .onTapGesture {
                                self.pickerVisible.toggle()
                                setBeerReleaseYear(intYear: releaseYearSelected)
                            }
                            
                        }
                        
                        //Text("Selected: " + String(updatedReleaseYear))
                        
                    } //: End of Release Year VStack
                    
                    
                    // Recorded Location
                    VStack(alignment: .leading, spacing: 1.0){
                        Text("Recorded Location:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    
                } // End of VStack
                .padding(.horizontal, 20)
                .frame(maxWidth: 640, alignment: .leading)
            }
            //: End of VStack
            .navigationBarTitle(originalBeer.name, displayMode: .inline)
            //.navigationBarItems(leading: cancelButtonView(), trailing: saveButtonView())
            //.navigationBarHidden(true)
            .navigationBarItems(leading: cancelButtonView(presentationMode: presentationMode, updatedBeer: updatedBeer))
            .navigationBarBackButtonHidden(true)

        }//: End of ScrollView
        .edgesIgnoringSafeArea(.top)
        
        
    }
    
    // Function used to calculate the correct value for release Year
    func setBeerReleaseYear(intYear: Int) {
        var calculatedYear = intYear + 1900
        if (calculatedYear > 2100) {
            calculatedYear = originalBeer.releaseYear
        }
        updatedReleaseYear = calculatedYear
    }
}


struct cancelButtonView: View {
    @Binding var presentationMode: PresentationMode
    var updatedBeer: RecordedBeer
    
    var body: some View {
        HStack {
           Button(action: { print("cancel")
               $presentationMode.wrappedValue.dismiss()            
            
           }) {
            
            Text("Cancel")
  
           }
       }
    }
}

struct saveButtonView: View {
    
    var body: some View {
        Button(action: {
                print ("Save") }, label: {
            Text("Save")
        })
    }
    
}




struct BeerDetailViewEdit_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailViewEdit(originalBeerArg: BeerDataTest[0], editBeerDetailsArg: .constant(true))
    }
}

// Below is Code used for Dynamic text field
struct DynamicHeightTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.isScrollEnabled = true
        textView.alwaysBounceVertical = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        
        textView.text = text
        textView.backgroundColor = UIColor.clear
        
        textView.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator

        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicSizeTextField: self)
    }
}

class Coordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    
    var dynamicHeightTextField: DynamicHeightTextField
    
    weak var textView: UITextView?

    
    init(dynamicSizeTextField: DynamicHeightTextField) {
        self.dynamicHeightTextField = dynamicSizeTextField
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.dynamicHeightTextField.text = textView.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func layoutManager(_ layoutManager: NSLayoutManager, didCompleteLayoutFor textContainer: NSTextContainer?, atEnd layoutFinishedFlag: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let textView = self?.textView else {
                return
            }
            let size = textView.sizeThatFits(textView.bounds.size)
            if self?.dynamicHeightTextField.height != size.height {
                self?.dynamicHeightTextField.height = size.height
            }
        }

    }
}
