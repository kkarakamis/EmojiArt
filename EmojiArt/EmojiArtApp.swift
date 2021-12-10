//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Kutay Karakamış on 9.12.2021.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtViewModel()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtView(document: document)
        }
    }
}
