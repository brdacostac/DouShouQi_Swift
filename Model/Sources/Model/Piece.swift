import Foundation

// Structure Piece représentant une pièce du jeu avec un propriétaire et un animal
public struct Piece : CustomStringConvertible, Hashable {
    public let owner: Owner
    public let animal: Animal
    
    // Initialisateur de la structure Piece
    public init(withOwner: Owner, andAnimal: Animal) {
        self.owner = withOwner
        self.animal = andAnimal
    }
    
    // Propriété de description qui est conforme au protocole CustomStringConvertible (ToString)
    public var description: String {
        "[\(owner.description):\(animal)]"
    }
    
    public static func == (left: Piece, right: Piece) -> Bool {
        return left.owner == right.owner &&
        left.animal == right.animal
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(owner)
        hasher.combine(animal)
    }
    
}
