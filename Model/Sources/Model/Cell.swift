import Foundation

// Structure Cell représentant une cellule du plateau de jeu
public struct Cell : CustomStringConvertible, Hashable{
    public let cellType: CellType
    public let initialOwner: Owner
    public var piece: Piece? // on le met en var pour pouvoir bouger la piece (dans le insertion du board par exemple)
    
    // Initialisateur de la structure Cell qui attribue des valeurs par defaut
    public init(ofType: CellType, ownedBy: Owner = .noOne, withPiece: Piece? = nil) {
        self.cellType = ofType
        self.initialOwner = ownedBy
        self.piece = withPiece
    }
    
    // Propriété de description qui est conforme au protocole CustomStringConvertible (ToString)
    public var description: String {
        let pieceDescription = (piece != nil) ? "\(piece!)" : "ø"
        return "\(pieceDescription) on \(cellType), \(initialOwner.description)"
    }
    
    public static func == (left: Cell, right: Cell) -> Bool {
        return left.cellType == right.cellType &&
        left.initialOwner == right.initialOwner &&
        left.piece == right.piece
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(cellType)
        hasher.combine(initialOwner)
        hasher.combine(piece)
    }
    
}
