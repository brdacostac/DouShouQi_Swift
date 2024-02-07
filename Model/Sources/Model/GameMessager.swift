import Foundation

/// Structure de l'observateur qui gère l'affichage des messages
public struct GameMessenger: GameObserver {
    public init() {}
    
    /// Affiche le message de début de jeu
    public func gameStarts() {
        print("**************************************")
        print("          ==>> LE JEU COMMENCE ! <<==        ")
        print("**************************************")
    }
    
    /// Affiche le message indiquant le tour du prochain joueur
    ///
    /// - Parameter player: Le joueur dont c'est le tour
    public func nextPlayerTurn(player: Player) {
        print("**************************************")
        print("Joueur \(player.id) - \(player.name), c'est votre tour !")
        print("**************************************")
    }
    
    /// Affiche le message de fin de jeu avec le résultat
    ///
    /// - Parameter result: Le résultat de la partie
    public func gameOver(result: (Bool, Result)) {
        if result.0 {
            print("**************************************")
            print("Fin du jeu !!!")
            switch result.1 {
                case .winner(let winner, let reason):
                    print("Le gagnant est : \(winner) !")
                    switch reason {
                        case .denReached:
                            print("La tennaire de l'adversaire a été atteint.")
                        default:
                            print("La partie s'est terminée pour la raison suivante : \(reason)")
                    }
                default:
                    print("Fin du jeu avec le résultat : \(result.1)")
            }
            print("**************************************")
        } else {
            print("La partie n'est pas encore terminée !")
        }
    }
    
    /// Affiche le mouvement choisi par un joueur
    ///
    /// - Parameter move: Le mouvement choisi
    public func moveChosen(move: Move) {
        print("Mouvement choisi : \(move)")
    }
    
    /// Affiche un message indiquant qu'un mouvement invalide a été choisi
    public func invalidMove() {
        print("Mouvement invalide choisi, veuillez réessayer.")
    }
    
    /// Affiche un message indiquant que le plateau de jeu a changé
    ///
    /// - Parameter board: Le nouveau plateau de jeu
    public func boardChanged(board: Board) {
        print("Le plateau de jeu a changé :")
        print(board)
    }
}
