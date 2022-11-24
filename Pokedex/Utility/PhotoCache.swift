//
//  PhotoCache.swift
//  PokedexSwiftUI
//
//  Created by 北尾　大河 on 2022/11/16.
//

import Foundation
import SwiftUI

class PhotoCache {
    static let instance = PhotoCache()
    private init() {}
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    func get(key: String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
    
}
