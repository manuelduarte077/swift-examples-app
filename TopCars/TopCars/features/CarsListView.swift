import SwiftUI

struct CarsListView: View {
    
    @State var carList: [Cars] = []
    
    var body: some View {

        NavigationView {
            List(carList, id: \.name) { car in
                Text(car.name)
            }
            .onAppear(){
                CarsAPI().loadCars { result in
                    
                    switch result {
                    case.success(let carList):
                        self.carList = carList
                    case.failure(let error):
                        print(error)
                    }
                    
                }
            }
        }
        
    }
}
    
