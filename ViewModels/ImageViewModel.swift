//
//  ImageViewModel.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/16.
//

import Foundation
import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    var cancellables = Set<AnyCancellable>()
//    let manager = PhotoCache.instance
    let manager = FilePhotoManager.instance
    let id:Int
    init(pokeid: Int) {
        self.id = pokeid
        getImage(id:pokeid)
    }
    func getImage(id: Int) {
        if let savedImage = manager.get(key: String(id)) {
            image = savedImage
            print("Successfully got the saved image")
        } else {
            downloadImage(id: self.id)
            print("Saved Image doesn't exist. Downloading image now.")
        }
    }
    func downloadImage(id: Int) {
        isLoading = true
        guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png") else {
            isLoading = false
            return
        }
        getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                // always update the UI from the main thread
                DispatchQueue.main.async() { [weak self] in
                    self?.image = UIImage(data: data)
                    if (self?.image != nil) {
                        self?.manager.add(key: String(id), value: (self?.image)!)
                    }
                    self?.isLoading = false
                }
            }
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

