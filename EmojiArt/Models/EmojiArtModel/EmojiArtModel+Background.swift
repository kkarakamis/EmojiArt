//
//  Background.swift
//  EmojiArt
//
//  Created by Kutay Karakamış on 9.12.2021.
//

import Foundation

extension EmojiArtModel {
    enum Background {
        case blank
        case url(URL)
        case imageData(Data)
    
        var url: URL? {
            switch self {
            case .url(let uRL): return uRL
            default: return nil
            }
        }
        
        var imageData: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
    }
}
