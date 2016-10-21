//
//  APIHandlers.swift
//  GitignoreIO
//
//  Created by Joseph Blau on 10/21/16.
//
//

import Foundation
import PerfectHTTP

struct API {
    
    func listHandler(request: HTTPRequest, _ response: HTTPResponse) {
        response.setHeader(.cacheControl, value: "public, max-age=0")
        response.setHeader(.expires, value: Date().description)
        
        let isFormatJSON = request.queryParams.contains { $0 == ("format", "json") }

        if isFormatJSON {
            response.appendBody(string: "JSON")
        } else {
            response.setHeader(.contentType, value: "text/plain")
            response.appendBody(string: "Plian text")
        }
        response.completed()
    }
    
    func helpHandler(request: HTTPRequest, _ response: HTTPResponse) {
        response.setHeader(.cacheControl, value: "public, max-age=0")
        response.setHeader(.expires, value: Date().description)
        
        response.appendBody(string: "gitignore.io help:\n  list    - lists the operating systems, programming languages and IDE input types\n  :types: - creates .gitignore files for types of operating systems, programming languages or IDEs\n")
        
        response.completed()
    }
    
    func templateHandler(request: HTTPRequest, _ response: HTTPResponse) {
        response.appendBody(string: "Template")
        response.completed()
    }
    
    func templateFileHandler(request: HTTPRequest, _ response: HTTPResponse) {
        response.appendBody(string: "Template File")
        response.completed()
    }
}
