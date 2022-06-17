//
//  FetchImage.swift
//  CoffeePictures
//
//  Created by Neal Archival on 6/16/22.
//

import Foundation

struct CoffeeAPIResponse: Decodable {
    let file: String
}

func fetchImage() async throws -> String {
    let apiEndpoint: URL = URL(string: "https://coffee.alexflipnote.dev/random.json")!
    // Asynchronous request
    let (data, _) = try await URLSession.shared.data(from: apiEndpoint)
    let decodedData = try JSONDecoder().decode(CoffeeAPIResponse.self, from: data)
    return decodedData.file
}

