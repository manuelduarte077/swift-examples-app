

import Foundation

struct CarsList: Decodable {
    let results: [Cars]
}

struct Cars: Decodable {
    let id = UUID()
    let modelName: String
    let name: String
    let make: String
    let series: String
    let carImageUrl: String
    
    var id: Int? {
        return Int(carImageUrl.split(separator: "/").last?.description ?? "0")
    }
    
    
    var imageURL: URL? {
        return URL(string: "https://cdn.sixt.io/codingtask/images/\(id ?? 0).png")
    }
}
