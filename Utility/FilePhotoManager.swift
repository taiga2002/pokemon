//
//  FilePhotoManager.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/16.
//

import Foundation
import SwiftUI

class FilePhotoManager {
    static let instance = FilePhotoManager()
    let folderName = "cached_photos"
    private init() {
        createFolder()
    }
    private func createFolder() {
        guard let url = getPathFolder() else {return}
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            print("Created Folder")
        } catch let error{
            print("Failed to create a folder. Error: \(error)")
        }
        }
        
    }
    // .../cached_photos
    // .../cached_photos/image_name.png
    private func getPathFolder() -> URL?{
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    private func getImagePath(key: String) -> URL? {
        guard let folder = getPathFolder() else {
            return nil
        }
        return folder.appendingPathComponent(key + ".png")
    }
    func add(key: String, value: UIImage) {
        guard
            let data = value.pngData(),
            let url = getImagePath(key: key) else {return}
        do {
            try data.write(to: url)
        } catch let error {
            print("Failed to save to file manager. \(error)")
        }
    }
    func get(key: String) -> UIImage? {
        guard let url = getImagePath(key: key),
              FileManager.default.fileExists(atPath: url.path) else {return nil}
        return UIImage(contentsOfFile: url.path)
    }
}
