//
//  RoundedCornersImageView.swift
//  NoteGet
//
//  Created by Muslim on 24.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class RoundedCornersImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }

}
