//
//  DestinationsListViewModel.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 20/02/22.
//

import Foundation

class DestinationsListViewModel {
    
    var destinations: [DestinationModel]? = nil
    
    func getDestinations() {
        destinations = load("DestinationsData")
    }
    
    func getTotalDestinations() -> Int {
        let total = destinations?.count
        return total ?? 0
    }
}

extension DestinationsListViewModel {
    func load<T: Decodable>(_ filename: String, withExtension: String = ".json") -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: withExtension) else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
