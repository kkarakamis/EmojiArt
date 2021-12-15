//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Kutay Karakamış on 9.12.2021.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    @StateObject var paletteStore = PaletteViewModel(named: "Default")
    
    var body: some Scene {
        DocumentGroup(newDocument: { EmojiArtDocumentViewModel()}) { config in
            EmojiArtDocumentView(document: config.document)
                .environmentObject(paletteStore)
        }
    }
}
