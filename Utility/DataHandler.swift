//
//  DataHandler.swift
//  PokedexSwiftUI
//
//  Created by 北尾　大河 on 2022/11/14.
//

import Foundation
extension Bundle {
    //Not for the actual app usage, but when I initially tested with json file, I used this function to decode json file.
    func decode<T:Decodable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        return loadedData
    }
}
