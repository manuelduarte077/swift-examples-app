

import SwiftUI

struct DetailItemView: View {
  
    @EnvironmentObject var  vm : ChairViewModel
    
    
    let chair:chairModel
    @State var quantity : Int = 0
    @State var isAnimated = false
    
    @State var isColor1Pressed : Bool = false
    @State var IsColor2Pressed : Bool = false
    @State var isColor3Pressed : Bool = false
    @State var IsColor4Pressed : Bool = false

    var body: some View {
        VStack(alignment:.leading,spacing:0){
            Image(chair.image)
                .resizable()
                .scaledToFill()
                .frame( height: UIScreen.main.bounds.height/3.5, alignment: .center)
                .offset(x: 0, y: isAnimated ? 0 : 30)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isAnimated = true
                    }
                }
            
            Text(chair.brand)
                .font(.system(size: 35, weight: .semibold, design: .serif))
                .padding(.top,40)
                .padding(.leading,20)
            
            Text("$"+String(chair.Price))
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundColor(.blue)
                .padding(.leading,20)
                .padding(.top,30)
            
            HStack{
                Text("Color:")
                    .font(.system(size: 30, weight: .bold, design: .serif))
                Spacer()
                Text("Quantity:")
                    .font(.system(size: 30, weight: .bold, design: .serif))
                    .padding(.trailing)
                
            }.padding(.leading,20)
                .padding(.top,30)
            
            
            HStack(spacing:20){
                Circle()
                    .fill(.gray)
                    .frame(width: 30, height: 30, alignment: .center)
                    .overlay(
                        Circle()
                            .stroke(Color.gray,lineWidth: 3)
                            .frame(width: 40, height: 40, alignment: .center)
                            .opacity(isColor1Pressed ? 1 : 0)
                        
                    )
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.5)) {
                            isColor1Pressed=true
                            IsColor2Pressed=false
                            isColor3Pressed=false
                            IsColor4Pressed=false
                        }
                        
                    }
                
                
                    
                Circle()
                    .fill(.blue)
                    .frame(width: 30, height: 30, alignment: .center)
                    .overlay(
                        Circle()
                            .stroke(Color.blue,lineWidth: 3)
                            .frame(width: 40, height: 40, alignment: .center)
                            .opacity(IsColor2Pressed ? 1 : 0)
                    )
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.5)) {
                        isColor1Pressed=false
                        IsColor2Pressed=true
                        isColor3Pressed=false
                        IsColor4Pressed=false
                        }}
                
                
                
                
                Circle()
                    .fill(.red)
                    .frame(width: 30, height: 30, alignment: .center)
                    .overlay(
                        Circle()
                            .stroke(Color.red,lineWidth: 3)
                            .frame(width: 40, height: 40, alignment: .center)
                            .opacity(isColor3Pressed ? 1 : 0)
                    )
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.5)) {
                        isColor1Pressed=false
                        IsColor2Pressed=false
                        isColor3Pressed=true
                        IsColor4Pressed=false
                        }}
                
                Circle()
                    .fill(.black)
                    .frame(width: 30, height: 30, alignment: .center)
                    .overlay(
                        Circle()
                            .stroke(Color.black,lineWidth: 3)
                            .frame(width: 40, height: 40, alignment: .center)
                            .opacity(IsColor4Pressed ? 1 : 0 )
                    )
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.3)) {
                        isColor1Pressed=false
                        IsColor2Pressed=false
                        isColor3Pressed=false
                        IsColor4Pressed=true
                    }
                    }
                
                
                Spacer()
                
                Button {
                    quantity = quantity - 1
                } label: {
                    
                    Text("-")
                        .font(.system(size: 40, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(.gray.opacity(0.7))
                        .cornerRadius(12)
                
                }
                
                Text(String(quantity))
                    .font(.system(size: 25, weight: .semibold, design: .default))
                    .frame(width:30, height: 30, alignment: .center)
                
                
                Button {
                    quantity = quantity + 1
                    
                } label: {
                    
                    Text("+")
                     
                        .font(.system(size: 40, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(.gray.opacity(0.7))
                        .cornerRadius(12)
                
                }
                .padding(.trailing,20)
                

                
            }.padding(.leading,20)
                .padding(.top,30)
            
            Text(chair.description)
                .font(.system(size: 18, weight:.medium, design: .serif))
                .padding()
                .padding(.top,10)
            
          

            
            
            Spacer()
            
            
            Button {
                vm.addItem(chair: chair)
                
            } label: {
                
                Text("ADD TO CART")
                    .font(.system(size: 35, weight: .semibold, design: .serif))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 70, alignment: .center)
                    .background(.blue)
                    .cornerRadius(19)
                    .zIndex(1)
                
            }
            .padding(.bottom,10)


            
        }
        .edgesIgnoringSafeArea(.bottom)
      
       
        
    }
}

struct DetailItemView_Previews: PreviewProvider {
    
    static let vm = ChairViewModel()
   
    static var previews: some View {
        DetailItemView(chair: vm.Chairs.first!)
            .environmentObject(ChairViewModel())
           
    }
}
