//
//  SearchCompletions.swift
//  SearchEvents
//
//  Created by Manuel Duarte on 27/9/24.
//

import Foundation

struct SearchCompletions: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    
    var url: URL?
}
