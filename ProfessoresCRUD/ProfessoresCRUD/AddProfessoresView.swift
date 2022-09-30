//
//  AddProfessoresView.swift
//  ProfessoresCRUD
//
//  Created by user222137 on 9/22/22.
//

import SwiftUI

struct AddProfessoresView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    @State var nome : String = ""
    @State var email : String = ""
    @Binding var isAddView : Bool
    
    var body: some View {
        
        VStack {
            
            Form{
                Section{
                    TextField("nome do professor", text: $nome )
                    TextField("email", text: $email )
                                        
                    HStack {
                        Button("Submit"){
                            
                            viewModel.createProfessor(nome: nome, email: email)
                            isAddView = false
                        }
                    }
                }
            }
        }
    }
}
            









//struct AddProfessoresView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddProfessoresView()
//    }
//}
