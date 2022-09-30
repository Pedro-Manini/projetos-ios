//
//  ProjetoAlvoApp.swift
//  ProjetoAlvo
//
//  Created by user222137 on 9/8/22.
//

import SwiftUI

@main
struct ProjetoAlvoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
