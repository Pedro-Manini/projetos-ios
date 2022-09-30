//
//  DataController.swift
//  Projeto iCal
//
//  Created by user222137 on 9/15/22.
//

import Foundation
import CoreData
import SwiftUI

/**
 
 Data Controller vai ser uma classe que vai agrupar as funções
 que vai permitir manipular os dados:
 
 save() - permite salvar os dados no banco de dados do CoreData
 update() - permite alterar os dados no banco de dados do CoreData
 
 CRUD : Create, Read ( Ler tudo ou ler apenas um registro ), Update, Delete
 
 Um contexto no Core Data está relacionado a quais entidades o mesmo pode gerenciar : fazer CRUD das mesmas
 
 Try-catch é um mecanismo que permite  'tentar fazer algo' com possibilidade de
 tratamos este erro sem que o aplicativo pare
 
 
 A Data Controller tem o objetivo de ser uma classe controladora: que centraliza as funções de CRUD no nosso aplicativo

 */

class DataController : ObservableObject {
    
    /**
     NSPersistentContainer ajuda a gerenciar os objetos que serão
     salvos no Core Data.
     */
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        /**
            Quando inicializa-se o container (NSPersistentContainer), é necessário carregar os objetos do Core Data para poderem ser manipulados
         */
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Erro ao carregar os dados \(error)")
            }
            
        }
    }

    func save(context: NSManagedObjectContext) {
        do{
            // try - catch
            try context.save()
        }
        catch {
            //let error = error as NSError
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }
    
    /**
            UUID , name, date, calories
     */
    func addFood(name: String, calories: Double, context : NSManagedObjectContext) {
        
        let food = Food(context: context)
        
        food.name = name
        food.calories = calories
        food.id = UUID()
        food.date = Date()
        
        save(context: context)
    }
    

    func editFood(foodOld: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        
        foodOld.name = name
        foodOld.calories = calories
        foodOld.date = Date()
        
        save(context: context)
    
    }
    
    func deleteFood(offsets: IndexSet, context: NSManagedObjectContext, food: FetchedResults<Food>) {
        
        // para cada elemento que queremos deletar, temos que atualizar o contexto com esta operação
        // offsets é uma lista
        // $0 -> para pegar o primeiro elemento que vem na função
        // (arg1, arg2, arg3)
        // ($0  , $1  , $2)
        
        // para cada elemendo do offset, eu acho o mesmo no array food e delete do contexto
        offsets.map{ food[$0] }
            .forEach( context.delete )
        
        save(context: context)
    }
    
}
