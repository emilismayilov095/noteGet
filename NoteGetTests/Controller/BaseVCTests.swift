//
//  BaseVCTests.swift
//  NoteGetTests
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import XCTest
@testable import NoteGet


class BaseVCTests: XCTestCase {
    
    var sut: NoteDetailVC!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: NoteDetailVC.self))
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKeyboardWillShow() {
        let height = sut.baseScrollView?.contentInset.bottom
        sut.notesTextView.becomeFirstResponder()
        sut.keyboardWillShow(notification: Notification.init(name: UIResponder.keyboardWillShowNotification))
        XCTAssertEqual(sut.baseScrollView?.contentInset.bottom, height)
    }
    
    func testKeyboardWillHide() {
        let height = sut.baseScrollView?.contentInset.bottom
        sut.notesTextView.resignFirstResponder()
        sut.keyboardWillHide(notification: Notification.init(name: UIResponder.keyboardWillHideNotification))
        XCTAssertEqual(sut.baseScrollView?.contentInset.bottom, height)
    }

}
