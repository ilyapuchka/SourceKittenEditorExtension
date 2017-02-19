//
//  main.swift
//  SourceKittenEditorExtension
//
//  Created by Ilya Puchka on 19.02.17.
//  Copyright © 2017 Ilya Puchka. All rights reserved.
//

import Foundation

class ServiceDelegate : NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface(with: SourceKittenEditorExtensionServiceProtocol.self)
        let exportedObject = SourceKittenEditorExtensionService()
        newConnection.exportedObject = exportedObject
        newConnection.resume()
        return true
    }
}

// Create the listener and resume it:
let delegate = ServiceDelegate()
let listener = NSXPCListener.service()
listener.delegate = delegate;
listener.resume()
