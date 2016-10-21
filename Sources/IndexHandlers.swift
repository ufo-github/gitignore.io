//
//  IndexHandlers.swift
//  GitignoreIO
//
//  Created by Joseph Blau on 10/20/16.
//
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectMustache

struct IndexHandler: MustachePageHandler {
    func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {

        let templateCount = 297
        
        var values = MustacheEvaluationContext.MapType()
        values["description_index"] = "Create useful .gitignore files for your project by selecting from \(templateCount) Operating System, IDE, and Programming Language .gitignore templates"
        
        values["subtitle"] = "Create useful .gitignore files for your project"
        values["source_code_title"] = "Source Code"
        values["source_code_description"] = "GitHub hosted source code for .gitignore.io"
        values["command_line_title"] = "Command Line Docs"
        values["command_line_description"] = "Learn how to run .gitignore.io from the command line"
        values["video_title"] = "Watch Video Tutorial"
        values["video_description"] = "Watch a video to learn how .gitignore.io works"
        values["footer"] = "Hosting \(templateCount) Operating System, IDE, and Programming Language .gitignore templates"

        contxt.extendValues(with: values)
        do {
            try contxt.requestCompleted(withCollector: collector)
        } catch {
            let response = contxt.webResponse
            response.status = .internalServerError
            response.appendBody(string: "\(error)")
            response.completed()
        }
    }
}
