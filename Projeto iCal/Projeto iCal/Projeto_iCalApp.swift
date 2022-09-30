//
//  Projeto_iCalApp.swift
//  Projeto iCal
//
//  Created by user222137 on 9/15/22.
//

import SwiftUI

@main
struct ProjetoiCal: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
