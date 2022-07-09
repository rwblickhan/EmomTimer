//
//  CoreTabView.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import SwiftUI

struct CoreTabView: View {
    var body: some View {
        TabView {
            WorkoutsView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text(String(localized: "Workouts"))
                }
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text(String(localized: "Timer"))
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text(String(localized: "Settings"))
                }
        }
    }
}

struct CoreTabView_Previews: PreviewProvider {
    static var previews: some View {
        CoreTabView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
