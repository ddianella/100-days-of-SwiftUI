//
//  FilteringType.swift
//  Project12. CoreDataProject
//
//  Created by Prince$$ Di on 02.06.2021.
//

import Foundation

// Challenge 3 Create FilterType enum
enum FilterType: String, CaseIterable {
    case beginsWith = "BEGINSWITH"
    case beginsWithCaseInsensitive = "BEGINSWITH[c]"
    case contains = "CONTAINS"
    case containsWithCaseInsensitive = "CONTAINS[c]"
    case endsWith = "ENDSWITH"
    case endsWithCaseInsensitive = "ENDSWITH[c]"
}
