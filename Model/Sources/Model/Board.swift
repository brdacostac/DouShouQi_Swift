import Foundation

// Structure Board représentant un plateau du jeu avec des cellules
public struct Board {
    public let nbRows: Int
    public let nbColumns: Int
    public private(set) var grid: [[Cell]]
    
    public init? (withGrid: [[Cell]]) {
        
        //Verifier si ce tableau contient des lignes
        guard withGrid.count > 0
        else {
            return nil // Retourner nil si aucune ligne n'est présente
        }

        let columns = withGrid[0].count
        
        //Verifier si ce tableau contient des colonnes
        guard columns > 0
        else {
            return nil // Retourner nil si aucune colonne n'est présente
        }
        
        //Verifier que tout les lignes contiennet le même nombre de colonnes que la case 0
        guard withGrid.allSatisfy({ $0.count == columns }) else {
            return nil // Retourner nil si une ligne a une taille différente
        }
        
        
        
        self.nbRows = withGrid.count
        self.nbColumns = columns
        self.grid = withGrid
    }
    
    // Ici "of" c'est pour entiquetter le parametre, donc si on va appeler cette methode aprés il donner le valeur de "of" dans l'appel
    public func countPieces(of player : Owner ) -> Int {
        var count = 0
        
        for row in grid {
            for cell in row {
                if let pieceOwner = cell.piece?.owner, pieceOwner == player {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    // Méthode pour compter le nombre de pièces des deux joueurs
    public func countPiecesTwoPlayers() -> (player1Count: Int, player2Count: Int) {
        let player1NbPieces = countPieces(of: .player1)
        let player2NbPieces = countPieces(of: .player2)
        
        //On return le tuple
        return (player1NbPieces, player2NbPieces)
    }
    
        
}
