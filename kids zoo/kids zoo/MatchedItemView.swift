

import SwiftUI

struct MatchedItemView: View {
    //property
   @State var animalArrayImageName : [String] = ["cat","fox","lion","rakoon","shark","tiger","cat","fox","lion","rakoon","shark","tiger"]
    var gridLAyoutColoum : [GridItem] = [ GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    @State var ArrayOfTAppedItem:[Int] = []
    @State var ArrayOfAllCorrectItem : [Int] = []
    
    init(){
        animalArrayImageName.shuffle()
    }
    
    //body
    var body: some View {
        LazyVGrid(columns: gridLAyoutColoum) {
            ForEach(0..<animalArrayImageName.count){ index in
                
                Image(animalArrayImageName[index])
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .padding(5)
                    .background(Color("AccentColor"))
                    .cornerRadius(50)
                    .overlay(Color("AccentColor").cornerRadius(50)
                        .opacity(!ArrayOfTAppedItem.contains(index)
                                 &&
                                 !ArrayOfAllCorrectItem.contains(index) ? 1 : 0
                                )
                             
                             
                             
                        .onTapGesture {
                            if ArrayOfTAppedItem.count < 3 {
                                ArrayOfTAppedItem.append(index)
                                if ArrayOfTAppedItem.count > 1 {
                                    
                                    if animalArrayImageName[ArrayOfTAppedItem[0]] == animalArrayImageName[ArrayOfTAppedItem[1]]
                                    && ArrayOfTAppedItem[0] != 1{
                                        ArrayOfAllCorrectItem.append(contentsOf: ArrayOfTAppedItem)
                                        
                                        ArrayOfTAppedItem = []
                                        
                                        if ArrayOfAllCorrectItem.count == animalArrayImageName.count {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                ArrayOfTAppedItem=[]
                                                ArrayOfAllCorrectItem=[]
                                                self.animalArrayImageName.shuffle()
                                            }
                                            
                                        }
                                       
                                        
                                        
                                    }
                                    else{
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            ArrayOfTAppedItem=[]
                                            
                                        }
                                       
                                    }
                                    
                                }
                                
                                
                                
                                
                            }
                            
                        }
                    )
                    
                
                
                
                
            }
        }
    }
}

struct MatchedItemView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedItemView()
    }
}
