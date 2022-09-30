//
//  SwiftUIView.swift
//  Projeto User
//
//  Created by Pedro Manini on 9/19/22.
//

import Foundation
import CoreData
import SwiftUI




///Classe controladora CRUD
class DataController : ObservableObject {
    
    
      let container = NSPersistentContainer(name: "UserModel")

    init() {

        container.loadPersistentStores { description, error in
            if let error = error{
                print("Erro ao carregar os dados: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
    
        do {            
            try context.save()
        }
        catch {
            let error = error as NSError
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }
    
    func addUsuarios(nome: String, sobrenome: String, senha: String, email: String,  context : NSManagedObjectContext) {
        
        let user = Usuarios(context: context)
        
        user.nome = nome
        user.sobrenome = sobrenome
        user.senha = senha
        user.email = email
        user.id = UUID()
        user.date = Date()
        
        save(context: context)
        
    }
    
    
    func editUsuarios(userOld: Usuarios, nome: String, sobrenome: String, senha: String, email: String,  context : NSManagedObjectContext) {
        
        userOld.nome = nome
        userOld.sobrenome = sobrenome
        userOld.senha = senha
        userOld.email = email
        userOld.date = Date()
        
        save(context: context)
        
    }
    
    
    func deleteUsuarios(offsets: IndexSet, context: NSManagedObjectContext, user: FetchedResults<Usuarios> ) {

        offsets.map{user[$0]}
            .forEach(context.delete)

        save(context: context)

    }
    
    
}

