//
//  Note.swift
//  NoteGet
//
//  Created by Muslim on 24.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import Foundation
import RealmSwift


@objcMembers class Note: Object {
    dynamic var text : String?  = ""
    dynamic var image: Data? = nil
    
    convenience init(text: String?, image: Data?) {
        self.init()
        self.text = text
        self.image = image
    }
}
