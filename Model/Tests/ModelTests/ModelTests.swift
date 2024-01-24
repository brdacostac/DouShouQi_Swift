import XCTest
import Model

final class ModelTests: XCTestCase {
    
    var board: Board!
    var board2: Board!
    var simpleRules: VerySimpleRules!

    //Methode qui va être lancée avant chaque fonction de test
    override func setUpWithError() throws {
        let rat1: Piece = Piece(withOwner: .player1, andAnimal: .rat)
        let rat2: Piece = Piece(withOwner: .player2, andAnimal: .rat)
        let cat1: Piece = Piece(withOwner: .player1, andAnimal: .cat)
        let cat2: Piece = Piece(withOwner: .player2, andAnimal: .cat)

        let rat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat1.owner, withPiece: rat1)
        let rat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat2.owner, withPiece: rat2)
        let cat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat1)
        let cat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat2)

        let voidCell: Cell = Cell(ofType: .unknown)

        let grid = [[rat1StartCell, rat2StartCell], [cat1StartCell, cat2StartCell],[voidCell, voidCell],[voidCell,voidCell] ]
        board = Board(withGrid: grid)
        
        simpleRules = VerySimpleRules(historic: [])
        board2 = VerySimpleRules.createBoard()
    }

    //Methode qui va être lancée après chaque fonction de test
    override func tearDownWithError() throws {
        board = nil
    }

    //Test si le board contient les bons valeurs de lignes et de colonnes
    func testBoardValide() throws {
        XCTAssertNotNil(board)
        XCTAssertEqual(board.nbRows, 4)
        XCTAssertEqual(board.nbColumns, 2)
    }
    
    //Test methode countPieces d'un player dans le board
    func testCountPiece() throws {
        let nbPieces1 = board.countPieces(of: .player1)
        let nbPieces2 = board.countPieces(of: .player2)
        
        XCTAssertEqual(2, nbPieces1)
        XCTAssertEqual(2, nbPieces2)
    }
    
    func testCountPiecesTwoPlayers() throws {
        let nbPieces = board.countPiecesTwoPlayers()

        XCTAssertEqual(2, nbPieces.player1Count)
        XCTAssertEqual(2, nbPieces.player2Count)
    }
    
    //Test methode insertionPiece ajout d'une piece dans le board
    func testInsertPiece() throws {
        let piece = Piece(withOwner: .player1, andAnimal: .wolf)
        let boardStatus = board.insertPiece(piece: piece, atRow: 3, andColumn: 1)
        
        XCTAssertEqual(boardStatus, .ok) // Pour cela il fallu rendre BoardResult Equetable
        XCTAssertEqual(board.grid[3][1].piece?.animal, .wolf)
    }
    
    //Test methode removePiece supprime une piece dans le board
    func testRemovePiece() throws {
        let boardStatus = board.removePiece(atRow: 1, andColumn: 1)
        
        XCTAssertEqual(boardStatus, .ok)
        XCTAssertNil(board.grid[1][1].piece)
    }
    
    //Test de performance pour le boardInitializer, va mesurer le temps que ça prends
    func testPerformanceBoardInitializer() throws {
        self.measure {
            _ = Board(withGrid: board.grid)
        }
    }
    
    //Test de performance pour le CountPiece pour 1 player
    func testPerformanceCountPiece() throws {
        self.measure {
            _ = board.countPieces(of: .player1)
        }
    }
    
    //Test de performance pour CountPiece pour 2 players
    func testPerformancePiecesTwoPlayers() throws {
        self.measure {
            _ = board.countPiecesTwoPlayers()
        }
    }
    
    //Test de performance pour InsertPiece dans le board
    func testPerformanceInsertPiece() throws {
        self.measure {
            _ = board.insertPiece(piece: Piece(withOwner: .player1, andAnimal: .dog), atRow: 3, andColumn: 1)
        }
    }
    
    //Test de performance pour RemovePiece dans le board
    func testPerformanceRemovePiece() throws {
        self.measure {
            _ = board.removePiece(atRow: 2, andColumn: 0)
        }
    }
    
    //Test de parametizedInsert
    func testParametizedInsert() throws {
        func expect(expectedBoardResult : BoardResult, atRow : Int, andColumn : Int) {
            let piece = Piece(withOwner: .player1, andAnimal: .wolf)
            let boardResult = board.insertPiece(piece: piece, atRow: atRow, andColumn: andColumn)
            XCTAssertEqual(expectedBoardResult, boardResult)
        }
        
        expect(expectedBoardResult: .ok, atRow: 3, andColumn: 1)
        expect(expectedBoardResult: .failed(reason: .outOfBounds), atRow: 5, andColumn: 4)
    }
    
    
    //Tests VerifyTests
    func testCheckBoard() throws {
        let boardValide = VerySimpleRules.checkBoard(board2)
        XCTAssertEqual(boardValide, .noError)
        
        let boardInvalide = VerySimpleRules.checkBoard(board)
        XCTAssertEqual(boardInvalide, .badDimensions(board.nbRows, board.nbColumns))

    }
    
    func testGetMovesForPlayer() throws{
            
        let player1Moves = simpleRules.getMoves(board2, .player1)

        XCTAssertTrue(player1Moves.count > 0)
    }

    func testGetMovesFromCell() {
        let row = 1
        let column = 2

        let cellMoves = simpleRules.getMoves(board2, .player1, fromRow: row, andColumn: column)
        XCTAssertTrue(cellMoves.count > 0)
    }
    
    func testValidMove() {
        let fromRow = 1
        let fromColumn = 2
        let toRow = 2
        let toColumn = 2

        let isValidMove = simpleRules.isMoveValid(board2, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)

        XCTAssertTrue(isValidMove, "Le mouvement devrait être valide")
    }
    
    func testInvalidMove_OutOfBounds() {
        let fromRow = 0
        let fromColumn = 2
        let toRow = 5
        let toColumn = 2

        let isValidMove = simpleRules.isMoveValid(board2, fromRow: fromRow, fromColumn: fromColumn, toRow: toRow, toColumn: toColumn)

        XCTAssertFalse(isValidMove, "Le mouvement n'est pas valide (hors limites)")
    }
    func testGetNextPlayer_Player1ToPlayer2() {
        let game = VerySimpleRules(historic: [Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 1)])

        let nextPlayer = game.getNextPlayer()

        XCTAssertEqual(nextPlayer, .player2, "Le joueur suivant c'est le joueur 2")
    }

    func testGetNextPlayer_NoMovesYet() {

        let nextPlayer = simpleRules.getNextPlayer()

        XCTAssertEqual(nextPlayer, .player1, "Le prochain jouer est par defaut 1, si le board vient de commencé")
    }
    
    func testPlayedMove_HistoricUpdated() {
        let initialMove = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 1)

        simpleRules.playedMove(initialMove, fromBoard: VerySimpleRules.createBoard(), toBoard: VerySimpleRules.createBoard())

        XCTAssertEqual(simpleRules.historic.count, 1)
    }
    
    func testIsGameOver_NoMovesLeft() {

        let move1 = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 4)
        simpleRules.playedMove(move1, fromBoard: board2, toBoard: board2)

        let (isOver, result) = simpleRules.isGameOver(board2, lastMoveRow: move1.rowDestination, lastMoveColumn: move1.columnDestination)

        XCTAssertTrue(isOver, "Le jeu est terminé")
        XCTAssertEqual(result, .winner(.player1, .noMovesLeft), "Le jouer 1 n'a plus de mouvement")
    }

    
}
