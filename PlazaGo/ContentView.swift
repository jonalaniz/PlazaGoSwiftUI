//
//  ContentView.swift
//  PlazaGo
//
//  Created by Jon Alaniz on 8/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let player: FRadioPlayer = FRadioPlayer.shared
        
        var album = Image("album")
        
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
                    
                    Text("Please Don't Call")
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
                            print("Play Button Pressed")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
