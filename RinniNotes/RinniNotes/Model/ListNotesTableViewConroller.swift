//
//  ListNotesTableViewConroller.swift
//  RinniNotes
//
//  Created by Rinni Swift on 8/13/18.
//  Copyright © 2018 Rinni Swift. All rights reserved.
//

import Foundation
import UIKit

class ListNotesTableViewController: UITableViewController {
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        cell.noteTitleLabel.text = "note's title"
        cell.timeStampLabel.text = "modification time"
        return cell
    }
    
}
