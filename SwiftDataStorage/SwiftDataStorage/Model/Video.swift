//
//  Video.swift
//  SwiftDataStorage
//
//  Created by Manuel Duarte on 24/9/24.
//

import Foundation
import SwiftData

@Model
class Video {
    @Attribute(.unique) var id: UUID
    var title: String
    
    /// Transient estamos diciendo que este dato, no se va guardar
    @Transient var numberOfLikes: Int { title.count}  // Variable computada
    
    @Relationship(deleteRule: .cascade) var metadata: MetaData
    
    init(id: UUID, title: String, metadata: MetaData) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}



@Model
class MetaData {
    var isFavorite: Bool
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}
