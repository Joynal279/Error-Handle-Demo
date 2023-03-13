//
//  ContentView.swift
//  ErrorHandleDemo
//
//  Created by Joynal Abedin on 13/3/23.
//

import SwiftUI

struct ContentView: View {
    
    let connectionOK = true
    let connectionSpeed = 30.0
    let fileFound = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func transferFile() throws -> Bool {
      // let m = fileTransfer()
    }
    
    func fileTransfer() throws {
        guard connectionOK else {
            throw FileTransferError.noConnection
        }
        guard connectionSpeed > 30 else {
            throw FileTransferError.lowBandwidth
        }
        guard fileFound else {
            throw FileTransferError.fileNotFound
        }
    }
    
    func sendFile() -> String {
        
        defer {
            //removeTmpFiles()
            //closeConnection()
        }
        
        
        do {
            try fileTransfer()
        }catch FileTransferError.noConnection {
            return "No Internet Connection"
        }catch FileTransferError.lowBandwidth {
            return "File Transfer Speed too Low"
        }catch FileTransferError.fileNotFound {
            return "File Not Found"
        }catch {
            return "Unknown Error"
        }
        
        return "Successfully transfer"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
