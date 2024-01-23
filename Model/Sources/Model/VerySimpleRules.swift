import Foundation

// Struct VerySimpleRules
public struct VerySimpleRules: Rules {
    
    public var occurrences: [Board:Int] = [:]
    public var historic: [Move] = []

    func createBoard() -> Board {
        let jungleEmptyCell: Cell = Cell(ofType: .jungle)
        let denEmptyCell: Cell = Cell(ofType: .den)
        
        
        
        let rat1: Piece = Piece(withOwner: .player1, andAnimal: .rat)
        let rat2: Piece = Piece(withOwner: .player2, andAnimal: .rat)
        let cat1: Piece = Piece(withOwner: .player1, andAnimal: .cat)
        let cat2: Piece = Piece(withOwner: .player2, andAnimal: .cat)
        let tiger1: Piece = Piece(withOwner: .player1, andAnimal: .tiger)
        let tiger2: Piece = Piece(withOwner: .player2, andAnimal: .tiger)
        let lion1: Piece = Piece(withOwner: .player1, andAnimal: .lion)
        let lion2: Piece = Piece(withOwner: .player2, andAnimal: .lion)
        let elephant1: Piece = Piece(withOwner: .player1, andAnimal: .elephant)
        let elephant2: Piece = Piece(withOwner: .player2, andAnimal: .elephant)
        
        let rat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat1.owner, withPiece: rat1)
        let rat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat2.owner, withPiece: rat2)
        let cat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat1)
        let cat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat2)
        let tiger1StartCell: Cell = Cell(ofType: .jungle, ownedBy: tiger1.owner, withPiece: tiger1)
        let tiger2StartCell: Cell = Cell(ofType: .jungle, ownedBy: tiger2.owner, withPiece: tiger2)
        let lion1StartCell: Cell = Cell(ofType: .jungle, ownedBy: lion1.owner, withPiece: lion1)
        let lion2StartCell: Cell = Cell(ofType: .jungle, ownedBy: lion2.owner, withPiece: lion2)
        let elephant1StartCell: Cell = Cell(ofType: .jungle, ownedBy: elephant1.owner, withPiece: elephant1)
        let elephant2StartCell: Cell = Cell(ofType: .jungle, ownedBy: elephant2.owner, withPiece: elephant2)
        
        
        let board: Board = Board(withGrid: [
            [jungleEmptyCell, lion1StartCell, denEmptyCell, tiger1StartCell, jungleEmptyCell],
            [rat1StartCell, jungleEmptyCell, cat1StartCell, jungleEmptyCell, elephant1StartCell],
            [jungleEmptyCell, jungleEmptyCell, jungleEmptyCell, jungleEmptyCell, jungleEmptyCell],
            [elephant2StartCell, jungleEmptyCell, cat2StartCell, jungleEmptyCell, rat2StartCell],
            [jungleEmptyCell, tiger2StartCell, denEmptyCell, lion2StartCell, jungleEmptyCell],
        ])!;
        
        return board
        
    }

    public func getNextPlayer() -> Owner {
        // Implémentation pour déterminer le prochain joueur qui doit jouer...
        // Retournez le propriétaire du joueur suivant.
    }

    public func getMoves(_ board: Board, for player: Owner) -> [Move] {
        // Implémentation pour obtenir les mouvements autorisés pour un joueur sur un plateau donné...
        // Retournez la liste des mouvements autorisés.
    }

    public func getMoves(_ board: Board, for player: Owner, fromRow: Int, fromColumn: Int) -> [Move] {
        // Implémentation pour obtenir les mouvements autorisés pour un joueur à partir d'une case spécifique...
        // Retournez la liste des mouvements autorisés.
    }

    public func isMoveValid(_ board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool {
        // Implémentation pour vérifier si un mouvement est autorisé d'une cellule à une autre...
        // Retournez true si le mouvement est autorisé, sinon false.
    }

    public func isMoveValid(_ board: Board, move: Move) -> Bool {
        // Implémentation pour vérifier si un mouvement est autorisé...
        // Retournez true si le mouvement est autorisé, sinon false.
    }

    public func isGameOver(_ board: Board, lastRow: Int, lastColumn: Int) -> (Bool, Result) {
        // Implémentation pour vérifier si la partie est terminée...
        // Retournez un tuple indiquant si la partie est terminée et le résultat.
    }

    public func playedMove(_ move: Move, fromBoard: Board, toBoard: Board) {
        // Implémentation pour mettre à jour l'état du jeu après qu'un coup a été joué...
        // Effectuez les opérations nécessaires.
    }

    public func checkBoard(_ board: Board) throws {
        // Implémentation spécifique pour vérifier si un plateau est valide selon les règles du jeu simplifiées...
        // Lancez une erreur `InvalidBoardError` avec le motif approprié si le plateau n'est pas valide.
    }
}

