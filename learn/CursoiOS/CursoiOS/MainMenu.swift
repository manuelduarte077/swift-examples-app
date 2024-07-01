//
//  MainMenu.swift
//  CursoiOS
//
//  Created by Manuel Duarte on 6/6/24.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink(destination: IMCView(), label: {
                    Text("IMC APP")
                })
            }
        }
    }
}

#Preview {
    MainMenu()
}
