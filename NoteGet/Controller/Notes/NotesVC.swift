//
//  NotesVC.swift
//  NoteGet
//
//  Created by Muslim on 24.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit
import RealmSwift

class NotesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var notes: Results<Note>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = RealmManager.shared.realm
        notes = realm.objects(Note.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let destVC = segue.destination as? NoteDetailVC,
               let note = sender as? Note {
                destVC.note = note
                destVC.isEdit = true
            }
        }
    }
}



// Table View Data Source
extension NotesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell
        noteCell.setupCellWith(note: notes[indexPath.row])
        return noteCell
    }
}



// Table View Delegate: Share, Delete, Open Details
extension NotesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetails", sender: notes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let shareAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let note = self.notes[indexPath.row]
            let firstActivityItem = note.text
            let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem ?? ""], applicationActivities: nil)
            activityViewController.activityItemsConfiguration = [ UIActivity.ActivityType.message] as? UIActivityItemsConfigurationReading
            activityViewController.isModalInPresentation = true
            self.present(activityViewController, animated: true, completion: nil)
            success(true)
        })
        shareAction.image = UIImage(systemName: "square.and.arrow.up.on.square")
        return UISwipeActionsConfiguration(actions: [shareAction])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let note = self.notes[indexPath.row]
            RealmManager.shared.delete(note)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            success(true)
        })
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
