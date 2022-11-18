//
//  ImageView.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/16.
//

import SwiftUI

struct ImageView: View {
    @StateObject var loader: ImageViewModel
    init(pokeid: Int) {
        _loader = StateObject(wrappedValue: ImageViewModel(pokeid: pokeid))
    }
    var body: some View {
        ZStack {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(pokeid: 1)
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
