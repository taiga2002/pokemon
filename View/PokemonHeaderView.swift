//
//  PokemonHeaderView.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/15.
//

import Foundation
import SwiftUI

struct PokemonHeaderView: View {
    @EnvironmentObject var vm: PokemonListModel
    let pokemon: Pokemon
    let dimensions: Double = 200
    var body: some View {
        VStack(spacing:-10){
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(pokemon: pokemon)).png")) {
                image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
            }
//            ImageView(pokeid: vm.getPokemonID(pokemon: pokemon))
            Text("\(pokemon.name.capitalized)")
                .font(.custom(
                    "AmericanTypewriter", fixedSize: 25).weight(.bold))
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .cornerRadius(10)
                
        }
        .frame(maxWidth: .infinity, maxHeight: 350)
    }
}

struct PokemonHeader_preview: PreviewProvider {
    static var previews: some View {
        PokemonHeaderView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonListModel())
    }
}
