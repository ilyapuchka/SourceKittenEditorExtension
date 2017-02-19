//
//  AppDelegate.swift
//  SourceKittenEditorExtensionApp
//
//  Created by Ilya Puchka on 19.02.17.
//  Copyright © 2017 Ilya Puchka. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    lazy var connection: NSXPCConnection = {
        let connection = NSXPCConnection(serviceName: "ilya.puchka.SourceKittenEditorExtensionService")
        connection.remoteObjectInterface = NSXPCInterface(with: SourceKittenEditorExtensionServiceProtocol.self)
        connection.resume()
        return connection
    }()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let handler: (Error) -> () = { error in
            print("remote proxy error: \(error)")
        }
        let service = connection.remoteObjectProxyWithErrorHandler(handler) as! SourceKittenEditorExtensionServiceProtocol
        service.structure("struct Foo {}") { (structure) in
            print(structure)
        }
    }
    
}
