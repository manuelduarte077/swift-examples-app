
import SwiftUI

struct CarsCardView: View {
    
    let car: Cars
    
    var body: some View {
        
        HStack{
            AsyncImage(url: car.imageURL) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "number")
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            
            Text(car.name)
                .font(.title)
                .fontWeight(.medium)
        }
    }
}
