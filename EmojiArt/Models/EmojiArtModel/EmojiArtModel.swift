//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Kutay Karakamış on 9.12.2021.
//

import Foundation
import SwiftUI

struct EmojiArtModel: Codable {
    var background = Background.blank
    var emojis = [Emoji]()

    struct Emoji: Identifiable, Hashable, Codable {
        let text: String
        var x: Int // offset from the center
        var y: Int // offset from the center
        var size: Int
        let id: Int
        
        fileprivate init(text: String,x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    func getJson() throws -> Data {
        try JSONEncoder().encode(self)
    }
    
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int){
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: uniqueEmojiId))
        uniqueEmojiId += 1
    }
    

}
