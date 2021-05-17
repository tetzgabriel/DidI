//
//  ContentView.swift
//  Shared
//
//  Created by Gabriel Tetzlaf on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var didI: Bool = UserDefaults.standard.bool(forKey: "Did")
    
    var body: some View {
        if(didI){
            Button(
                action: {
                    self.didI = false
                    UserDefaults.standard.set(self.didI, forKey: "Did")
                },
                   label: {
                Text("I Did 🥳").bold()
            }).buttonStyle(GreenButton())
        } else {
            Button(
                action: {
                    self.didI = true
                    UserDefaults.standard.set(self.didI, forKey: "Did")
                },
                   label: {
                Text("I Didn't 😔").bold()
            }).buttonStyle(RedButton())
        }
    }
    
}

struct RedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(100)
            .background(Color(red: 0.8, green: 0, blue: 0))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(100)
            .background(Color(red: 0, green: 0.5, blue: 0))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
