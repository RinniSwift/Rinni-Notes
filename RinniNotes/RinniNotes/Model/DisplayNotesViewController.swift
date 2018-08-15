//
//  DisplayNotesViewController.swift
//  RinniNotes
//
//  Created by Rinni Swift on 8/13/18.
//  Copyright © 2018 Rinni Swift. All rights reserved.
//

import Foundation
import UIKit

class DisplayNotesViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var note: Note?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? ListNotesTableViewController
            else { return }
        
        switch identifier {
        case "saveNote" where note != nil:
            
            
            note?.title = noteTitleTextField.text ?? ""
            note?.content = noteContentTextView.text ?? ""
            destination.tableView.reloadData()
            
            CoreDataHelper.saveNote()
            
        case "saveNote" where note == nil:
            let note = CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
//            note.modificationTime = NSDate() as Date
            
            CoreDataHelper.saveNote()
            
            
        case "cancelNote":
            print("cancel note success")
        default:
            print("segue error")
        }
    }
}
