import Foundation

public enum InvalidBoardError: Error, Equatable {
    case badDimensions(Int, Int)
    case badCellType(CellType, Int, Int)
    case multipleOccurencesOfSamePiece(Piece)
    case pieceWithNoOwner(Piece)
    case pieceNotAllowedOnThisCell(Piece, Cell)
    //Pas demandé
    case numberOfPiece(piecesPlayer1: Int, piecesPlayer2: Int)
    case noError
}
