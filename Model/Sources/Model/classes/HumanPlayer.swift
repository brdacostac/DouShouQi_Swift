import Foundation

/// A human player in the game.
public class HumanPlayer: Player {
    
    public let input: (HumanPlayer) -> Move
    
    /// Initialiseur du HumanPlayer
    ///
    /// - Parameters :
    ///    - name : Nom du joueur
    ///    - id : Id du joueur
    ///   - inputMethod: La methode input pour un player
    public init?(withName name : String, andId id : Owner, andInputMethod input: @escaping (HumanPlayer) -> Move) {
        self.input = input
        super.init(withName: name, andId: id)
    }
    
    /// Function que permet de choisir un move par rapport à un plateau donné et des regles données
    ///
    /// - Parameters :
    ///    - board : Le plateau du jeu actuel
    ///    - rules : Les regles choisies pour le jeu
    /// - Returns : Le move choisi ou nil si pas de move choisi
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        return input(self)
    }
}
