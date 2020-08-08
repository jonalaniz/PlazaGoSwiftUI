//
//  FRadioPlayerWrapper.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

open class SwiftUIRadioPlayer: FRadioPlayer, ObservableObject {
    // Published Properties
    @Published var trackName = ""
    @Published var artistName = ""
    @Published var album = UIImage(named: "album")
    
    override init() {
        super.init()
    }
    
    override func timedMetadataDidChange(rawValue: String?) {
        super.timedMetadataDidChange(rawValue: rawValue)
        
        let parts = rawValue?.components(separatedBy: " - ")
        if let unWrappedArtistName = parts?.first {
            artistName = unWrappedArtistName
        } else {
            artistName = ""
        }
        
        if let unWrappedTitle = parts?.last {
            trackName = unWrappedTitle
        } else {
            trackName = ""
        }
        getSongInfo()
    }
    
    func getSongInfo() {
        let url = URL(string: "https://api.plaza.one/status")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let jsonData = try JSONDecoder().decode(Stream.self, from: data)
                DispatchQueue.main.async {
                    self.getArtworkURL(with: jsonData)
                }
                
            } catch let jsonError {
                print("Error serializing json:", jsonError)
            }
            
            }.resume()
    }
    
    func getArtworkURL(with stream: Stream) {
        var components = URLComponents()
        let artworkURL = stream.playback?.artwork
        components.scheme = "https"
        components.host = "api.plaza.one"
        components.path = "/\(artworkURL ?? "/ass")"
        
        guard let url = components.url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            self.downloadImage(with: url)
            
        }.resume()
    }
    
    func downloadImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                DispatchQueue.main.async {
                    self.album = UIImage(named: "Album")
                }
                return
            }
            
            DispatchQueue.main.async {
                let cacheImage = UIImage(data: data!)
                if cacheImage == self.album {
                    return
                } else {
                    self.album = cacheImage
                }
                
            }
            
        }.resume()
    }
}
