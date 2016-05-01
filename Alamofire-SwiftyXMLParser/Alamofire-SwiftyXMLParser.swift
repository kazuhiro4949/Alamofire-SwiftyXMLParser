//
//  Alamofire-SwiftyXMLParser.swift
//  Alamofire-SwiftyXMLParser
//
//  Created by Kazuhiro Hayashi on 5/1/16.
//  Copyright © 2016 Kazuhiro Hayashi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyXMLParser

public extension Request {
    
    /**
     Creates a response serializer that returns a XML object constructed from the response data using
     `SwiftyXMLParser` with the specified reading options.
     
     - parameter option: The XML serialization trimming character options. nothing by default.
     
     - returns: A XML.Accessor object response serializer.
     */
    public static func XMLResponseSerializer(
        option option: NSCharacterSet? = nil)
        -> ResponseSerializer<XML.Accessor, XML.Error>
    {
        return ResponseSerializer { _, response, data, error in
            guard error == nil else {
                return .Failure(.ParseError)
            }
            
            if let response = response where response.statusCode == 204 {
                return .Success(XML.parse(NSData()))
            }
            
            guard let validData = data where validData.length > 0 else {
                return .Failure(.ParseError)
            }
            
            let xml: XML.Accessor
            if let option = option {
                xml = XML.parse(validData, trimming: option)
            } else {
                xml = XML.parse(validData)
            }
            return .Success(xml)
        }
    }
    
    /**
     Adds a handler to be called once the request has finished.
     
     - parameter options:           The XML serialization trimming character option. nothing by default.
     - parameter completionHandler: A closure to be executed once the request has finished.
     
     - returns: The request.
     */
    public func responseXML(
        queue queue: dispatch_queue_t? = nil,
              option: NSCharacterSet? = nil,
              completionHandler: Response<XML.Accessor, XML.Error> -> Void)
        -> Self
    {
        return response(
            queue: queue,
            responseSerializer: Request.XMLResponseSerializer(option: option),
            completionHandler: completionHandler
        )
    }
}


