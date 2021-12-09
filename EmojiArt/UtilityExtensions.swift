//
//  UtilityExtensions.swift
//  EmojiArt
//
//  Created by Kutay Karakamış on 9.12.2021.
//

import SwiftUI


// lecture 9 : 42.13
extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}


extension RangeReplaceableCollection where Element: Identifiable {
    mutating func remove(_ element: Element) {
        if let index = index(matching: element) {
            remove(at: index)
        }
    }
    
    // ...
    
    
}
