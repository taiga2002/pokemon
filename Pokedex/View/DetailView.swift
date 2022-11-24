//
//  DetailView.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

import SwiftUI
struct DetailView: View {
    
    @EnvironmentObject var vm: PokemonListModel
    let pokemon: Pokemon
    var body: some View {
        VStack (spacing: 0) {
            GeometryReader { metrics in
                VStack(spacing: 0) {
                    
                    PokemonHeaderView(pokemon: pokemon)
                        .background(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: metrics.size.height * 0.20)
                        .padding(.top, 50)
                }
            }
        }
//        .onAppear{
//            vm.getDetails(pokemon: pokemon)
//        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: Pokemon.samplePokemon).environmentObject(PokemonListModel())
    }
}
