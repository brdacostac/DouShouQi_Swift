import Foundation

public struct Cell {
    public let cellType: CellType
    public let initialOwner: Owner
    public let piece: Piece?
    
    public init(ofType: CellType, ownedBy: Owner = .noOne, withPiece: Piece? = nil) {
        self.cellType = ofType
        self.initialOwner = ownedBy
        self.piece = withPiece
    }
    
}
