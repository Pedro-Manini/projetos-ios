//
//  Projeto_pokeAPIApp.swift
//  Projeto pokeAPI
//
//  Created by user222137 on 9/26/22.
//

import SwiftUI

@main
struct Projeto_pokeAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())}//.environmentObject(PokeViewModel())
    }
}
