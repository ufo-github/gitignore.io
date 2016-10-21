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
