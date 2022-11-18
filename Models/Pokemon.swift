//
//  Pokemon.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

import Foundation
struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}
struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}
