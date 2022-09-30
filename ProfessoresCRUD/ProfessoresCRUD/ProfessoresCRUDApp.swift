//
//  ProfessoresCRUDApp.swift
//  ProfessoresCRUD
//
//  Created by user222137 on 9/21/22.
//

import SwiftUI

@main
struct ProfessoresCRUDApp: App {
    var body: some Scene {
        WindowGroup {
            
            /**
                    Como a variável viewModel do ContentView possui escopo global na aplicação,
                        por conta da anotação @EnvironmentObject , temos que instanciar a mesma
                            dentro desta função , pois esta é uma das primeiras funções que são executadas
                                    ao iniciar o aplicativo.
             */
            ContentView().environmentObject(ViewModel())
        }
    }
}
