//
//  SourceEditorCommand.swift
//  SourceKittenEditorExtension
//
//  Created by Ilya Puchka on 19.02.17.
//  Copyright © 2017 Ilya Puchka. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    lazy var connection: NSXPCConnection = {
        let connection = NSXPCConnection(serviceName: "ilya.puchka.SourceKittenEditorExtensionService")
        connection.remoteObjectInterface = NSXPCInterface(with: SourceKittenEditorExtensionServiceProtocol.self)
        connection.resume()
        return connection
    }()
    
    deinit {
        connection.invalidate()
    }
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) -> Void {
        let handler: (Error) -> () = { error in
            print("remote proxy error: \(error)")
        }
        let service = connection.remoteObjectProxyWithErrorHandler(handler) as! SourceKittenEditorExtensionServiceProtocol
        service.structure(invocation.buffer.completeBuffer) { (structure) in
            print(structure)
            completionHandler(nil)
        }
    }
    
}
