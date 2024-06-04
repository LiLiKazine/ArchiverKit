//
//  File.swift
//  
//
//  Created by LiLi on 2024/6/4.
//

import Foundation

public struct ArchiverWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ArchiverCompatible { }

extension ArchiverCompatible {
    /// Gets a namespace holder for Kingfisher compatible types.
    public var ak: ArchiverWrapper<Self> {
        get { return ArchiverWrapper(self) }
        set { }
    }
}

extension Data: ArchiverCompatible {}
extension Date: ArchiverCompatible {}
