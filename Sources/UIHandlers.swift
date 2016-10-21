//
//  UIHandlers.swift
//  GitignoreIO
//
//  Created by Joseph Blau on 10/21/16.
//
//

import Foundation
import PerfectHTTP

struct UI {
    func dropdownHandler(request: HTTPRequest, _ response: HTTPResponse)  {
        response.setHeader(.cacheControl, value: "public, max-age=0")
        response.setHeader(.contentType, value: "text/json")
        response.setHeader(.expires, value: Date().description)
        response.completed()
    }
}
