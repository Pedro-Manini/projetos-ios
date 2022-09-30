//
//  ContentView.swift
//  Projeto User
//
//  Created by Pedro Manini on 9/19/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
            
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order : .reverse)] ) var user: FetchedResults<Usuarios>

    @EnvironmentObject var dataController: DataController
    
    @State var isAddView : Bool = false
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("\(user.count) usuarios cadastrados.")
                    .foregroundColor(.gray)
                    .padding()
                
                
                List {
                    
                    ForEach(user) { userElement in
                        
                        VStack(alignment: .leading, spacing: 4){
                            
                            HStack{
                                
                                Text(userElement.nome ?? "unknown")
                                    .bold()
                                
                                Spacer()
                                
                                Text (timeSince(date: userElement.date ?? Date()))
                                
                            }
                            
                            
                            NavigationLink(destination: IndividualUserView(user: userElement)){
                               
                                
                            }
                                
                        }

                    }
                    .onDelete(perform: deleteUsuarios)
                }
                    
                .navigationTitle("Lista de usuarios:")
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            isAddView = true
                        } label: {
                            Label("Add Label", systemImage: "plus.circle")
                        }
                    }
                }
                .sheet(isPresented: $isAddView){
                    AddUserView()
                }
            }
        }
    }
            
                
    func deleteUsuarios(offset:IndexSet) {

        DataController().deleteUsuarios(offsets: offset, context: managedObjectContext, user: user)

    }
                           
}

func timeSince(date : Date) -> String {
    
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes / 60
    let days = hours / 24
    
    if minutes < 120 {
        return "\(minutes) minutos atrás"
    }
    else if (minutes >= 120 && hours < 48){
        return "\(hours) horas atrás"
    }
    else {
        return "\(days) dias atrás"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
