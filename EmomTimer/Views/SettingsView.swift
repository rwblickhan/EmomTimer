//
//  SettingsView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AboutView(config: .emom)) {
                    Image(systemName: "questionmark.circle")
                    Text("What is EMOM?")
                }
                NavigationLink(destination: AboutView(config: .tabata)) {
                    Image(systemName: "questionmark.circle")
                    Text("What is Tabata?")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
