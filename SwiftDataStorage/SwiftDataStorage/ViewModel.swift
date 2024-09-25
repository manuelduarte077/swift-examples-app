//
//  ViewModel.swift
//  SwiftDataStorage
//
//  Created by Manuel Duarte on 24/9/24.
//

import Foundation
import SwiftData

@Observable
final class ViewModel: ObservableObject {
    let container = try! ModelContainer(for: Video.self, MetaData.self)
    
    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }
    
    var videos: [Video] = []
    
    @MainActor
    func getVideos() {
        let fetchDescriptor = FetchDescriptor<Video>(predicate: nil, sortBy: [SortDescriptor<Video>(\.title)])
        
        videos = try! modelContext.fetch(fetchDescriptor)
        print(videos)
    }
    
    @MainActor
    func insert(video: Video) {
        modelContext.insert(video)
        videos = []
        getVideos()
    }
    
    @MainActor
    func deleteAllVideos(){
        videos.forEach {
            modelContext.delete($0)
        }
        try? modelContext.save()
        videos = []
        getVideos()
    }
    
}
