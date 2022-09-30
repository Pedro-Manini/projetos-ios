//
//  PokeModel.swift
//  Projeto pokeAPI
//
//  Created by user222137 on 9/27/22.
//

import Foundation

class PokeViewModel: ObservableObject {
    
    //@Published var pokeInd: PokeIndividual = PokeIndividual(name: "", base_experience: 0, sprites: Sprites)
    @Published var pokeInd: PokeIndividual? 
    
//    init() {
//        fetchPokemons(url: <#T##String#>)
//    }
    
    func fetchPokemons(url: String) {
        
        guard let url = URL(string: url) else {
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
                    let result = try JSONDecoder().decode(PokeIndividual.self, from: data)
                    
                    self.pokeInd = result
                    //print(" Count \(self.pokeInd.count) ")
                }
            } catch {
                print("fetch error \(error)")
            }
            
        }.resume()
    }//fetch
}
