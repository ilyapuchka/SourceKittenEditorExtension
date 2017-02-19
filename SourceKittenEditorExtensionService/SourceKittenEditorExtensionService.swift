//
//  SourceKittenEditorExtensionService.swift
//  SourceKittenEditorExtension
//
//  Created by Ilya Puchka on 19.02.17.
//  Copyright © 2017 Ilya Puchka. All rights reserved.
//

import Foundation
import SourceKittenFramework

@objc class SourceKittenEditorExtensionService: NSObject, SourceKittenEditorExtensionServiceProtocol {
    
    func structure(_ string: String, withReply: ([String: AnyObject]) -> ()) {
        let file = File(contents: string)
        let structure = Structure(file: file)
        withReply(structure.dictionary as [String: AnyObject])
    }
    
}
