//
//  ContentView.swift
//  CoffeePictures
//
//  Created by Neal Archival on 6/16/22.
//

import SwiftUI

struct ContentView: View {
    @State var imageURL: String = ""
    var body: some View {
        VStack {
            CoffeeImageView(imageURL: self.$imageURL)
            Button(action: displayImage) {
                Text("Click for coffee pictures")
                    .font(.system(size: 26, weight: .medium))
                    .foregroundColor(Color.white)
                    .frame(width: 310, height: 50)
                    .background(Color.brown)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                    .padding([.bottom], 30)
            }
        }
    }
    
    func displayImage() -> Void {
//        self.activated = !self.activated
        Task {
            do {
                let img = try await fetchImage()
                imageURL = img
            } catch let error {
                print("There was an error obtaining image.\n", error.localizedDescription)
                return
            }
        }
        return
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
