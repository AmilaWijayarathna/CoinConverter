//
//  LOTRConverterApp.swift
//  LOTRConverter
//
//  Created by Amila Wijayarathna on 2024-11-07.
//

import SwiftUI

@main
struct LOTRConverterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
