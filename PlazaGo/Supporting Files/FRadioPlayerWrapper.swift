//
//  FRadioPlayerWrapper.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

open class PlazaRadioPlayer: FRadioPlayer, ObservableObject {
    // Published Properties
    @Published var trackName = ""
    @Published var artistName = ""
    @Published var album = UIImage(named: "album")
    @Published var isPlayerPlaying = false
    @Published var listeners = ""
    @Published var likes = ""
    @Published var haters = ""
    
    override init() {
        super.init()
    }
    
    override func timedMetadataDidChange(rawValue: String?) {
//        super.timedMetadataDidChange(rawValue: rawValue)
        getSongInfo()
    }
    
    open override func togglePlaying() {
        super.togglePlaying()
    }
    
    func updateView() {
        self.objectWillChange.send()
    }
    
    func getSongInfo() {
        let url = URL(string: "https://api.plaza.one/status")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonData = try JSONDecoder().decode(Stream.self, from: data)
                DispatchQueue.main.async {
                    self.getArtworkURL(with: jsonData)
                    
                    // Get song metadata from PlazaAPI
                    self.trackName = jsonData.playback?.title ?? "Unknown"
                    self.artistName = jsonData.playback?.artist ?? "Unknown"
                    self.listeners = String(jsonData.listeners ?? 0)
                    self.likes = String(jsonData.playback?.likes ?? 0)
                    self.haters = String(jsonData.playback?.hates ?? 0)
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
