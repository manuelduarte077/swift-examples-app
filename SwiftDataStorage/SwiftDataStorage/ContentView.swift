//
//  ContentView.swift
//  SwiftDataStorage
//
//  Created by Manuel Duarte on 24/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.videos) { video in
                    NavigationLink(value: video) {
                        HStack {
                            Text(video.title)
                            if video.metadata.isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Videos por ver")
            .navigationDestination(for: Video.self, destination: { video in
                UpdateView(video: video)
            })
            .toolbar{
                ToolbarItem {
                    Button(action: {
                        withAnimation{
                            let newVideo = Video(
                                id: .init(), 
                                title: "Android Java",
                                metadata: .init(isFavorite: true)
                            )

                            viewModel.insert(video: newVideo)
                        }
                    }, label: {
                        Label("Add item", systemImage: "plus")
                    })
                }
                ToolbarItem {
                    Button(action: {
                        withAnimation{
                            viewModel.deleteAllVideos()
                        }
                    }, label: {
                        Label("Remove All", systemImage: "trash")
                    })
                }
            }
            .onAppear {
                viewModel.getVideos()
            }
        }
    }
}
