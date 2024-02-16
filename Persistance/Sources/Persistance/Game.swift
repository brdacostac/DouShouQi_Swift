import Foundation
import Model

/// Extension pour la persistance de la structure Game
extension Model.Game: Codable {
    enum CodingKeys: String, CodingKey {
        case rulesData
        case board
        case player1Data
        case player2Data
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let rulesData = try container.decode(RulesData.self, forKey: .rulesData)
        let rules = rulesData.getRules()
        
        //a voir pour le init
        let board = try container.decode(Board.self, forKey: .board)
        
        let player1Data = try container.decode(PlayerData.self, forKey: .player1Data)
        let player1 = player1Data.getPlayer()
        
        let player2Data = try container.decode(PlayerData.self, forKey: .player2Data)
        let player2 = player2Data.getPlayer()
        
        self.init(withRules: rules, andPlayer1: player1, andPlayer2: player2)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        let rulesData = RulesData(occurrences: rules.occurrences, historic: rules.historic, rulesType: "\(type(of: rules))")
        try container.encode(rulesData, forKey: .rulesData)
        
        try container.encode(board, forKey: .board)
        
        let player1Data = PlayerData(id: player1.id, name: player1.name, playerType: "\(type(of: player1))")
        try container.encode(player1Data, forKey: .player1Data)
        
        let player2Data = PlayerData(id: player2.id, name: player2.name, playerType: "\(type(of: player2))")
        try container.encode(player2Data, forKey: .player2Data)
    }
}
