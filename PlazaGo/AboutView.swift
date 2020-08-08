//
//  AboutView.swift
//  PlazaGoSwiftUI
//
//  Created by Jon Alaniz on 8/8/20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            LinearGradient.lightBackground
            
            VStack() {
                HStack(alignment: .top, spacing: 15) {
                    ZStack {
                        Image("aboutIcon")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .offset(y: 5)
                            .blur(radius: 10)
                        Image("aboutIcon")
                            .resizable()
                            .frame(width: 60, height: 60, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 0) {
                            Text("Plaza")
                                .foregroundColor(.nuGrey)
                                .font(.title)
                                .fontWeight(.semibold)
                                
                            Text("Go")
                                .foregroundColor(.nuGrey)
                                .font(.title)
                                .fontWeight(.light)
                        }
                        
                        Text("Version 2")
                            .foregroundColor(.nuGrey)
                            .font(.title)
                            .fontWeight(.ultraLight)
                        
                        Text("PlazaGo is an unofficial streaming client for Nightwave Plaza")
                            .foregroundColor(.nuGrey)
                            .font(.caption)
                        
                        Text("Nightwave Plaza")
                            .foregroundColor(.nuGrey)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Nightwave Plaza is a free 24/7 onlinevaporwave radio station. The broadcast also includes some future fund and experimental genres. We hope you enjoy.")
                            .foregroundColor(.nuGrey)
                            .font(.caption)
                        Button(action: {
                            //
                        }, label: {
                            Text("Visit Nightwave Plaza")
                        })
                        
                        
                    }
                    .offset(y: 15)
                    .shadow(color: .nuGrey, radius: 20, x: 0, y: 2)
                    .frame(width: 210)
                }
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
