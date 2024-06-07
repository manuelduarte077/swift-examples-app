import SwiftUI

struct IMCView: View {
    
    @State var gender:Int = 0
    @State var height:Double = 150
    @State var age:Int = 18
    @State var weight:Int = 100
    
    var body: some View {
        VStack{
            HStack {
                ToggleButton(text: "Man", imageName: "heart", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Woman", imageName: "star", gender: 1, selectedGender: $gender)
            }
            
            ///
            HeightCalculator(
                selectedHeight: $height
            )
            
            ///
            HStack{
                CounterWeight(title: "Edad", subTitle: $age)
                CounterWeight(title: "Peso", subTitle: $weight)
                
            }
            
            ///
            ButtonCalculate()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .padding()
            .background(.backgroundApp)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("IMC Calculator").foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
    }
}

struct ToggleButton:View {
    
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
    var body: some View {
        
        let color = if (gender == selectedGender) {
            Color.backgroundSelected
        } else {
            Color.backgroundComponent
        }
        
        Button(action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .foregroundStyle(.white)
                InformationText(text: text)
            }
            .frame(maxWidth:  .infinity, maxHeight: .infinity)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
}

struct InformationText:View {
    let text:String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
    }
}

struct TitleText:View {
    let text:String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundStyle(.gray)
    }
}


struct HeightCalculator:View {
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in:100...220, step: 1).accentColor(.purple).padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)       .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct CounterWeight:View {
    let title:String
    @Binding var subTitle:Int
    
    var body: some View {
        VStack {
            TitleText(text: title)
            InformationText(text: String(subTitle))
            
            HStack{
                Button {
                    if subTitle != 0 {
                        subTitle -= 1
                    }
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                
                Button {
                    if subTitle < 100 {
                        subTitle += 1
                    }
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                
                
            }.padding(.horizontal, 8)
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}


struct ButtonCalculate:View {
    var body: some View {
        
        NavigationStack{
            NavigationLink(destination: {}){
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backgroundComponent)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            
        }
    }
}

#Preview {
    IMCView()
}
