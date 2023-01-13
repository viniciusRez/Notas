//
//  NotaModel.swift
//  Notas
//
//  Created by Vinicius Rezende on 05/01/23.
//

import Foundation
import CoreData

struct ModelNotes{
    let data:Date
    let mensagem:String
    init(mensagem:String,data:Date){
        self.data = data
        self.mensagem = mensagem
    }
    
}
