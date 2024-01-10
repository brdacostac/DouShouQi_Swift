import Foundation

// Structure Piece représentant une pièce du jeu avec un propriétaire et un animal
public struct Piece : CustomStringConvertible {
    public let owner: Owner
    public let animal: Animal
    
    // Initialisateur de la structure Piece
    public init(withOwner: Owner, andAnimal: Animal) {
        self.owner = withOwner
        self.animal = andAnimal
    }
    
    // Propriété de description qui est conforme au protocole CustomStringConvertible (ToString)
    public var description: String {
        "[\(owner.rawValue):\(animal)]"
    }
    
}