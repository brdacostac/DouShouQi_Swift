import Foundation


protocol Rules {
    var occurrences: [Board:Int] { get }
    var historic: [Move] { get }

    static func createBoard() -> Board
    static func checkBoard(_ board: Board) -> InvalidBoardError
    func getNextPlayer() -> Owner
    func getMoves(_ board: Board, for player: Owner) -> [Move]
    func getMoves(_ board: Board, for player: Owner, fromRow: Int, fromColumn: Int) -> [Move]
    func isMoveValid(_ board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool
    func isMoveValid(_ board: Board, move: Move) -> Bool
    func isGameOver(_ board: Board, player1Id: Int, player2Id: Int) -> (Bool, Result)
    func playedMove(_ move: Move, fromBoard: Board, toBoard: Board)
}
