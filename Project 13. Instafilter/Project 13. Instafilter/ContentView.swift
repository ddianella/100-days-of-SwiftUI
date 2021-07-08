//
//  ContentView.swift
//  Project 13. Instafilter
//
//  Created by Prince$$ Di on 18.06.2021.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 10.0
    
    @State private var showingImagePicker = false
    @State private var showingFilterSheet = false
    
    @State private var showingNoImageAlert = false
    
    // властивість, яка буде зберігати зображення, вибране користувачем
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var filterTitle = "Choose Filter"
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        let radius = Binding<Double> (
            get: {
                self.filterRadius
            },
            set: {
                self.filterRadius = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    //display the image
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    // select an image
                    self.showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }
                
                HStack {
                    Text("Radius")
                    Slider(value: radius, in: 10.0...50.0)
                }
                .padding(.vertical)
                
                HStack {
                    //Button("Change Filter") {
                    Button(filterTitle) {
                        // change filter
                        self.showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        // save the picture
                        guard let processedImage = self.processedImage else { return }
                        
                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        
                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            
            .alert(isPresented: $showingNoImageAlert) {
                Alert(title: Text("No Image to Save"), dismissButton: .default(Text("OK")))
            }
            
            .actionSheet(isPresented: $showingFilterSheet) {
                // action sheet here
                ActionSheet(title: Text("Select a filter"), buttons: [
                    //                    .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()) },
                    //                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()) },
                    .default(Text("Crystalize")) {
                        self.setFilter(CIFilter.crystallize())
                        filterTitle = "Crystalize"
                    },
                    .default(Text("Gausian Blur")) {
                        self.setFilter(CIFilter.gaussianBlur())
                        filterTitle = "Gausian Blur"
                    },
                    .default(Text("Unsharp Mask")) {
                        self.setFilter(CIFilter.unsharpMask())
                        filterTitle = "Unsharp Mask"
                    },
                    .default(Text("Sepia Tone")) {
                        self.setFilter(CIFilter.sepiaTone())
                        filterTitle = "Sepia Tone"
                    },
                    .default(Text("Vignette")) {
                        self.setFilter(CIFilter.vignette())
                        filterTitle = "Vignette"
                    },
                    .cancel()
                ])
            }
        }
    }
    // Метод, який буде викликаний, коли подання ImagePicker буде відхилено.
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    // change that filter to something else
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    func applyProcessing() {
        // currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            
            processedImage = uiImage
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
