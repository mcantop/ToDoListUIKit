//
//  MenuSection.swift
//  ToDoListUIKit
//
//  Created by Maciej on 13/04/2023.
//

import Foundation

enum MenuSection: Int, CaseIterable {
    case ongoing
    case done
    
    var name: String {
        switch self {
        case .ongoing:
            return "Ongoing"
        case .done:
            return "Done"
        }
    }
}
