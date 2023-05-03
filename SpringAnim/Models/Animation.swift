//
//  Animation.swift
//  SpringAnim
//
//  Created by Константин Натаров on 03.05.2023.
//

import Foundation

struct Animation {
    let name: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    static func getRandomAnimation() -> Animation {
        let dataStore = DataStore.shared
        return Animation(
            name: dataStore.animations.randomElement() ?? "",
            curve: dataStore.curves.randomElement() ?? "",
            force: CGFloat.random(in: 1...3),
            duration: CGFloat.random(in: 1...3),
            delay: 0)
    }
}
