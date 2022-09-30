//
//  ContentView.swift
//  ProjetoAlvo
//
//  Created by user222137 on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var slideValue : Double = 50.0
    
    @State var teste: Game = Game()
    
    @State var isAlertVisible: Bool = false
    
    @State var showSecondScreen: Bool = false
    
    var body: some View {
        
        
        
        VStack {
            VStack{
                //Text("Acerte o numero")
                Arqextra()
                AcerteNumText(color: Color ("softpink"), text: "Acerte o número!")
            }
            
            VStack {
                Text ("\(teste.target)")
            }
            
            HStack{
                SliderView(sliderNumber: $slideValue)
            }
            
            AcerteiButton(teste: $teste, slideValue: $slideValue, isAlertVisible: $isAlertVisible)
//            Button("Acertei") {
//                print("Cliquei no botão \(Int(slideValue))")
//                teste.armazenarPontos(Int(slideValue))
//                teste.mudarTarget()
//
//                isAlertVisible = true
//            }
        
            HStack {
                AcerteNumText(color: .black, text: "Pontuacao: \(teste.points)")
            }
            
            VStack {
                AcerteNumText(color: .black, text: "Diferenca de pontos: \(teste.diffOnScreen)")
                AcerteNumText(color: .black, text: "\(teste.bullseye)")
            }
            
            VStack{
                
                Button("Info") {
                    showSecondScreen = true
                }
                .sheet(isPresented: $showSecondScreen, content: {
                    SecondView(showSecondScreen: $showSecondScreen, text: "Heyyyy")
                    
                                } )
            }
            
            .alert("Titulo do Alerta", isPresented: $isAlertVisible, actions: {
                Button("OK", role: .cancel){
                    
                    isAlertVisible = false
                }
                
                //                Button("Delete", role: .destructive){
                //
                //                    isAlertVisible = false
                //                }
            } , message: {
                
                Text(teste.getMessage(Int(slideValue)))
                
            } )
            
        }
    }
    
}

struct AcerteiButton: View {

    @Binding var teste: Game
    @Binding var slideValue : Double
    @Binding var isAlertVisible: Bool

    var body: some View {

        Button("Acertei") {
            print("Cliquei no botão \(Int(slideValue))")
            teste.armazenarPontos(Int(slideValue))
            teste.mudarTarget()

            isAlertVisible = true
        }
    }

}

struct SliderView: View {
    
    // @Binding serve pare toda vez que a variável sliderNumber for alterado, a variável slideValue também será alterada
    @Binding var sliderNumber: Double
    
    var body: some View {
        HStack{
            Text("1")
            Slider(value: $sliderNumber, in: 1...100)
            Text("100")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


