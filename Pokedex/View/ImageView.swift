//
//  ImageView.swift
//  PokedexSwiftUI
//
//  Created by 北尾　大河 on 2022/11/16.
//

import SwiftUI

struct ImageView: View {
    
    @StateObject private var loader: ImageViewModel
    
    var pokeid: Int
    
    init(pokeid: Int) {
        self.pokeid = pokeid
        _loader = StateObject(wrappedValue: ImageViewModel(pokeid: pokeid))
    }
    
    var body: some View {
        ZStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }.onChange(of: pokeid, perform: {
            loader.id = $0
        })
    }
}

