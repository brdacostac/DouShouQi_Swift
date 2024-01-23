import Foundation

public enum InvalidBoardError: Error {
    case badDimensions(Int, Int)
    case badCellType(CellType, Int, Int)
    case multipleOccurencesOfSamePiece(Piece)
    case pieceWithNoOwner(Piece)
    case pieceNotAllowedOnThisCell(Piece, Cell)
}
