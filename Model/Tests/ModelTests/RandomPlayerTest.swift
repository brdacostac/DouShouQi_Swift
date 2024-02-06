import XCTest
import Model

final class RandomPlayerTests: XCTestCase {

    
    /// Test du initialiseur de la classe RandomPlayer
    func testInitializer() {
        let expectedId = Owner.player2
        let expectedName = "RandomPlayerBIS"
        
        if let player = RandomPlayer(withName: "RandomPlayerBIS", andId: .player2) {
            XCTAssertEqual(player.id, expectedId)
            XCTAssertEqual(player.name, expectedName)
        }
        
    }
    
    /// Tests chooseMove
    func testChooseMove() {
        // Initialisation des règles et du plateau de jeu
        let rules = VerySimpleRules()
        let grid: [[Cell]] = [
                    [Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .den), Cell(ofType: .jungle), Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .jungle, ownedBy: .player1 ,withPiece: Piece(withOwner: .player1, andAnimal: .rat)), Cell(ofType: .jungle), Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .jungle)],
                    [Cell(ofType: .jungle), Cell(ofType: .jungle), Cell(ofType: .den), Cell(ofType: .jungle), Cell(ofType: .jungle)]
                ]
        let board = Board(withGrid: grid)!

        
        // Création d'une instance de RandomPlayer
        let player = RandomPlayer(withName: "RandomPlayer", andId: .player1)!
        
        // Définition des mouvements attendus
        let move1 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 3)
        let move2 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 1)
        let move3 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 2, columnDestination: 2)
        let move4 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 0, columnDestination: 2)
        
        let movesExpected = [move1, move2, move3, move4]
        // Utilisation de la méthode chooseMove du joueur
        if let randomMove = player.chooseMove(in: board, with: rules) {
            // Vérification si le mouvement choisi est parmi les mouvements attendus
            XCTAssertTrue(movesExpected.contains(randomMove), "Le mouvement choisi n'est pas valide.")
        } else {
            XCTFail("Le mouvement choisi ne devrait pas être nul.")
        }
    }
    
}
