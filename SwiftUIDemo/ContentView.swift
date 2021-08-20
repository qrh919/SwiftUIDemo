//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by qrh on 2021/8/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "photo")
            Text("Hello")
                .font(.caption2)
                .fontWeight(.black)
                .padding()
                .foregroundColor(.blue)
        }
        Image("")
            .frame(width: 100, height: 100
                   , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.red)
        Text("Favorite Card Suit")
         .padding()
         .contextMenu {
             Button("♥️ - Hearts", action: selectHearts)
             Button("♣️ - Clubs", action: selectClubs)
             Button("♠️ - Spades", action: selectSpades)
             Button("♦️ - Diamonds", action: selectDiamonds)
         }
    }
    func selectHearts() {
        
    }
    func selectClubs() {
        
    }
    func selectSpades(){
        
    }
    func selectDiamonds(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
        }
    }
}
