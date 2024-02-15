import Foundation
import Model

/// Extension pour la persistance de la structure Game
extension Model.Game: Codable {
    enum CodingKeys: String, CodingKey {
        case rulesCodable
        case board
        case player1Codable
        case player2Codable
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let rulesCodable = try container.decode(RulesCodable.self, forKey: .rulesCodable)
        let rules = rulesCodable.getRules()
        
        //a voir pour le init
        let board = try container.decode(Board.self, forKey: .board)
        
        let player1Codable = try container.decode(PlayerCodable.self, forKey: .player1Codable)
        let player1 = player1Codable.getPlayer()
        
        let player2Codable = try container.decode(PlayerCodable.self, forKey: .player2Codable)
        let player2 = player2Codable.getPlayer()
        
        self.init(withRules: rules, andPlayer1: player1, andPlayer2: player2)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        let rulesCodable = RulesCodable(occurrences: rules.occurrences, historic: rules.historic, rulesType: "\(type(of: rules))")
        try container.encode(rulesCodable, forKey: .rulesCodable)
        
        try container.encode(board, forKey: .board)
        
        let player1Codable = PlayerCodable(id: player1.id, name: player1.name, playerType: "\(type(of: player1))")
        try container.encode(player1Codable, forKey: .player1Codable)
        
        let player2Codable = PlayerCodable(id: player2.id, name: player2.name, playerType: "\(type(of: player2))")
        try container.encode(player2Codable, forKey: .player2Codable)
    }
}
