import Foundation

/// Classe qui represente un joueur
public class Player {
    
    public let id: Owner
    public let name : String
    
    
    /// Initialiseur du player
    ///
    /// - Parameters :
    ///    - name : Nom du joueur
    ///    - id : Id du joueur
    public init?(withName name : String, andId id : Owner){
        guard (id == .player1 || id == .player2) else {
            return nil
        }
        self.id = id
        self.name = name
    }
    
    
    /// Function que permet de choisir un move par rapport à un plateau donné et des regles données
    ///
    /// - Parameters :
    ///    - board : Le plateau du jeu actuel
    ///    - rules : Les regles choisies pour le jeu
    /// - Returns : Le move choisi ou nil si pas de move choisi
    public func chooseMove(in board: Board, with rules: Rules) -> Move? {
        return nil
    }
}
