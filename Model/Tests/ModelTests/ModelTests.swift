import XCTest
import Model

final class ModelTests: XCTestCase {
    
    var board: Board!

    //Methode qui va être lancée avant chaque fonction de test
    override func setUpWithError() throws {
        let cell: Cell = Cell(ofType: .jungle)
        let grid = [[cell, cell], [cell, cell]]
        board = Board(withGrid: grid)
    }

    //Methode qui va être lancée après chaque fonction de test
    override func tearDownWithError() throws {
        board = nil
    }

    //Test si le board contient les bons valeurs de lignes et de colonnes
    func testBoardValide() throws {
        XCTAssertNotNil(board)
        XCTAssertEqual(board.nbRows, 2)
        XCTAssertEqual(board.nbColumns, 2)
    }
    
    //Test methode countPieces d'un player dans le board
    func testCountPiece() throws {
        let piece1 = Piece(withOwner: .player1, andAnimal: .wolf)
        let piece2 = Piece(withOwner: .player1, andAnimal: .lion)
        
        board.grid[1][0].piece = piece1
        board.grid[1][1].piece = piece2
        
        let nbPieces = board.countPieces(of: .player1)
        
        XCTAssertEqual(nbPieces, 2)
    }
    
    func testCountPiecesTwoPlayers() throws {
        let piece1 = Piece(withOwner: .player1, andAnimal: .wolf)
        let piece2 = Piece(withOwner: .player2, andAnimal: .lion)
       
        board.grid[1][0].piece = piece1
        board.grid[1][1].piece = piece2

        let nbPieces = board.countPiecesTwoPlayers()

        XCTAssertEqual(nbPieces.player1Count, 1)
        XCTAssertEqual(nbPieces.player2Count, 1)
    }
    
    //Test methode insertionPiece ajout d'une piece dans le board
    func testInsertPiece() throws {
        let piece = Piece(withOwner: .player1, andAnimal: .wolf)
        let boardStatus = board.insertPiece(piece: piece, atRow: 1, andColumn: 1)
        
        XCTAssertEqual(boardStatus, .ok) // Pour cela il fallu rendre BoardResult Equetable
        XCTAssertEqual(board.grid[1][1].piece?.animal, .wolf)
    }
    
    //Test methode removePiece supprime une piece dans le board
    func testRemovePiece() throws {
        let piece = Piece(withOwner: .player1, andAnimal: .wolf)
        
        board.grid[1][1].piece = piece

        let boardStatus = board.removePiece(atRow: 1, andColumn: 1)
        
        XCTAssertEqual(boardStatus, .ok)
        XCTAssertNil(board.grid[1][1].piece)
    }
    
    //Il faut juste faire des tests de performance maintenant
    
}
