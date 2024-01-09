import Foundation

public struct Piece : CustomStringConvertible {
    public let owner: Owner
    public let animal: Animal
    
    public init(withOwner: Owner, andAnimal: Animal) {
        self.owner = withOwner
        self.animal = andAnimal
    }
    
    public var description: String {
        "[\(owner.rawValue):\(animal)]"
    }
    
}
