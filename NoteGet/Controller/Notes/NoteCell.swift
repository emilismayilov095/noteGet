//
//  NoteCell.swift
//  NoteGet
//
//  Created by Muslim on 24.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteTextLabel: UILabel!
    @IBOutlet weak var noteAttachImageView: RoundedCornersImageView!
    
    func setupCellWith(note: Note) {
        self.noteTextLabel.text = note.text
        if let image = UIImage(data: note.image ?? Data()) {
            self.noteAttachImageView.image = image
        }
    }

}
