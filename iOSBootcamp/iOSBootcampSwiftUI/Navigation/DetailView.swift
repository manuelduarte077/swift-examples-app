import SwiftUI

struct DetailView: View {
    
    let alumno : String
    @ObservedObject var viewModel = ModeloDemo()
    
    var body: some View {
        VStack {
            Text("Alumno Viewmodel: \(viewModel.name)")
            
            Divider()
            Text("Alumno : \(alumno)")
            
        }
        .font(.footnote)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(alumno: "Marco")
    }
}
