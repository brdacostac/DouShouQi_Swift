import XCTest
import Model

final class VerySimpleRulesTest: XCTestCase {

    var rules = VerySimpleRules()
    var board = VerySimpleRules.createBoard()
    

    ///Test de création et vérification du plateau
    func testCreateBoard() throws {
        let board = VerySimpleRules.createBoard()
        XCTAssert(try VerySimpleRules.checkBoard(board) == true)
    }
 
    ///Test de validation du tableau valide et invalide
    func testCheckBoard() throws {
        XCTAssert(try VerySimpleRules.checkBoard(board) == true)
    }
    
    ///Test de récupération du prochain joueur
    func testGetNextPlayer() {
        let lastMove : Move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1)
        rules.historic.append(lastMove)
        
        XCTAssert(rules.getNextPlayer() == .player2)
    }
    
    
    /// Test getMoves
    func testGetMovesFromCell() {
            
        let rules = VerySimpleRules()
        let valideBoard = VerySimpleRules.createBoard()

        
        let move1 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 3)
        let move2 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 1)
        let move3 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 2, columnDestination: 2)
        let move4 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 0, columnDestination: 2)
        
        let movesExpected = [move1, move2, move3, move4]
        

        let moves = rules.getMoves(valideBoard, .player1, fromRow: 1, andColumn: 2)
        
        XCTAssertEqual(moves.count, 4)
        XCTAssertEqual(moves, movesExpected)
    }
    
    /// Tests move valide
    func testIsMoveValid_ValidMove() throws {
        XCTAssertTrue(rules.isMoveValid(board, fromRow: 0, fromColumn: 1, toRow: 1, toColumn: 1))
    }
    
    func testIsMoveValidFromMove_ValidMove() throws {
        let move: Move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 1, rowDestination: 1, columnDestination: 1)
        
        XCTAssertTrue(rules.isMoveValid( board, move:move))
    }
    
    func testGetMovesForPlayer() throws{
            
        let player1Moves = rules.getMoves(board, .player1)

        XCTAssertTrue(player1Moves.count > 0)
    }
    
    func testValidMove() {
        let fromRow = 1
        let fromColumn = 2
        let toRow = 2
        let toColumn = 2

        let isValidMove = rules.isMoveValid(board, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)

        XCTAssertTrue(isValidMove, "Le mouvement devrait être valide")
    }
    
    func testPlayedMove_HistoricUpdated() {
        let initialMove = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 1)

        rules.playedMove(initialMove, fromBoard: VerySimpleRules.createBoard(), toBoard: VerySimpleRules.createBoard())

        XCTAssertEqual(rules.historic.count, 1)
    }
    
    func testIsGameOver_NoMovesLeft() {

        let move1 = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 4)
        rules.playedMove(move1, fromBoard: board, toBoard: board)

        let (isOver, result) = rules.isGameOver(board, lastMoveRow: move1.rowDestination, lastMoveColumn: move1.columnDestination)

        XCTAssertTrue(isOver, "Le jeu est terminé")
        XCTAssertEqual(result, .winner(.player1, .noMovesLeft), "Le jouer 1 n'a plus de mouvement")
    }
    
    
}
