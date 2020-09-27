//
//  NotesVCTests.swift
//  NoteGetTests
//
//  Created by Muslim on 27.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import XCTest
@testable import NoteGet

class NotesVCTests: XCTestCase {
    
    var sut: NotesVC!
    var tableView: UITableView!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: NotesVC.self))
        sut.loadViewIfNeeded()
        
        tableView = sut.tableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertNotNil(sut.tableView.delegate)
    }

    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testCellForRowtIndexPathReturnsNoteCell() {
        let note = Note(text: "Foo", image: nil)
        RealmManager.shared.create(note)
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is NoteCell)
    }
}
