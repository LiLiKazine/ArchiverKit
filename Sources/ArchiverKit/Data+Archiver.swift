//
//  Data+Archiver.swift
//  Vivaldi
//
//  Created by LiLi on 2024/5/20.
//

import Foundation

extension ArchiverWrapper where Base == Data {
    public func store(using name: String, suffix: String? = nil, directory: FileManager.SearchPathDirectory = .documentDirectory) throws -> String {
        return try Archiver.shared.store(self.base, name: name, suffix: suffix, directory: directory)
    }
    
}

extension Data {
    public init(from relativePath: String, directory: FileManager.SearchPathDirectory = .documentDirectory) throws {
        self = try Archiver.shared.fetch(from: relativePath, directory: directory)
    }
}
