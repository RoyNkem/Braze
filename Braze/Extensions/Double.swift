//
//  Double.swift
//  Braze
//
//  Created by Roy Aiyetin on 01/10/2022.
//

import Foundation

extension Double {
    
    /// Converts Double types to formatted Currency type with 2 - 6 decimal places
    /// ```
    /// Examples:
    /// Convert 1234.56 to $1234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current // <- default value
        //formatter.currencyCode = "usd" // <- change currency
        //formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Returns a string containing the formatted value of the Double provided
    /// ```
    /// Examples:
    /// Convert 1234.56 to "$1234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    /// - Returns: A string containing the formatted value of number using the receiver’s current settings.
    func asCurrencyWithSixDecimals() -> String {
        
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Returns a string representation of a double with 2 decimal places
    /// ```
    /// Examples:
    /// Convert 1.23456 to "1.234"
    /// ```
    func asNumberString() -> String {
        return String(format: ".2%f", self)
    }
    
    /// Returns a string representation of a double with percentage symbol
    /// ```
    /// Examples:
    /// Convert 1.23456 to "1.234%"
    /// ```
    func asPercentageString() -> String {
        return asNumberString() + "%"
    }
    
}
