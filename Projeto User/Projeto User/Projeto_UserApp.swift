//
//  Projeto_UserApp.swift
//  Projeto User
//
//  Created by Pedro Manini on 9/19/22.
//

import SwiftUI

@main
struct Projeto_UserApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext).environmentObject(dataController)
        }
    }
}
