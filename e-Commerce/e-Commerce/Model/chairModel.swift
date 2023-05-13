import Foundation

struct chairModel:Identifiable{
    var id = UUID().uuidString
    var image:String
    var description:String
    var Price:Double
    var brand:String
    var stateOnMarket:String
}
