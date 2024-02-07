import Foundation

/// La structure Game
public struct Game {
    public var rules : Rules
    public var board : Board
    public let player1 : Player
    public let player2 : Player
    
    //pointeur de fonction
    private var observers : [GameObserver] = []
    
    public init(withRules rules: Rules, andPlayer1 player1: Player, andPlayer2 player2: Player) {
        self.rules = rules
        self.board = type(of: rules).createBoard()
        self.player1 = player1
        self.player2 = player2
    }
    
    /// Ajoute un observateur
    public mutating func addObserver(_ observer: GameObserver) {
        observers.append(observer)
    }
    
    /// Notifie tous les observateurs que le jeu démarre
    public func notifyGameStarts() {
        observers.forEach { $0.gameStarts() }
    }
    
    /// Notifie tous les observateurs du prochain joueur à jouer
    ///
    /// - Parameter player: Le joueur suivant
    public func notifyNextPlayerTurn(player: Player) {
        observers.forEach { $0.nextPlayerTurn(player: player) }
    }
    
    /// Notifie tous les observateurs de la fin du jeu avec le résultat
    ///
    /// - Parameter result: Le résultat de la partie
    public func notifyGameOver(result: (Bool, Result)) {
        observers.forEach { $0.gameOver(result: result) }
    }
    
    /// Notifie tous les observateurs du mouvement choisi par un joueur
    ///
    /// - Parameter move: Le mouvement choisi
    public func notifyMoveChosen(move: Move) {
        observers.forEach { $0.moveChosen(move: move) }
    }
    
    /// Notifie tous les observateurs d'un mouvement invalide
    public func notifyInvalidMove() {
        observers.forEach { $0.invalidMove() }
    }
    
    /// Notifie tous les observateurs du changement de plateau de jeu
    ///
    /// - Parameter board: Le nouveau plateau de jeu
    public func notifyBoardChanged(board: Board) {
        observers.forEach { $0.boardChanged(board: board) }
    }

    
    /// Fonction pour lancer la boucle de jeu
    public mutating func start() throws {
        notifyGameStarts()
        
        var nextPlayer: Player = player1
        var lastMoveRow = 0
        var lastMoveColumn = 0
        
        while !rules.isGameOver(board, lastMoveRow: lastMoveRow, lastMoveColumn: lastMoveColumn).0 {
            notifyNextPlayerTurn(player: nextPlayer)
            
            var isValidMove = false
            
            while !isValidMove {
                if let move = nextPlayer.chooseMove(in: board, with: rules) {
                    notifyMoveChosen(move: move)
                    
                    do {
                        isValidMove = try rules.isMoveValid(board, move: move)
                        
                        if isValidMove {
                            let previousBoard = board
                            let destinationRow = move.rowDestination
                            let destinationColumn = move.columnDestination
                            let originRow = move.rowOrigin
                            let originColumn = move.columnOrigin
                            
                            if let piece = board.grid[originRow][originColumn].piece {
                                _ = board.removePiece(atRow: originRow, andColumn: originColumn)
                                _ = board.insertPiece(piece: piece, atRow: destinationRow, andColumn: destinationColumn)
                                
                                rules.playedMove(move, fromBoard: previousBoard, toBoard: board)
                                
                                lastMoveRow = destinationRow
                                lastMoveColumn = destinationColumn
                                
                                notifyBoardChanged(board: board)
                            }
                        }
                    } catch {
                        notifyInvalidMove()
                    }
                } else {
                    // Aucun mouvement trouvé, la partie est terminée sans mouvements restants
                    break
                }
            }
            
            // Changer de joueur
            nextPlayer = (nextPlayer === player1) ? player2 : player1
        }
        
        // La partie est terminée, notifie les observateurs
        let gameResult = rules.isGameOver(board, lastMoveRow: lastMoveRow, lastMoveColumn: lastMoveColumn)
        notifyGameOver(result: gameResult)
    }
    
}
