
import SwiftUI

struct CartItemView: View {
    
    @EnvironmentObject var  vm : ChairViewModel
    
    var body: some View {
       
        ZStack{
            HStack {
                Color("secondBackground")
                    .frame(width: UIScreen.main.bounds.width/3.5 ,alignment: .center)
                Color("firstBackground")
            }
            
            VStack{
                ForEach(vm.CartChair){ chair in
                    CartItem(chair: chair)
                        .padding(.top,10)
                }
                
                Spacer()

            }
            .padding(.top,100)
        
            
        }.edgesIgnoringSafeArea(.top)
        
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView()
            .environmentObject(ChairViewModel())
    }
}
