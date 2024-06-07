import SwiftUI

struct TextFieldExample: View {
    
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        
        NavigationStack{
            VStack {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding(16)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .onChange(of: email){oldValue, newValue in
                        print("El antiguo valor era \(oldValue), y el nuevo valor \(newValue)")
                    }
                
                SecureField("Password", text: $password)
                    .padding(16)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .onChange(of: password){oldValue, newValue in
                        print("El antiguo valor era \(oldValue), y el nuevo valor \(newValue)")
                    }
                
                NavigationLink {
                    
                } label: {
                    Text("Details")
                }
                
                NavigationLink(destination: TextExample(), label: {
                    Text("Texto")
                })
                
            }
        }
        
    }
}

#Preview {
    TextFieldExample()
}
