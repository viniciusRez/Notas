//
//  NotasViewController.swift
//  Notas
//  Arquitetura utilizada MVVM (Model, ViewController, ViewModel)
//  Created by Vinicius Rezende on 06/01/23.
//

import UIKit
import CoreData

class NotasViewController: UIViewController{
    
    var notesviewModel: RegisterNotes!
    var note: NSManagedObject!
    @IBOutlet weak var txtNote: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        notesviewModel = RegisterNotes()
        self.txtNote.becomeFirstResponder()
     
        if self.note != nil{
            if let texto = note.value(forKey: "mensagem"){
                self.txtNote.text = String(describing: texto)
            }
        }else{
            notesviewModel = RegisterNotes()
            self.txtNote.text = ""
        }
        // Do any additional setup after loading the view.
    }
    
    
 
    @IBAction func salvar(_ sender: Any) {
    
        let newNote = self.notesviewModel.newNotesAndUpdate(mensagem: self.txtNote.text, existNote: self.note)
        var dialogMessage:UIAlertController
        if newNote {
            dialogMessage = UIAlertController(title: "Sucesso", message: "Sua nota foi registrada.", preferredStyle: .alert)
            
        }else{
             dialogMessage = UIAlertController(title: "Fracasso", message: "Sua nota não foi registrada.", preferredStyle: .alert)
        }
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.notesviewModel.router(navigation: self.navigationController!)

        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        
    

    }
    
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
