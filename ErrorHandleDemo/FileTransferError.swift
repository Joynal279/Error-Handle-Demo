//
//  FileTransferError.swift
//  ErrorHandleDemo
//
//  Created by Joynal Abedin on 13/3/23.
//

import Foundation

enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}
