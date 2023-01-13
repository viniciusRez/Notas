//
//  ListarNotasModel.swift
//  Notas
//
//  Created by Vinicius Rezende on 06/01/23.
//

import Foundation
import CoreData

class ListarNotaModel: NotasViewModel {
    
    func getAllNotes() -> [NSManagedObject] {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Notas")
        let orderZA = NSSortDescriptor(key: "data", ascending: false)
        request.sortDescriptors = [orderZA]
        
        var data:[NSManagedObject] = []
        do{
            let users = try context.fetch(request)
            if users.isEmpty{
                print ("Nenhum usuario")
            } else {
                for user in users as! [NSManagedObject] {
                    if let _ = user.value(forKey: "data") {
                        
                        if let _ = user.value(forKey: "mensagem") {
                            data.append(user)
                        }
                    }
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return data
    }
    func deleteNote(note:NSManagedObject){
    
                self.context.delete(note)
                do {
                    try self.context.save()
                 
                } catch {
                  
                }
    }
}
    
//    func getUserById() ->  NSManagedObject? {
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
//        let predicate = NSPredicate(format: "email == %@",email)
//        request.predicate = predicate
//
//        do{
//            let users = try self.context.fetch(request)
//            if users.isEmpty{
//                return nil
//            } else {
//                for user in users as! [NSManagedObject] {
//                  return user
//                }
//            }
//
//        } catch {
//            print("Erro de dados")
//        }
//        return nil
//    }
// func deleteUser(email:String)-> Bool{
//        let user = getUserById(email: email)
//        if user == nil{
//            return false
//        }else{
//            self.context.delete(user!)
//            do {
//                try self.context.save()
//                return true
//            } catch {
//                return false
//            }
//        }
//    }

