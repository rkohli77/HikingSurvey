import SwiftUI

struct ResponseView: View {
    var response: Response
    var body: some View {
        
        VStack {
            HStack {
                Text(response.text)
                    .padding(.trailing)
                Spacer()
                Image(systemName: response.sentiment.icon)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(response.sentiment.sentimentColor)
                    )
            }
            VStack(alignment: .trailing) {
                if let lang = response.language, let language = Language(rawValue: lang) {
                    Text("This post is written in \(language.languageString)")
                        .frame(alignment: .trailing)
                        .padding(5)
                        .italic()
                        .fixedSize(horizontal: false, vertical: true)
                        .background(RoundedRectangle(cornerRadius: 50)
                            .fill(.black.opacity(0.2))
                        )
                        .font(.footnote)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 8)
            .fill(.white)
        )
    }
}

#Preview {
    ResponseView(response: Response(text: "I enjoy hiking very much!", score: 1.0, language: "en"))
}
