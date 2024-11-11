//
//  BitcoinPriceApp.swift
//  BitcoinPrice
//
//  Created by Don Manuel on 16/4/23.
//

import SwiftUI

@main
struct BitcoinPriceApp: App {
    var body: some Scene {
        WindowGroup {
            BitcoinPriceView(viewModel: BitcoinPriceViewModel())
        }
    }
}
