//
//  SourceEditorExtension.swift
//  SourceKittenEditorExtension
//
//  Created by Ilya Puchka on 19.02.17.
//  Copyright © 2017 Ilya Puchka. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
    func extensionDidFinishLaunching() {
        print("extension launched")
    }
    
    /*
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
        return []
    }
    */
    
}
