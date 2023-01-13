//
//  ViewModel.swift
//  Notas
//
//  Created by Vinicius Rezende on 05/01/23.
//

import Foundation
import CoreData
import UIKit

class NotasViewModel{
    
    let appDelegate:AppDelegate
    let context:NSManagedObjectContext
    let notes:NSManagedObject
    init(){
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = self.appDelegate.persistentContainer.viewContext
        self.notes = NSEntityDescription.insertNewObject(forEntityName: "Notas", into: context)

        }
    func router(navigation: UINavigationController){
        navigation.popToRootViewController(animated: true)
    }

}
//Register
class RegisterNotes: NotasViewModel {


    func newNotesAndUpdate(mensagem:String,existNote:NSManagedObject?)-> Bool {
        let data: Date = Date()
        let info:ModelNotes = ModelNotes(mensagem: mensagem, data: data)
        if existNote != nil {
            existNote!.setValue(info.mensagem ,forKey: "mensagem")
            existNote!.setValue(info.data ,forKey: "data")
        }else {
            self.notes.setValue(info.mensagem ,forKey: "mensagem")
            self.notes.setValue(info.data ,forKey: "data")
            
        }
        
        do {
            try self.context.save()
            return true
        } catch let error  {
            
            print(error.localizedDescription)
            return false

        }
    }
}
//Read

//Updade
//
////Delete
//extension NotasViewModel {
//    func deleteUser(email:String)-> Bool{
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
//}

