//
//  BrazeApp.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

@main
struct BrazeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
