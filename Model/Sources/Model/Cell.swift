import Foundation

// Structure Cell représentant une cellule du plateau de jeu
public struct Cell : CustomStringConvertible{
    public let cellType: CellType
    public let initialOwner: Owner
    public let piece: Piece?
    
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
    
}
