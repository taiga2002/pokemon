//
//  PokemonCard.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

import SwiftUI
import Kingfisher

struct PokemonCard: View {
    let pokemon: Pokemon
    let viewModel: PokemonListModel
    init(pokemon: Pokemon, viewModel: PokemonListModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                HStack {
                    Text("poison")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height:24)
                    
                    KFImage(URL(string: pokemon.url))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                }
            }
        }
        .background(.green)
        .cornerRadius(12)
        .shadow(color:.green, radius: 6, x: 0.0, y:0.0)
    }
}
