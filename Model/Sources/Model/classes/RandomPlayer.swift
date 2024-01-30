import Foundation

public class RandomPlayer : Player {
    
    /// Initialiseur du RandomPlayer
    ///
    /// - Parameters :
    ///    - name : Nom du joueur
    ///    - id : Id du joueur
    public override init?(withName name : String, andId id : Owner){
        super.init(withName: name, andId: id)
    }
    
    /// Function que permet de choisir un move par rapport à un plateau donné et des regles données
    ///
    /// - Parameters :
    ///    - board : Le plateau du jeu actuel
    ///    - rules : Les regles choisies pour le jeu
    /// - Returns : Le move choisi ou nil si pas de move choisi
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        // recuperer tout les mouvements posibles
        let possiblesMoves = rules.getMoves(board, id)
        
        //s'assurer qu'il existe des mouvements possibles
        guard possiblesMoves.isEmpty == false else{
            return nil
        }
        //Return un mouvement aleatoire parmi tout les mouvements possibles
        return possiblesMoves.randomElement()
    }
    
}
