//
//  2-vstack-hstack-zstack.swift
//  SwiftUIDemo
//
//  Created by Don Manuel on 24/6/23.
//

import SwiftUI

struct VstackHstackZstackView: View {
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Manuel Duarte")
                    .font(.largeTitle)
                    .bold()
                Text("manuelduarte077")
                    .foregroundColor(.gray)
                
                HStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: 118, height: 68)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Circle()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.blue)
                            Text("username")
                                .font(.headline)
                        }
                        Text("Software Enginner at Nerdify")
                            .foregroundColor(.gray)
                        Text("Solo se codiar")
                            .foregroundColor(.gray)
                    }
                    
                }
                
            }
            Text("Software Enginner ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .underline()
                .background(Color.black)
                .rotationEffect(.degrees(-20))
        }
    }
}

struct VstackHstackZstackViewPreviews: PreviewProvider {
    static var previews: some View {
        VstackHstackZstackView()
    }
}
