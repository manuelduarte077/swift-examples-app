import Alamofire

final class CarsAPI {
    
    func loadCars(completion: @escaping (Result<[Cars], Error>) -> () ) {
        AF.request("https://cdn.sixt.io/codingtask/cars").responseDecodable(of: CarsList.self) { response in
     
        switch response.result {
          case .success(let carsList):
              completion(.success(carsList.results))
          case .failure(let error):
              completion(.failure(error))
          }
        }
    }
}
