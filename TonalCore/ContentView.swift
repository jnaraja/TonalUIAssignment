//
//  ContentView.swift
//  TonalCore
//
//  Created by Jonathan Naraja on 12/16/21.
//


import SwiftUI

struct ContentView: View {
    @State private var weight = ""
    @State private var label = ""
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .strokeBorder(Color.clear, lineWidth: 0)
                    .background(Circle().fill(Color("background")))
                    .shadow(color: Color("boxshadow"), radius: 27, x: 0, y: 38)
                Image("graph")
                    .offset(x: 0, y: 100)
                TextField("Strength Label", text: $label)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Helvetica-Bold", size: 19))
                    .foregroundColor(Color.white)
                    .offset(x: 0, y: -90)
                Text("lbs")
                    .font(Font.custom("LeagueGothic-Regular", size: 38))
                    .foregroundColor(Color.white)
                    .opacity(0.50)
                    .offset(x: 0, y: 90)
                TextField("0", text: $weight)
                    .font(Font.custom("Helvetica-Bold", size: 127))
                    .padding()
                    .keyboardType(.decimalPad)
                    .onChange(of: weight) {
                                        let txt = $0.filter("0123456789".contains)
                                        if let num = Int(txt), num <= 350, txt.count <= 3 {
                                            weight = txt
                                        } else {
                                            weight = String(txt.dropLast())
                                        }
                                    }
                    .offset(x: 0, y: 0)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
            }
            .padding(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
