//
//  PokeView.swift
//  Projeto pokeAPI
//
//  Created by user222137 on 9/27/22.
//

import SwiftUI

struct PokeView: View {
    
    @EnvironmentObject var pokeViewModel: PokeViewModel
    @Environment(\.dismiss) var dismiss
    var pokemonElement: PokemonModel
    
    var body: some View {

        VStack{
            Form {
                Section(header: Text("Pokemon image:")) {
                    
                    if let pokeInd = pokeViewModel.pokeInd {
                        AsyncImage(url: URL(string: pokeInd.sprites.other.artWork.front_default))
                            //.resizable()
                            
                            .scaleEffect(0.5)
                            .scaledToFit()
                            .frame(width: 350, height: 200, alignment: .center)
                            
                            //.aspectRatio(contentMode: .fit)
    
                                
                        
                    
                    }
                        
                        
                    //AsyncImage(url: URL(string: pokeViewModel.pokeInd.sprites.other.artWork.front_default))
                    
                }
                
                Section(header: Text("Pokemon details:")) {
                    
                    if let pokeInd = pokeViewModel.pokeInd {
                        
                        Text("Pokemon name: \(pokeInd.name)")
                        Text("Pokemon experience: \(pokeInd.base_experience)")
                        
                    }
                    
//                    Text("Pokemon name: \(pokeViewModel.pokeInd.name)")
//                    Text("Pokemon experiencie: \(pokeViewModel.pokeInd.base_experience)")
            
                }
                
         
            }
        }
        .onAppear() {
            pokeViewModel.fetchPokemons(url: pokemonElement.url)
        }
     
    }
}

//struct PokeView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokeView()
//    }
//}
