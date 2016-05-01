//
//  Alamofire_SwiftyXMLParserTests.swift
//  Alamofire-SwiftyXMLParserTests
//
//  Created by Kazuhiro Hayashi on 4/30/16.
//  Copyright © 2016 Kazuhiro Hayashi. All rights reserved.
//

import XCTest
@testable import Alamofire
@testable import SwiftyXMLParser
@testable import AlamofireSwiftyXMLParser


class Alamofire_SwiftyXMLParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testXMLResponseSerializer() {
        let serializer = Request.XMLResponseSerializer()
        let xmlStr = "<Result><Name>text</Name></Result>"
        let data = xmlStr.dataUsingEncoding(NSUTF8StringEncoding)
        
        let result = serializer.serializeResponse(nil, nil, data, nil)
        if let xml = result.value {
            XCTAssertEqual(xml["Result", "Name"].text!, "text", "Success to serialize")
        } else {
            XCTAssert(false, "Fail to parse")
        }
    }
    
    func testResponseXML() {
        let request = Request(session: NSURLSession(), task: NSURLSessionTask())
        request.delegate.queue.suspended = true
        request.responseXML { _ in }
        
        XCTAssertEqual(request.delegate.queue.operationCount, 2, "added response operation")
    }
}
