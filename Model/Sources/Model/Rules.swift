import Foundation

///Protocole representant les regles du jeu
protocol Rules {
    var occurrences: [Board:Int] { get }
    var historic: [Move] { get }

    static func createBoard() -> Board
    static func checkBoard(_ board: Board) throws -> Bool
    func getNextPlayer() -> Owner
    func getMoves(_ board: Board, _ player: Owner) -> [Move]
    func getMoves(_ board: Board, _ player: Owner, fromRow: Int, andColumn: Int) -> [Move]
    func isMoveValid(_ board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool
    func isMoveValid(_ board: Board, move: Move) -> Bool
    func isGameOver(_ board: Board, lastMoveRow: Int, lastMoveColumn: Int) -> (Bool, Result)
    mutating func playedMove(_ move: Move, fromBoard: Board, toBoard: Board)
}
