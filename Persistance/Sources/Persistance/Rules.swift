import Foundation
import Model

///Extension pour la persistance pour le protocol Rules du Model
extension Model.Rules {
    public func decodeRules(rulesCodable: RulesCodable) -> any Rules{
        return rulesCodable.getRules();
    }
    
    public func encodeRules() throws {
        let encoder = JSONEncoder()
        let mirror = Mirror(reflecting: self)
        let rulesCodable = RulesCodable(occurrences: self.occurrences, historic: self.historic, rulesType: "\(mirror.subjectType)")
        try encoder.encode(rulesCodable)
    }
}

///Extension pour la persistance pour le protocol Rules du Model pour rendre tout type de regle en persistance
public struct RulesCodable: Codable{
    
    let occurrences: [Board: Int]
    let historic: [Move]
    let rulesType: String
    
    
    //Si jamais on veut ajouter d'autres regles il faut donc faire un nouveau case
    public func getRules() -> any Rules {
        switch rulesType {
        case "VerySimpleRules":
            return VerySimpleRules();
        default:
            fatalError("Regle pas connu");
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case occurrences
        case historic
        case rulesType
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(occurrences, forKey: .occurrences)
        try container.encode(historic, forKey: .historic)
        try container.encode(rulesType, forKey: .rulesType)
    }

    public init(occurrences: [Board: Int], historic: [Move], rulesType: String){
        self.occurrences = occurrences
        self.historic = historic
        self.rulesType = rulesType
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let occurences = try container.decode([Board: Int].self, forKey: .occurrences)
        let historic = try container.decode([Move].self, forKey: .historic)
        let rulesType = try container.decode(String.self, forKey: .rulesType)
        let rules = RulesCodable(occurrences: occurences, historic: historic, rulesType: rulesType)
        self = rules
    }
    

}
