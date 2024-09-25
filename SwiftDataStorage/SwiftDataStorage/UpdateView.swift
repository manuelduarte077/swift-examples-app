//
//  UpdateView.swift
//  SwiftDataStorage
//
//  Created by Manuel Duarte on 24/9/24.
//

import SwiftUI

struct UpdateView: View {
    @Bindable var video: Video
    
    var body: some View {
        Form{
            TextField("Revisar el proximo video", text: $video.title )
            Toggle("Video Favorito", isOn: $video.metadata.isFavorite)
        }
    }
}
