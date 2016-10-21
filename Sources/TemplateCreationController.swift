//
//  TemplateCreationController.swift
//  GitignoreIO
//
//  Created by Joseph Blau on 10/21/16.
//
//

import Foundation
import PerfectLib

struct TemplateCreationController {
    static let projectRootDirectory = Dir(Bundle.main.bundlePath)
    
    func parseTemplates(directory: Dir) {
        
        do {
            try directory.forEachEntry(closure: { (descriptor) in
                if File(directory.path + descriptor).isDir {
                    print("D: \(descriptor)")
//                    parseTemplates(directory: Dir(directory.path + descriptor))
                } else {
                    print("F: \(descriptor)")
                }
            })
        } catch {
            debugPrint(error)
        }
    }
}
