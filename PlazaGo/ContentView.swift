//
//  ContentView.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var player: FRadioPlayer = FRadioPlayer.shared
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient.background
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Image("icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("Nightwave Plaza")
                            .foregroundColor(.gray)
                    }
                    
                    ZStack {
                        Image("album")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .modifier(Blurred())
                        
                        Image("album")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                        
                    }
                    
                    Text(player.trackName)
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Text("~ SMOOCH ~")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    HStack(spacing: 25) {
                        Button(action: {
                            print("Play Button Pressed")
                        }) {
                            Text("HQ")
                                .foregroundColor(.white)
                                .font(.caption2)
                        }
                        .buttonStyle(SmallSimpleButtonStyle())
                        
                        Button(action: {
                            player.togglePlaying()
                        }) {
                            Image(systemName: "pause.fill")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(SimpleButtonStyle())
                        
                        Button(action: {
                            print("Info button pressed")
                        }) {
                            Image(systemName: "info")
                                .foregroundColor(.white)
                                .frame(width: 14, height: 14)
                        }
                        .buttonStyle(SmallSimpleButtonStyle())
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                player.radioURL = URL(string: "http://radio.plaza.one/mp3")
                player.play()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
