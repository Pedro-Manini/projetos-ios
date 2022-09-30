//
//  ViewModel.swift
//  Projeto pokeAPI
//
//  Created by user222137 on 9/26/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var pokeModels: [PokemonModel] = []
    
  
    
    var urlAddr = "https://pokeapi.co/api/v2/pokemon?limit=10&offset=0"
    
    
//    init() {
//        fetchPokemons(urlAddr: urlAddr)
//    }
    
    func fetchPokemons(urlAddr: String) {
        
        guard let url = URL(string: urlAddr) else {
            print("URL NOT FOUND")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, res, error) in
            
            if error != nil {
                print("error \(error!)")
                return
            }
            
            do {
                if let data  = data{
                    let result = try JSONDecoder().decode(PokemonData.self, from: data)
                    
                    self.pokeModels = result.results
                    print(" Count \(self.pokeModels.count) ")
                }
            } catch {
                print("fetch error \(error)")
            }
            
        }.resume()
    }//fetch
}
