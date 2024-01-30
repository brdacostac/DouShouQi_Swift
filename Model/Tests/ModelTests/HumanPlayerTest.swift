import XCTest
import Model

final class HumanPlayerTest: XCTestCase {

    var board: Board!
    
    override func setUpWithError() throws {
        
        let piece = Piece(withOwner: .player1, andAnimal: .rat)
        let cell1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: piece)
        let cell2 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: piece)
        
        board = Board(withGrid: [[cell1, cell1],[cell2, cell2]])
        
    }


    /// Test du initialiseur de la classe Player
    func testPlayerInitialiseur() {
        let player = HumanPlayer(withName: "Bruno", andId: .player1, andInputMethod: { _ in Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1) })
        
        XCTAssertNotNil(player, "La création du joueur n'a pas marché")
        XCTAssertEqual(player?.name, "Bruno", "Le nom du joueur est incorrect !")
        XCTAssertEqual(player?.id, .player1, "L'ID du joueur est incorrect !")
    }

    /// Test de la methode chooseMove
    func testChooseMove() {
        let rules = VerySimpleRules()
        
        // Initialisation d'un board de base
        let board = VerySimpleRules.createBoard()
        
        let player = HumanPlayer(withName: "Bruno", andId: .player1, andInputMethod: { _ in Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1) })

        let move = player?.chooseMove(in: board, with: rules)
        XCTAssertNotNil(move, "On doit pas avoir nil")
        XCTAssertEqual(move, Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1))
    }

    
}
