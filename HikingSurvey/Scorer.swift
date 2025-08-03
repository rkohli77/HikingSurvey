import Foundation
import NaturalLanguage

class Scorer {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    func score(_ text: String) -> (Double, NLLanguage?) {
        var sentimentScore = 0.0
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex,
            unit: .sentence,
            scheme: .sentimentScore,
            options: []) { sentimentTag, _ in
                if let sentimentString = sentimentTag?.rawValue,
                   let score = Double(sentimentString) {
                    sentimentScore = score
                    return true
                }
                return false
            }
        return (sentimentScore, tagger.dominantLanguage)
    }
}
