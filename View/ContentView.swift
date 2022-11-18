//
//  ContentView.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonListModel()
    @State var selectedPokemon: Pokemon = Pokemon(name: "Pick Your Favorite!", url: "https://pokeapi.co/api/v2/pokemon/1/")
    @State var tap = false
    @State var offset = 0
    @Environment(\.isSearching) private var isSearching
    @State var isAnimated: Bool = false
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            GeometryReader{geometry in
                    VStack(spacing: 10) {
//                        Spacer().frame(height: geometry.size.height * 0.1)
                            PokemonHeaderView(pokemon: selectedPokemon)
                                .background(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: geometry.size.width, height: geometry.size.height * 0.25)
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                        
                        ScrollView{
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(vm.filteredPokemon) {pokemon in
                                    PokemonView(pokemon: pokemon)
                                        .opacity(isAnimated ? 0.3 : 1)
                                        .onTapGesture {
                                            selectedPokemon = pokemon
//                                            SoundManager.instance.play(soundName: "pokemon_buzz")
                                            SoundManager.instance.play(soundName: "pokemon-button")
//                                            SoundManager.instance.play(soundName: "pokemonCenter")
//                                            HapticManager.instance.createHaptic(style: .soft)
                                            HapticManager.instance.createHaptic(style: .heavy)
                                            withAnimation(Animation.linear(duration: 2)) {
                                                isAnimated.toggle()
                                            }
                                            isAnimated.toggle()
                                        }
                                }
                                Color.white
                                    .frame(height: 50)
                                    .onAppear{
                                        offset += 20
                                        vm.addMorePokemon(offset: offset)
                                    }
                            }
                            .animation(.easeInOut(duration: 0.4), value: vm.filteredPokemon.count)
                            .navigationTitle("PokemounUI")
                            .navigationBarTitleDisplayMode(.inline)
                        }
                        .searchable(text: $vm.searchText)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.65)
                        }
                }
                    
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
