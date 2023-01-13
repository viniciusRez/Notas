//
//  UserModel.swift
//  Notas
//
//  Created by Vinicius Rezende on 05/01/23.
//

import Foundation
import CoreData

 
struct ModelUser{
    let email : String
    let senha : String
    init(email:String,senha:String){
        self.email = email
        self.senha = senha
        
    }

}
