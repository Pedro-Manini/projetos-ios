//
//  EditProfessorView.swift
//  ProfessoresCRUD
//
//  Created by user222137 on 9/23/22.
//

import SwiftUI

struct EditProfessorView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var nome : String = ""
    @State var email : String = ""
    
    // vai receber o objeto a ser alterado
    @State var professor : ProfessorModel
    
    var body: some View {
        VStack {
            
            Form{
                Section{
                    TextField("nome do professor", text: $nome )
                    TextField("email", text: $email )
                    
                    HStack{
                        Spacer()
                        Button("Editar"){
                            
                            viewModel.updateProfessores(id: professor.id, nome: nome, email: email)
                            
                            // para fechar o modal
                            dismiss()
                        } // Button
                    }//HStack
                    .onAppear(perform: {
                        self.nome = professor.nome
                        self.email = professor.email
                    })
                }
            }
        }
    }
}
