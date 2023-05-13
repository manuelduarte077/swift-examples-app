

import SwiftUI

struct itemCardView: View {
    @EnvironmentObject var vm : ChairViewModel
    let chair : chairModel
    
    var body: some View {
        VStack(spacing:0){
            Image(chair.image)
                .resizable()
                .scaledToFill()
                .frame(width:120, height: 150, alignment: .center)
            
            Text(chair.brand)
                .font(.title3)
                .fontWeight(.semibold)
            
            Text(chair.stateOnMarket)
                .font(.headline)
                .padding(.top,5)
                
            
            Text("$"+String(chair.Price))
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.blue)

        }
        .frame(width: 200, height: 300, alignment: .center)
        .background(Color.white.cornerRadius(15).shadow(radius: 8, x: 4, y: 4))
        
    }
}
