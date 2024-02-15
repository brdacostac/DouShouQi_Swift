import Foundation
import Model

///Extension pour la persistance de la strcut board du Model
extension Model.Board: Codable {
    enum CodingKeys: String, CodingKey {
        case grid
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(grid, forKey: .grid)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let grid = try container.decode([[Cell]].self, forKey: .grid)
        self.init(withGrid: grid)!
    }
}

