//
//  PokemonList.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

//import SwiftUI
//
//struct PokemonList: View {
//    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
//    @ObservedObject var viewModel = PokemonListModel()
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: gridItems,spacing: 16 ){
//                    ForEach(viewModel.pokemon) {
//                        pokemon in PokemonCard(pokemon: pokemon, viewModel: viewModel)
//                    }
//                }
//            }
//            .navigationTitle("Pokedex")
//        }
//    }
//}
//
//struct PokemonList_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonList()
//    }
//}
