import Foundation

class ChairViewModel:ObservableObject{
    
    @Published var Chairs = data.chairs
    @Published var CartChair : [chairModel] = []

    var indexer = -1

    func addItem(chair:chairModel){
           
        CartChair.append(chair)
    }

    func deleteSelectedItem (chair:chairModel){
        
        for i in 0...CartChair.count-1 {
            if CartChair[i].id == chair.id {
                indexer = i
            }
        }
        
        if indexer != -1 {
            CartChair.remove(at: indexer)
        }
        
    }
}

