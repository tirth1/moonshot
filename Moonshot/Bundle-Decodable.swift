//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Tirth on 10/24/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        return decodedData
    }
}
