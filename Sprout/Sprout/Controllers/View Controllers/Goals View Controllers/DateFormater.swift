//
//  Date Formater.swift
//  Sprout
//
//  Created by Zebadiah Watson on 12/11/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

extension Date {
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from:self)
    }
}
