//
//  PokemonView.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

import Foundation
import SwiftUI
import Kingfisher
struct CustomColor {
    static let lightPurple = Color("lightPurple")
}
struct PokemonView: View {
    @EnvironmentObject var vm: PokemonListModel
    let pokemon: Pokemon
    let dimensions: Double = 100
    var body: some View {
        VStack{
//            KFImage(URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(pokemon: pokemon)).png"))
            ImageView(pokeid: vm.getPokemonID(pokemon: pokemon))
            .overlay(alignment:.bottom){
                Text("\(pokemon.name.capitalized)")
                    .font(.custom(
                        "AmericanTypewriter", fixedSize: 14).weight(.bold))
                    .foregroundColor(.black)
            }

        }
        .frame(width: 120, height: 120)
        .background(LinearGradient(gradient: Gradient(colors: [CustomColor.lightPurple, .pink, ]), startPoint: .trailing, endPoint: .bottomTrailing))
        .cornerRadius(15)
        .shadow(color:.gray, radius: 6, x: 0.0, y:0.0)
//        .background(Color(vm.backgroundColor(forType: vm.pokemonDetails?.types[0].type.name ?? "")))
    }
}

struct PokemonView_preview: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonListModel())
    }
}
