//
//  ContentView.swift
//  Projeto pokeAPI
//
//  Created by user222137 on 9/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    @EnvironmentObject var pokeViewModel: PokeViewModel
    
    @State var nLimit: Int = 10
    @State var nOffset: Int = 0
    
    
    //@State private var searchPoke = ""
    //var searchPoke: PokemonModel
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                Form {
                    Section(header: Text("list settings")) {
                       
                        Picker("On screen", selection: $nLimit) {
                            
                            ForEach(0..<1300) {
                                Text("\($0)")
                            }
                            
                        }
                        
                        Picker("Start at", selection: $nOffset) {
                            
                            ForEach(0..<1300) {
                                Text("\($0)")
                            }
                            
                        }
                        
                    }//section
                    
                    Section(header: Text("Pokemons")) {
                        
                        List{
                            
                            ForEach(viewModel.pokeModels, id: \.name){ pokeElement in
                                
                                VStack {
                                    
                                        
                                    NavigationLink(destination: PokeView(pokemonElement: pokeElement).environmentObject(PokeViewModel())){
                                        
                                        HStack{
                                            
//
//                                            if let pokeInd = pokeViewModel.pokeInd {
//                                                AsyncImage(url: URL(string: pokeInd.sprites.front_default))}
                                            Text("\(pokeElement.name)")
                                        }
                                        
                                        
                                    }
                                    
                                }
                            }
                        }//list
                        //.searchable(text: $searchPoke, prompt: "Search for a pokemon:")
                        
                    }//section
                    
                }//form
                .navigationTitle("Pokedex:")
                
                .toolbar {
                    ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar) {
                        Button(action: {
                            viewModel.fetchPokemons(urlAddr: "https://pokeapi.co/api/v2/pokemon?limit=\(nLimit)&offset=\(nOffset)")
                        }, label: {
                            Text("Update")
                        })
                    }
                }//tool
                
                
            }//VStack
        }
        .onAppear(){
            viewModel.fetchPokemons(urlAddr: viewModel.urlAddr)
        }
        
    }
//    var filteredResorts: PokemonModel{
//        if searchPoke.isEmpty {
//            return PokemonModel
//        } else {
//            return PokemonModel.filter {
//                $0.PokemonModel.localizedCaseInsensitiveContains(searchPoke)
//            }
//        }
//    }
            
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
