//
//  PokemonModel.swift
//  Projeto pokeAPI
//
//  Created by user222137 on 9/26/22.
//

import Foundation

struct PokemonData: Codable {
    
    var count: Int
    //var next: String
    //var previous : String = ""
    var results : [PokemonModel] = []
   
    
}
struct PokemonModel: Codable {
    
    var name: String
    var url: String
    
}

//----------------------------------------------//

struct PokeIndividual: Codable {
    
    var name: String
    var base_experience: Int
    var sprites: Sprites
    //var types: [Types]
    //var types: String //modificar depois para array
    

}

struct Sprites: Codable {
    
    var front_default: String
    var other: OfficialArtWork
    
}


struct OfficialArtWork: Codable {
    
    var artWork: FrontDefault
    
    private enum CodingKeys: String, CodingKey {
        
        case artWork = "official-artwork"
            
    }
    
}

struct FrontDefault: Codable {
    var front_default: String
}

//struct Types: Codable {
//    var type
//}



