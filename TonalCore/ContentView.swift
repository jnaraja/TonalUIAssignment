//
//  ContentView.swift
//  TonalCore
//
//  Created by Jonathan Naraja on 12/16/21.
//


import SwiftUI

let fade =  Gradient(colors: [Color.clear, Color(UIColor.systemBackground)])

struct ContentView: View {
    // Variable Declarations
    @State private var weight = ""
    @State private var label = ""
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6).ignoresSafeArea() // Set the background color
            ZStack {
                // Custom made form
                Group {
                    Text("Please Fill in the Blanks")
                        .font(Font.custom("Helvetica-Bold", size: 19))
                        .offset(x: 0, y: 110)
                    TextField(" Strength Assessment Label", text: $label) // Textfield for label
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color(.black), lineWidth: 1)
                        )
                        .font(Font.custom("Helvetica", size: 16))
                        .background(Color.white)
                        .offset(x: 0, y: 150)
                    TextField(" Enter Weight", text: $weight) // Textfield for weight
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color(.black), lineWidth: 1)
                        )
                        .font(Font.custom("Helvetica", size: 16))
                        .background(Color.white)
                        
                        .keyboardType(.decimalPad)
                        .offset(x: 0, y: 176)
                    Button("Submit") { // Submit button to hide keyboard/decimalpad
                        hideKeyboard()
                    }
                    .foregroundColor(Color.white)
                    .padding(7)
                    .disabled(weight.isEmpty || label.isEmpty) // button disabled until label and weight contain input
                    .background(buttonColor) // Button remains gray. Turns blue when label and weight contain input
                    .cornerRadius(7)
                    .offset(x: 0, y: 210)
                    
                    
                }
                
                
                Group {
                    Circle()
                        .strokeBorder(Color.clear, lineWidth: 0)
                        .background(Circle().fill(Color("background"))) // Custom background color
                        .shadow(color: Color("boxshadow"), radius: 27, x: 0, y: 38) // Custon boxshadow color
                    
                    Image("graph") // Graph svg
                        .cornerRadius(100)
                        .mask(LinearGradient(gradient: fade, startPoint: .init(x: 0, y: 1), endPoint: .init(x: 0, y: 0)))
                        .offset(x: 0, y: 100)
                    
                    TextField("Strength Label", text: $label) // Widget label
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Helvetica-Bold", size: 19))
                        .foregroundColor(Color.white)
                        .offset(x: 0, y: -90)
                    
                    Text("lbs") // Weight is in lbs
                        .font(Font.custom("LeagueGothic-Regular", size: 38))
                        .foregroundColor(Color.white)
                        .opacity(0.50)
                        .offset(x: 0, y: 90)
                    
                    TextField("0", text: $weight) // Widget weight
                        .font(Font.custom("Helvetica-Bold", size: 127))
                        .padding()
                        .keyboardType(.decimalPad)
                        .onChange(of: weight) { // Only allows numbers
                            let txt = $0.filter("0123456789".contains)
                            if let num = Int(txt), num <= 350, txt.count <= 3 { // Only allows from range o-350
                                weight = txt
                            } else {
                                weight = String(txt.dropLast())
                            }
                        }
                        .offset(x: 0, y: 0)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                }
                .offset(x: 0, y: -90)
            }
            .padding(50)
        }
    }
    var isEnabled: Bool { // check if weight and label contain an input
        if !weight.isEmpty && !label.isEmpty {
            return true
        }
        else {
            return false
        }
    }

    var buttonColor: Color { // Change color is if button is enabled
        return isEnabled ? .blue : .gray
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View { // Extension to hide keyboard
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
