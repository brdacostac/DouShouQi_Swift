import XCTest
import Model

final class ModelTests: XCTestCase {
    
    var board: Board!

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

    
}
