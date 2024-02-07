import Foundation

/// protocol pour les types de notifications
public protocol GameObserver {
    func gameStarts()
    func nextPlayerTurn(player: Player)
    func gameOver(result: (Bool, Result))
    func moveChosen(move: Move)
    func invalidMove()
    func boardChanged(board: Board)
}
