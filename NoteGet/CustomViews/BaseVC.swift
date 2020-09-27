//
//  BaseVC.swift
//  NoteGet
//
//  Created by Muslim on 24.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    var baseScrollView: UIScrollView?
    var baseTextView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(BaseVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}



extension BaseVC {
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        baseScrollView?.contentInset.bottom = keyboardFrame.height + 5
        baseTextView?.contentInset.bottom = keyboardFrame.height + 5
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        baseScrollView?.contentInset = contentInsets
        baseScrollView?.scrollIndicatorInsets = contentInsets
        baseTextView?.contentInset = contentInsets
        baseTextView?.scrollIndicatorInsets = contentInsets
    }
}
