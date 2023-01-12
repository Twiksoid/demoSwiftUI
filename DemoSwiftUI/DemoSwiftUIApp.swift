//
//  DemoSwiftUIApp.swift
//  DemoSwiftUI
//
//  Created by Nikita Byzov on 12.01.2023.
//

import SwiftUI

@main
struct DemoSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
