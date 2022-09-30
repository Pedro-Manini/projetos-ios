//
//  IndividualUserView.swift
//  Projeto User
//
//  Created by user222137 on 9/22/22.
//

import SwiftUI
import CoreData

struct IndividualUserView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isAddView : Bool = false
    
    @StateObject var user: FetchedResults<Usuarios>.Element
    
    
    var body: some View {
        
        
        VStack {
            Text("Informações deste usuário:")
                .font(.custom("San Francisco", size: 25))
                .padding()
                .multilineTextAlignment(.center)
                .bold()
        }
            
        
        VStack {
     
            
            Text("Nome: \(user.nome ?? "")")
            Text("Sobrenome: \(user.sobrenome ?? "")")
            Text("Email: \(user.email ?? "")")
            Text("Senha: \(user.senha ?? "")")
            
        }.padding()
            
        
        
        VStack {
            
            Button{
                isAddView = true
            } label: {
                Label("", systemImage: "highlighter")
            }
            
        }.padding()
        .sheet(isPresented: $isAddView){
            EditUserView(user: user)
        }
    }
}
