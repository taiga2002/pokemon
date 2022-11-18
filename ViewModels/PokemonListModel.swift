//
//  PokemonListModel.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/14.
//

import SwiftUI
import Combine

class PokemonListModel: ObservableObject {
    @Published var pokemonList = [Pokemon]()
    @Published var searchText = ""
    var cancellable = Set<AnyCancellable>()
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter{
            $0.name.contains(searchText.lowercased())
        }
    }
    init() {
//        getPokemon(offset: 0)
        getPokemonWithCombine(offset: 0)
    }
    func getPokemonID(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    func addMorePokemon(offset: Int) {
//        getPokemon(offset: offset)
        getPokemonWithCombine(offset: offset)
    }
    
    func getPokemon(offset:Int){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=\(offset)") else {
            print("Your API end point is invalid")
            return
        }
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
                let page = try! JSONDecoder().decode(PokemonPage.self, from: data!)
                DispatchQueue.main.async {
                    self.pokemonList.append(contentsOf: page.results)
                }
            }.resume()
        }
    
    //Combine Explanation:
    /*
    //1. Sign up for monthly subscription for package to be deliver
    //2. the company would make the packag behind the scene
    //3. recieve the package at your front door
    //4. Make sure the box isn't damaged
    //5. Open and make sure the item is correct
    //6. Use the item
    //7. Cancellable at any time!!
    
    //1. Create the publisher
    //2. Subscribe publisher on background thread
    //3. Recieve on main thread
    //4. TryMap to check if the data is valid or not
    //5. Decode (decode data into PokemonPage Model)
    //6. Place the item in our app (Sink)
    //7. Store (cancel cusbscription if necessary)
     */
    func getPokemonWithCombine(offset: Int) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20&offset=\(offset)") else {
            print("Your API end point is invalid")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(tryMapOutputHandler)
            .decode(type: PokemonPage.self, decoder: JSONDecoder())
        //Or we could replace sink with
        // .repalceError(with: [])
            .sink{(completion) in
                switch completion {
                case .finished:
                    print("COMPLETION FINISHED")
                case .failure(let err):
                    print("ERROR HAPPENED: \(err)")
                }
            } receiveValue: { [weak self] (value) in
                self?.pokemonList.append(contentsOf: value.results)
            }.store(in: &cancellable)
        
    }
    func tryMapOutputHandler(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

