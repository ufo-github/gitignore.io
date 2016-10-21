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

//        let templateCount = 297
        
        var values = MustacheEvaluationContext.MapType()
        
//        values["description_index"] = "index_description".localizedWithComment(comment: "")
//        values["subtitle"] = "index_subtitle".localizedWithComment(comment: "")
//        values["source_code_title"] = "index_source_code_title".localizedWithComment(comment: "")
//        values["source_code_description"] = "index_source_code_description".localizedWithComment(comment: "")
//        values["command_line_title"] = "index_command_line_title".localizedWithComment(comment: "")
//        values["command_line_description"] = "index_command_line_description".localizedWithComment(comment: "")
//        values["video_title"] = "index_video_title".localizedWithComment(comment: "")
//        values["video_description"] = "index_video_descriptoin".localizedWithComment(comment: "")
//        values["footer"] = "index_footer".localizedWithComment(comment: "")

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
