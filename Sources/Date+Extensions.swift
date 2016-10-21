//
//  Date+Extensions.swift
//  GitignoreIO
//
//  Created by Joseph Blau on 10/21/16.
//
//

import Foundation

extension Date {
    var utcString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
