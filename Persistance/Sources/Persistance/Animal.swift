import Foundation
import Model

///Extension de la classe Animal du Model
extension Model.Animal : Codable{

    // Méthode pour encoder une instance de Animal en données JSON
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    // Méthode pour décoder des données JSON en une instance de Animal
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(Int.self)
        // Utiliser la valeur brute pour initialiser l'instance de Animal
        self = Animal(rawValue: rawValue) ?? .rat // Défaut à .rat si la valeur brute n'est pas valide
    }
    
}
