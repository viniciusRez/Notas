//
//  ListarNotasTableViewController.swift
//  Notas
//
//  Created by Vinicius Rezende on 06/01/23.
//

import UIKit
import CoreData

class ListarNotasTableViewController: UITableViewController {
    var listarNota: ListarNotaModel!
    var allNotes: Array<NSManagedObject>!
    override func viewDidLoad() {
        super.viewDidLoad()
        listarNota = ListarNotaModel()
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        allNotes = self.listarNota.getAllNotes()
        self.tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        return allNotes.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let note = self.allNotes[indexPath.row]
        self.performSegue(withIdentifier: "seeNotes", sender: note)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeNotes" {
            let destino = segue.destination as! NotasViewController
            destino.note = sender as? NSManagedObject
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellNotes", for: indexPath)
        let note = self.allNotes[indexPath.row]
        let text = note.value(forKey: "mensagem")
        let data = note.value(forKey: "data")
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy hh:mm"
        let newData = dateFormater.string(from: data as! Date)
        
        
        cell.textLabel?.text = text as? String
        cell.detailTextLabel?.text =  newData
        
        return cell
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let deleteNote = allNotes[indexPath.row]
            allNotes.remove(at: indexPath.row)
            listarNota.deleteNote(note: deleteNote)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
