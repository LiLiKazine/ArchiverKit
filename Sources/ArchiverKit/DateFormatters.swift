//
//  DateFormatters.swift
//  Vivaldi
//
//  Created by LiLi on 2024/5/19.
//

import Foundation

public class DateConverter {
    
    public static let shared = DateConverter()

    private let lock: NSRecursiveLock = .init()
    private var formatters = [String: DateFormatter]()
    
    public func text(of date: Date, using format: String) -> String {
        lock.lock()
        defer { lock.unlock() }
        
        if let formatter = formatters[format] {
            return formatter.string(from: date)
        }
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatters[format] = formatter
        return formatter.string(from: date)
    }
    
}

extension ArchiverWrapper where Base == Date {
    
    public func text(using format: String = "yyyy-MM-dd") -> String {
        return DateConverter.shared.text(of: self.base, using: format)
    }

}
