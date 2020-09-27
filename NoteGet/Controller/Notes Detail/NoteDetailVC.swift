//
//  NoteDetailVC.swift
//  NoteGet
//
//  Created by Muslim on 24.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class NoteDetailVC: BaseVC {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var attachImageView: UIImageView!
    
    private var imagePicker: ImagePicker!
    var isEdit = false
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIWith(isEdit: self.isEdit)
        
        baseScrollView = self.scrollView
        baseTextView = self.notesTextView
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if !notesTextView.text.isEmpty {
            saveOrEditNote()
        }
    }
    
    @IBAction func attachmentButtonPressed(_ sender: UIButton) {
        imagePicker.present(from: sender)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        view.endEditing(true)
    }
    
}




extension NoteDetailVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if let image = image {
            self.attachImageView.image = image
        }
    }
}



extension NoteDetailVC {
    func setupUIWith(isEdit: Bool) {
        if isEdit {
            self.notesTextView.text = self.note?.text
            if let image = UIImage(data: self.note?.image ?? Data()) {
                self.attachImageView.image = image
            }
        } else {
            notesTextView.becomeFirstResponder()
        }
    }
    
    func saveOrEditNote() {
        if isEdit {
            let dict: [String:Any?] = ["text": notesTextView.text, "image": attachImageView.image?.pngData()]
            RealmManager.shared.update(self.note ?? Note(), with: dict)
        } else {
            let note = Note(text: notesTextView.text, image: attachImageView.image?.pngData())
            RealmManager.shared.create(note)
        }
    }
}
