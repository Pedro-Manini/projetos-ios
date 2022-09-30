//
//  Game.swift
//  ProjetoAlvo
//
//  Created by user222137 on 9/9/22.
//

import Foundation

class Game {
    
    var target: Int = (Int.random(in: 1...100))
    
    var points: Int = 0
    
    var diffOnScreen = 0
    
    var bullseye = ""
    
    
    
    func armazenarPontos(_ sliderNumber: Int) {
        
        diffOnScreen = abs(target - sliderNumber)
        
        points += diffOnScreen
        
        if diffOnScreen == 0 {
            bullseye = "BULLSEYE!!!!"
        } else {
            bullseye = ""
        }
        
    }
    
    func mudarTarget() {
        target = Int.random(in: 1...100)
        print(target)
    }
    
    func getMessage(_ sliderNumber: Int) -> String{
            if diffOnScreen == 0{
                return "Você acertou!!!!"
            }
            else {
                return "Voce acertou o numero \(sliderNumber)"
            }
        }
    
        
            
}


