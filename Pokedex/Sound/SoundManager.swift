//
//  File.swift
//  PokedexSwiftUITutorial
//
//  Created by 北尾　大河 on 2022/11/17.
//

import Foundation
import SwiftUI
import AVKit
class SoundManager {
    static let instance = SoundManager()
    private init() {}
    var player: AVAudioPlayer?
    func play(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: ".mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let err {
            print("ERROR HAPPENED FOR PLAYING SOUND: \(err)")
        }
        
    }
    
}
