import SwiftUI

struct SuperHeroSearchBar: View {
    
    @State var superHeroName:String = ""
    
    var body: some View {
        
        VStack {
            TextField("", text: $superHeroName, prompt:
                        Text("Super man...").font(.title2).bold().foregroundStyle(.gray)
            ).font(.title2)
                .bold()
                .foregroundStyle(.white)
                .padding(16)
                .border(.purple, width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    print(superHeroName)
                }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
        
        
    }
}

#Preview {
    SuperHeroSearchBar()
}
