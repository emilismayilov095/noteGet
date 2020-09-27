//
//  NoteTests.swift
//  NoteGetTests
//
//  Created by Muslim on 26.09.2020.
//  Copyright © 2020 Emil Ismayilov. All rights reserved.
//

import XCTest
@testable import NoteGet


class NoteTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitNoteWithText() {
        let note = Note(text: "Foo", image: nil)
        XCTAssertNotNil(note)
    }
    
    func testWhenGivenTextSetsText() {
        let note = Note(text: "Foo", image: nil)
        XCTAssertEqual(note.text, "Foo")
    }

}
