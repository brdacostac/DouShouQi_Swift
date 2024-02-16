import Foundation
import Model

///Extension pour la persistance de la structure Player du Model
extension Model.Player {
    
    public func decodePlayer(playerData: PlayerData) -> Player{
        return playerData.getPlayer();
    }
    
    public func encodePlayer() throws {
        let encoder = JSONEncoder()
        let mirror = Mirror(reflecting: self)
        let playerData = PlayerData(id: self.id, name: self.name, playerType: "\(mirror.subjectType)")
        try encoder.encode(playerData)
    }
}

///Extension pour la persistance de la structure Player du Model
public struct PlayerData: Codable{
    
    let id: Owner
    let name: String
    let playerType: String
    

    
    public func getPlayer() -> Player {
        let move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 0)
        switch playerType {
        case "HumanPlayer":
            return HumanPlayer(withName: name, andId: id, andInputMethod: { _ in return move })!;
        case "RandomPlayer":
            return RandomPlayer(withName: name, andId: id)!;
        default:
            fatalError("Player pas connu");
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case playerType
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(playerType, forKey: .playerType)
    }

    public init(id: Owner, name: String, playerType: String){
        self.id = id
        self.name = name
        self.playerType = playerType
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Owner.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let playerType = try container.decode(String.self, forKey: .playerType)
        let player = PlayerData(id: id, name: name, playerType: playerType)
        self = player
    }

}
