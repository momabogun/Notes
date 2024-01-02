//
//  Prio.swift
//  Notes
//
//  Created by Momcilo Bogunovic on 25.12.23.
//

import Foundation
import SwiftUI

enum Prio: String, Hashable, Identifiable, CaseIterable {
    case low, medium, high
    
    var id: String {rawValue}
    
    
    var title : String{
        switch self{
            
        case .low:
            "Low"
        case .medium:
            "Medium"
        case .high:
            "High"
        }
    }
    
    var color: Color {
        switch self{
            
        case .low:
                .green
        case .medium:
                .yellow
        case .high:
                .red
        }
    }
}
