//
//  PokemonFactory.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

//import Foundation
//class PokemonFactory {
//    func getPokemon(offset:Int, _ completion:@escaping (PokemonPage) -> PokemonPage) -> [Pokemon]{
//        let data: PokemonPage = Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=\(offset)", model:
//                                                        PokemonPage.self) {
//                                    data in completion(data)
//                                } failure: {
//                                    error in print(error)
//                                }
//        let pokemon: [Pokemon] = data.results
//        return pokemon
//    }
//    func getDetailedPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> ()) {
//        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model:
//                                DetailPokemon.self) {
//            data in completion(data)
//        } failure: {
//            error in print(error)
//        }
//    }
//}
