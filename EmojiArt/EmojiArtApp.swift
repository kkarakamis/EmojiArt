//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Kutay Karakamış on 9.12.2021.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    @StateObject var document = EmojiArtDocumentViewModel()
    @StateObject var paletteStore = PaletteViewModel(named: "Default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
                .environmentObject(paletteStore)
        }
    }
}
