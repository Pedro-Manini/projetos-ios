//
//  SecondView.swift
//  ProjetoAlvo
//
//  Created by user222137 on 9/12/22.
//

import SwiftUI

struct SecondView: View {
    
    @Binding var showSecondScreen: Bool
    
    var text: String
    
    var body: some View {
        Text(text)
        
        Button("Voltar") {
            showSecondScreen = false
        }
    }
}


