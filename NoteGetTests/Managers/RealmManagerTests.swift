//
//  RealmManagerTests.swift
//  NoteGetTests
//
//  Created by Muslim on 26.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import XCTest
import RealmSwift
@testable import NoteGet

class RealmManagerTests: XCTestCase {
    
    var sut: RealmManager!
    var notes: Results<Note>!

    override func setUpWithError() throws {
        sut = RealmManager.shared
        let realm = RealmManager.shared.realm
        notes = realm.objects(Note.self)
    }

    override func tearDownWithError() throws {
        
    }

    func testAddToDataBase() {
        let note = Note(text: "Foo", image: nil)
        sut.create(note)
        XCTAssertTrue(notes.last?.text == "Foo")
    }
    
    func testUpdateNoteInDatabase() {
        let note = Note(text: "Foo", image: nil)
        sut.create(note)
        
        let dict: [String:Any?] = ["text": "Bar", "image": nil]
        sut.update(note, with: dict)
        XCTAssertTrue(notes.last?.text == "Bar")
    }

    func testDeleteNoteFromDataBase() {
        let note = Note(text: "Foo", image: nil)
        sut.create(note)
        
        sut.delete(note)
        XCTAssertTrue(!notes.contains(note))
    }
}
