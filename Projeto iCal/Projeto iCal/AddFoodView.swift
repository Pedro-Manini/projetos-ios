//
//  AddFoodView.swift
//  Projeto iCal
//
//  Created by user222137 on 9/16/22.
//

import SwiftUI
import CoreData

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var name : String = ""
    @State var calories : Double = 0.0
    @Binding var isAddView : Bool
    //@Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Form{
            Section{
                TextField("Food Name", text: $name )
                
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...3000, step: 10 )
                }.padding()
                
                HStack{
                    Button("Submit"){
                        DataController().addFood(name: self.name, calories: self.calories, context: managedObjectContext)
                        
                        isAddView = false
                        //dismiss()
                    }
                }
            }
        }
    }
}


