//
//  ContentView.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var player: PlazaRadioPlayer = PlazaRadioPlayer()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient.lightBackground
                
                VStack {
                    
                    HStack {
                        Image("icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("Nightwave Plaza")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.nuGrey)
                    }
                    .padding()
                    
                    ZStack {
                        Image(uiImage: player.album!)
                            .resizable()
                            .scaledToFit()
                            .padding(.leading)
                            .padding(.trailing)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .modifier(Blurred())
                        
                        Image(uiImage: player.album!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.leading)
                            .padding(.trailing)
                            .animation(.default)
                    }
                    
                    if player.trackName != "" {
                        Text(player.trackName)
                            .font(.title)
                            .foregroundColor(Color.nuGrey)
                            .multilineTextAlignment(.center)
                            .transition(.slide)
                            .animation(.default)
                    }
                    
                    if player.artistName != "" {
                        Text(player.artistName)
                            .foregroundColor(Color.nuGrey)
                            .multilineTextAlignment(.center)
                            .transition(.slide)
                            .animation(.default)
                    }
                    
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
                            player.updateView()
                        }) {
                            Image(systemName: player.isPlaying ? "pause.fill" : "play.fill")
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
                    
                    HStack {
                        Text("Listeners: \(player.listeners)")
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Image(systemName: "hand.thumbsup")
                            Text(player.likes)
                            Image(systemName: "hand.thumbsdown")
                            Text(player.haters)
                        }
                    }
                    .foregroundColor(.blue)
                    .shadow(color: .blue, radius: 20, x: 0, y: 10)
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
            .preferredColorScheme(.dark)
    }
}
