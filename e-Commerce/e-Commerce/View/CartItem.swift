
import SwiftUI

struct CartItem: View {
    @EnvironmentObject var vm : ChairViewModel
    
    let chair : chairModel
    var body: some View {
        HStack{
            Image(chair.image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.trailing)
            
            
            VStack {
                Text(chair.brand)
                    .font(.system(size: 30, weight: .semibold, design: .serif))
                
                HStack{
                    Text("$ "+String(chair.Price))
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .foregroundColor(.blue)
                    
                    Button {
                        vm.deleteSelectedItem(chair: chair)
                        
                    } label: {
                        Image(systemName: "trash.circle.fill")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.black)
                    }
                    .padding(.leading)
                 

                }
                .padding(.top)
 
            }
            
        }
        .frame(width: UIScreen.main.bounds.width/1.3, height: 150, alignment: .center)
        .background(Color.white.cornerRadius(8).shadow(radius: 8, x: 4, y: 4))

    }
}

struct CartItem_Previews: PreviewProvider {
    static var vm = ChairViewModel()
    static var previews: some View {
        CartItem(chair: vm.Chairs.first!)
            .environmentObject(ChairViewModel())
    }
}
