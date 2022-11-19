//
//  HapticManager.swift
//  PokedexSwiftUI
//
//  Created by 北尾　大河 on 2022/11/17.
//

import Foundation
import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    func createHaptic(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
