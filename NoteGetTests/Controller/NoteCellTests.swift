//
//  NoteCellTests.swift
//  NoteGetTests
//
//  Created by Muslim on 26.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import XCTest
@testable import NoteGet

class NoteCellTests: XCTestCase {
    
    var sut: NotesVC!
    var tableView: UITableView!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: NotesVC.self))
        sut.loadViewIfNeeded()
        
        tableView = sut.tableView
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellSetuppedWithText() {
        let note = Note(text: "Foo", image: nil)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! NoteCell
        cell.setupCellWith(note: note)
        XCTAssertEqual(cell.noteTextLabel.text, "Foo")
        XCTAssertEqual(cell.noteAttachImageView?.image, nil)
    }
    
}
