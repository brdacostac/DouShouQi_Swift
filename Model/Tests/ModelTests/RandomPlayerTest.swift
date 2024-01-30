import XCTest
import Model

final class RandomPlayerTests: XCTestCase {

    var player: RandomPlayer!
    
    override func setUp() {
        player = RandomPlayer(withName: "RandomPlayer", andId: .player1)
    }
    
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
        let rules = VerySimpleRules()
        let board = VerySimpleRules.createBoard()
        
        
        
        let move1 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 3)
        let move2 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 1)
        let move3 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 2, columnDestination: 2)
        let move4 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 0, columnDestination: 2)
        
        let movesExpected = [move1, move2, move3, move4]
        
        let randomMove = player.chooseMove(in: board, with: rules)!
        
        XCTAssertTrue(movesExpected.contains(randomMove))
    }
    
}
