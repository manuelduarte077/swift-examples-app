import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image(
            "swiftui-og"
        )
        .resizable()
        .scaledToFit()
        .frame(width: 120, height: 150)
        
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 40, height: 40)
    }
}

#Preview {
    ImageExample()
}
