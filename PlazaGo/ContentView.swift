//
//  ContentView.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var player: SwiftUIRadioPlayer = SwiftUIRadioPlayer()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if colorScheme == .dark {
                    LinearGradient.darkBackground
                } else {
                    LinearGradient.lightBackground
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Image("icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text("Nightwave Plaza")
                            .fontWeight(.semibold)
                            .foregroundColor(colorScheme == .dark ? Color.nuLightGrey : Color.nuGrey)
                    }
                    
                    ZStack {
                        Image(uiImage: player.album!)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .modifier(Blurred())
                        
                        Image(uiImage: player.album!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                            .animation(.default)
                    }
                    
                    if player.trackName != "" {
                        Text(player.trackName)
                            .font(.title)
                            .foregroundColor(colorScheme == .dark ? Color.nuLightGrey : Color.nuGrey)
                            .multilineTextAlignment(.center)
                            .transition(.slide)
                            .animation(.default)
                    }
                    
                    if player.artistName != "" {
                        Text(player.artistName)
                            .foregroundColor(colorScheme == .dark ? Color.nuLightGrey : Color.nuGrey)
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
            .preferredColorScheme(.dark)
    }
}
