//
//  Category.swift
//  M1_W3
//
//  Created by Tahani Ayman on 21/09/1446 AH.
//

import Foundation

enum Category: String, CaseIterable{
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String{
        if self == .general{
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable{
    var id: Self {self}
}
