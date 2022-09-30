//
//  ViewModel.swift
//  ProfessoresCRUD
//
//  Created by user222137 on 9/21/22.
//

import Foundation

/**
        Camada responsável por gerenciar os objetos ''pegados" e enviados pela API
        Responsável por fazer o CRUD -> LER , CRIAR, ALTERAR e DELETAR  com a API
 
        Serializar é o ato de transformar um objeto em binário (0 e 1) -> Codable
            Deserializar é o ato de pegar um binário e transfomar em um objeto -> Decodable
 
 ObservableObject: o mesmo notifica o SwiftUI quando houver alguma alteração nos objetos da ViewModel
 */
class ViewModel : ObservableObject {
    
    let urlAddr : String = "https://cors.grandeporte.com.br/cursos.grandeporte.com.br:8080/professores"
    
    // @Published serve para notificar a tela (swift ui) quando esta variável for modificada
    @Published var items : [ProfessorModel] = []
    
    // fazer um construtor para quando instanciarmos um objeto do tipo View Model,
    // a variável items será carregada com os professores vindo da API
    init(){
        fetchProfessores()
    }
    
    /**
                Fetch é pegar todos os dados da API
     */
    func fetchProfessores(){
        
        guard let url = URL(string: urlAddr) else {
            print("URL NOT FOUND")
            return
        }
        
        /**
            dataTask é para criar uma tarefa de forma assíncrona para que o usuário
                    possa fazer outras coisas em paralelo sem precisar ficar esperando
                            a resposta da requisição
         
                O shared é uma variável que está dentro da classe URLSession e serve para compartilhar/executar tasks
                    na aplicação para criar as requisições feitas pelo APP de forma assíncrona
         */
        URLSession.shared.dataTask(with: url){ (data, res, error) in
            
            if error != nil {
                print("error \(error!)")
                return
            } //if
            
            /**
             Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
             */
            do {
                if let data  = data{
                    let result = try JSONDecoder().decode([ProfessorModel].self, from: data)
                    
                    self.items = result
                    print(" Count \(self.items.count) ")
                }
            }// do
            catch {
                print("fetch error \(error)")
            } // catch
            
        }.resume()
        // o resume é necessário para executar a task
    }
    
    func createProfessor(nome: String, email: String){
        
        guard let url = URL(string: urlAddr) else {
            print("URL NOT FOUND")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let professor : ProfessorModel = ProfessorModel(id:0, nome:nome, email:email)
        
        do{
            // serializando para enviar para a API
            request.httpBody = try JSONEncoder().encode(professor)
        }
        catch{
            print("Erro ao converter o professor")
        }
        
        // agora é criar a tarefa que vai fazer a requisição para a API
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            
            if error != nil {
                print("error: \(error!)")
                return
            }// if
            
            do{
                // pegando a resposta da API
                if let data = data{
                    let result = try JSONDecoder().decode(ProfessorModel.self, from: data)
                    
                    print("CREATE : \(result.id)")
                    
                    self.fetchProfessores()
                }
            }//do
            catch {
                print("Erro ao converter o professor")
            }//catch
            //resume executa a tarefa
        }.resume()
        //dataTask
        
    }
    
    func updateProfessores(id : Int, nome : String, email: String){
        
        guard let url = URL(string: "\(urlAddr)/\(id)") else {
            print("URL NOT FOUND")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let professor : ProfessorModel = ProfessorModel(id:id, nome:nome, email:email)
        // ENCODER tranforma um objeto swift em um JSON que será enviado para a API
        do{
            // serializando para enviar para a API
            request.httpBody = try JSONEncoder().encode(professor)
        }
        catch{
            print("Erro ao converter o professor")
        }
        
        // agora é criar a tarefa que vai fazer a requisição para a API
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            
            if error != nil {
                print("error: \(error!)")
                return
            }// if
            
            do{
                // pegando a resposta da API
                if let data = data{
                    // DECODER tranforma um JSON (em geral vem da API) para um objeto swift
                    let result = try JSONDecoder().decode(ProfessorModel.self, from: data)
                    
                    print("UPDATE : \(result.id)")
                    
                    self.fetchProfessores()
                }
            }//do
            catch {
                print("Erro ao converter o professor")
            }//catch
            //resume executa a tarefa
        }.resume()
        //dataTask
        
    }
    
    func deleteProfessores(id : Int){
        
        guard let url = URL(string: "\(urlAddr)/\(id)") else {
            print("URL NOT FOUND")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){ (data, res, error) in
            
            if error != nil {
                print("error: \(error!)")
                return
            }// if
            
            self.fetchProfessores()
            
            //resume executa a tarefa
        }.resume()
        //dataTask
        
    }
    
    func stressFunction(){
        
        for i in 1...1000{
            createProfessor(nome: "Professor \(i)", email: "Email \(i)")
        }
    }
}
