//
//  DocsHandlers.swift
//  GitignoreIO
//
//  Created by Joseph Blau on 10/20/16.
//
//

import PerfectLib
import PerfectHTTP
import PerfectMustache

struct DocsHandler: MustachePageHandler {
    func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
        
        let templateCount = 297
        var values = MustacheEvaluationContext.MapType()
        values["command_line_description"] = "Learn how to run .gitignore.io from the command line"
        values["command_line_title"] = "Command Line Docs"
        values["description_docs"] = "Docs For Generating Your Project .gitignore File with \(templateCount) Operating System, IDE, and Programming Language .gitignore templates"
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
