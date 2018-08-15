//
//  CoreDataHelper.swift
//  RinniNotes
//
//  Created by Rinni Swift on 8/15/18.
//  Copyright © 2018 Rinni Swift. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let context = appDelegate.persistentContainer.viewContext
        return context
    }()
    
    static func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
        
        return note
    }
    
    static func saveNote() {
        do {
            try context.save()
        } catch let error {
            print("could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(note: Note) {
        context.delete(note)
        
        saveNote()
    }
    
    static func retrieveNotes() -> [Note] {
        do {
            let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
            let results = try context.fetch(fetchRequest)
            return results
        } catch let error {
            print("could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
}
