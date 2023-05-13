//
//  Text.swift
//  topCarsApp
//
//  Created by Mauricio Tamez on 14/04/23.
//

import SwiftUI

extension Text {
    func style(_ style: DflabsStyle) -> some View {
        return self.font(style.font).foregroundColor(style.color).underline(style.underline)
    }
}
