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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "saveNote":
            let note = Note()
            
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            
            note.modificationTime = Date()
            
            let destination = segue.destination as! ListNotesTableViewController
            destination.notes.append(note)
            
        case "cancelNote":
            print("cancel note success")
        default:
            print("segue error")
        }
    }
}
