
import SwiftUI

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var scale: CGFloat = 1.0
    @State private var notes: [Note] = Array(repeating: Note(text: ""), count: 9)

    var body: some View {
        VStack {
            Spacer()

            Text("MindChuk")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .scaleEffect(scale)
                .onTapGesture {
                    withAnimation {
                        scale = scale == 1.0 ? 1.2 : 1.0
                    }
                }

            Spacer()

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<9) { index in
                    TextEditor(text: $notes[index].text)
                        .frame(minHeight: 100)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .foregroundColor(.white)
                        .font(.body)
                }
            }
            .padding()

            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct Note: Identifiable {
    let id = UUID()
    var text: String
}

#Preview {
    ContentView()
}