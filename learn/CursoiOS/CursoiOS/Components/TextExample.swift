//
//  TextExample.swift
//  CursoiOS
//
//  Created by Manuel Duarte on 6/6/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text("Hello World")
            .font(.title)
        
        Text("Custom Text")
            .font(.system(size: 40, weight: .light, design: .monospaced))
            .italic()
            .bold()
            .underline()
            .foregroundStyle(.indigo)
            .background(.red)
        
        Text("Curso de iOS, aprendiendo desde un curso de Youtube")
            .frame(width: 160)
            .lineLimit(3)
        
    }
}

#Preview {
    TextExample()
}
