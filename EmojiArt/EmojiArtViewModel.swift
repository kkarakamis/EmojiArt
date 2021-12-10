//
//  EmojiArtViewModel.swift
//  EmojiArt
//
//  Created by Kutay Karakamış on 9.12.2021.
//

import SwiftUI

class EmojiArtViewModel: ObservableObject {
    @Published private(set) var emojiArt: EmojiArtModel {
        didSet {
            if emojiArt.background != oldValue.background {
                fetchBackgroundImgaeIfNecessary()
            }
        }
    }
    
    init(){
        emojiArt = EmojiArtModel()
    }
    
    var emojis: [EmojiArtModel.Emoji] {emojiArt.emojis}
    var background: EmojiArtModel.Background {emojiArt.background}
    
    @Published var backgroundImage: UIImage?
    @Published var backgroundImageFetchStatus = BackgroundImageFetchStatus.idle
    
    enum BackgroundImageFetchStatus {
        case idle, fetching
    }
    
    private func fetchBackgroundImgaeIfNecessary() {
        backgroundImage = nil
        switch emojiArt.background {
        case .url(let url):
            backgroundImageFetchStatus = .fetching
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let imageData = try? Data(contentsOf: url)
                self?.backgroundImageFetchStatus = .idle
                if let data = imageData {
                    DispatchQueue.main.async { //[weak self] in
                        if self?.emojiArt.background == EmojiArtModel.Background.url(url) {
                            self?.backgroundImage = UIImage(data: data)
                        }
                    }
                }
            }
        case .imageData(let data):
            backgroundImage = UIImage(data: data)
        case .blank:
            break
        }
    }

    // MARK: -Intent(s)
    
    func setBackground(_ backgroundImage: EmojiArtModel.Background) {
        emojiArt.background = backgroundImage
    }
    
    func addEmoji(_ emoji: String, at location: (x: Int, y: Int), size: CGFloat) {
        emojiArt.addEmoji(emoji, at: location, size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrAwayFromZero))
        }
    }
}
