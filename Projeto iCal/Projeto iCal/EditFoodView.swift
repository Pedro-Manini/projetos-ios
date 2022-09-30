//
//  EditFoodView.swift
//  Projeto iCal
//
//  Created by user222137 on 9/19/22.
//

import SwiftUI



struct EditFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    /**
     name e calories são responsáveis por pegar a alteração dos valores feitas no TextFiedl
     */
    @State var name : String = ""
    @State var calories : Double = 0.0
    @Binding var isAddView : Bool
    @Environment(\.dismiss) var dismiss
    
    /**
     Variável responsável por receber o elemento a ser editado no 'formato' CoreData
     */
    var food: FetchedResults<Food>.Element
    
    var body: some View {
        Form{
            Section{
                TextField("Food Name", text: $name )
                
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...3000, step: 10)
                }.padding()
                
                    /// onAppear é acionado quando a tela é mostrada ao usuário
                    /// então devemos alterar os valores dos TextFields para o usuário poder alterar
                    .onAppear(){
                        // name = food.name!
                        // food.name é um Opcional no CoreData
                        if let name = food.name{
                            self.name = name
                        }
                        // calories não é um opicional no CoreData
                        self.calories = food.calories
                    }
                
                HStack{
                    Button("Edit"){
                        DataController().editFood(foodOld: food, name: self.name, calories: self.calories, context: managedObjectContext)
                        
                        dismiss()
                        
                    }
                }
            }
        }
    }
}

