import UIKit

func newClientConnection(serverSocket: Int, connected: ((_ socket: Int?, _ error: Error?) -> Void)) {
    
}

func readHTTPRequest(socket: Int, complete: ((_ request: String?, _ error: Error?) -> Void)) {
    
}

func accessFilesystem(request: String, complete: ((_ fileSystem: String?, _ error: Error?) -> Void)) {
    
}

func accessDatabase(request: String, complete: ((_ database: String?, _ error: Error?) -> Void)) {
    
}

func sendResponse(socket: Int, request: String, database: String, filesystem: String) {
    
}


// =========================================
let serverSocket = 1234

// your code here!

newClientConnection(serverSocket: serverSocket) { socket, error in
    guard let socket = socket, error != nil else {
        return
    }
    
    readHTTPRequest(socket: socket) { request, error in
        guard let request = request, error != nil else {
            return
        }
        
        accessFilesystem(request: request) { fileSystem, error in
            guard let fileSystem = fileSystem, error != nil else {
                return
            }
            
            accessDatabase(request: request) { database, error in
                guard let database = database, error != nil else {
                    return
                }
                
                sendResponse(socket: socket, request: request, database: database, filesystem: fileSystem)
            }
        }
    }
}
