import Foundation
import Model

///Extension pour la persistance pour le protocol Rules du Model
extension Model.VerySimpleRules : Codable {
    enum CodingKeys: String, CodingKey {
        case occurrences
        case historic
    }

    // Initialisation à partir du décodeur
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let occurrences = try container.decode([Board: Int].self, forKey: .occurrences)
        let historic = try container.decode([Move].self, forKey: .historic)

        self.init()
    }

    // Encodage des données
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(occurrences, forKey: .occurrences)
        try container.encode(historic, forKey: .historic)
    }
}


