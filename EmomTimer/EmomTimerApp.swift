//
//  EmomTimerApp.swift
//  EmomTimer
//
//  Created by Russell Blickhan on 6/17/22.
//

import SwiftUI

@main
struct EmomTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CoreTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
