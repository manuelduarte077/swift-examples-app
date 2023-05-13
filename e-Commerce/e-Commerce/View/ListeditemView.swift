
import SwiftUI
import Foundation

struct ListeditemView: View {
    
    @State var Indexer : Int = 0
    @EnvironmentObject var vm : ChairViewModel
    
    @State var timer = Timer.TimerPublisher(interval: 2, runLoop: .main, mode: .common).autoconnect()
    
    var body: some View {
        
        ZStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                headerView
                
                Text("Trending")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading)
                //
                trendingItem
                
                Text("Comming Soon")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.leading)
                
                CommonSoonItemView
                    .padding(.bottom, 90)
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}


struct ListeditemView_Previews: PreviewProvider {
    static var previews: some View {
        ListeditemView()
            .environmentObject(ChairViewModel())
    }
}



extension ListeditemView {
    
    var headerView : some View {
        TabView(selection: $Indexer) {
            
            ItemHeaderView(chair: vm.Chairs[Indexer])
                .tag(0)
            ItemHeaderView(chair: vm.Chairs[Indexer])
                .tag(1)
            ItemHeaderView(chair: vm.Chairs[Indexer])
                .tag(2)
            ItemHeaderView(chair: vm.Chairs[Indexer])
                .tag(4)
            ItemHeaderView(chair: vm.Chairs[Indexer])
                .tag(5)
            
        }.tabViewStyle(PageTabViewStyle())
            .frame( height: UIScreen.main.bounds.height/2.7, alignment: .center)
            .onReceive(timer) { timerCount in
                
                withAnimation(.easeInOut(duration: 1)) {
                    Indexer =  Indexer == 5 ? 0 : Indexer + 1
                }
            }
    }
    
}


extension ListeditemView {
    
    var trendingItem :some View {
        
        ScrollView(.horizontal, showsIndicators: true){
            HStack{
                ForEach(vm.Chairs){ chair in
                    
                    if chair.stateOnMarket=="trending"
                    {
                        NavigationLink {
                            DetailItemView(chair:chair)
                            
                        } label: {
                            itemCardView(chair: chair)
                                .padding()
                        }
                        
                    }
                    
                }
            }
        }
    }
}

extension ListeditemView {
    var CommonSoonItemView: some View{
        ScrollView(.horizontal){
            
            HStack{
                ForEach(vm.Chairs){ chair in
                    
                    
                    if chair.stateOnMarket == "comming soon"{
                        
                        NavigationLink {
                            DetailItemView( chair: chair)
                            
                        } label: {
                            itemCardView(chair: chair)
                                .padding()
                        }
                        
                    }
                    
                }
            }
        }
        
    }
}
