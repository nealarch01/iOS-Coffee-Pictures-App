//
//  CoffeeImageView.swift
//  CoffeePictures
//
//  Created by Neal Archival on 6/16/22.
//

import SwiftUI

struct CoffeeImageView: View {
    @Binding var imageURL: String
    var body: some View {
        ZStack {
            if imageURL == "" {
                Text("No coffee image loaded :(\nClick the button below")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(Color.white)
                    .frame(width: 350, height: 350)
                    .background(Color.brown.opacity(0.5))
                    .cornerRadius(12)
            } else {
                AsyncImage(url: URL(string: imageURL)) {
                    (phase) in
                    if let image = phase.image {
                        image
                    } else if phase.error != nil {
                        Text("Could not load image")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(Color.brown)
                            .padding()
                    } else {
                        ProgressView().progressViewStyle(.circular)
                    }
                }
                .frame(width: 350, height: 350)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}

struct CoffeeImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeImageView(imageURL: .constant(""))
    }
}
