import XCTest
import Model

final class PlayerTest: XCTestCase {

    var player: Player!
    var board: Board!
    
    override func setUpWithError() throws {
        player = Player(withName: "Bruno", andId: .player1)
        
        let piece = Piece(withOwner: .player1, andAnimal: .rat)
        let cell1 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: piece)
        let cell2 = Cell(ofType: .jungle, ownedBy: .player1, withPiece: piece)
        
        board = Board(withGrid: [[cell1, cell1],[cell2, cell2]])
        
    }


    /// Test du initialiseur de la classe Player
    func testPlayerInitialiseur() {
        let player = Player(withName: "Bruno", andId: .player1)
        
        XCTAssertNotNil(player, "La création du joueur n'a pas marché")
        XCTAssertEqual(player?.name, "Bruno", "Le nom du joueur est incorrect !")
        XCTAssertEqual(player?.id, .player1, "L'ID du joueur est incorrect !")
    }

    /// Test de la methode chooseMove
    func testChooseMove() {
        let rules = VerySimpleRules()

        let move = player?.chooseMove(in: board, with: rules)
        XCTAssertNil(move, "On doit avoir nil")
    }
    
}
