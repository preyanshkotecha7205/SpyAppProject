//
//  AlphaNumericTest.swift
//  SpyAppTests
//
//  Created by Preyansh Kotecha on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlphaNumericTest: XCTestCase
{
    
    var cipher: AlphaNumericCesarCipher!
    
    override func setUp()
        {
            super.setUp()
            // Put setup code here. This method is called before the invocation of each test method in the class.
            self.cipher = AlphaNumericCesarCipher()
        }
    
    func test_NegativeRun()
        {
            let plaintext = "A0"
            let result = cipher.encode (plaintext, secret: "-1")
            XCTAssertEqual("Z9", result)
        }
    
    
    func test_MessageEncryptiontest ()
        {
            let plaintext = "Z1!"
            let result = cipher.encode (plaintext, secret: "1")
            XCTAssertEqual("invalid Alphanumeric string", result)
        }
    
    func test_secretKeyEncryptionaTest ()
        {
            let plaintext = "hello"
            let result = cipher.encode (plaintext, secret: "!")
            XCTAssertEqual("Invalid shift key",result)
        }
    
    
    
}
