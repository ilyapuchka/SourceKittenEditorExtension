//
//  SourceKittenEditorExtensionServiceProtocol.swift
//  SourceKittenEditorExtension
//
//  Created by Ilya Puchka on 19.02.17.
//  Copyright © 2017 Ilya Puchka. All rights reserved.
//

import Foundation

@objc protocol SourceKittenEditorExtensionServiceProtocol {
    func structure(_ string: String, withReply: ([String: AnyObject])->())
}
