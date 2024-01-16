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
    
    //Function pour inserer une piece dans les cordonnées passés en parametres.
    public mutating func insertPiece(piece:Piece, atRow: Int, andColumn : Int) -> BoardResult{
        
        //On verifie que la ligne et la colonne ne sont pas negatives et sont inferieurs à la taille du board
        guard atRow < nbRows && andColumn < nbColumns && atRow >= 0 && andColumn >= 0 else {
            return .failed(reason: .outOfBounds)
        }
        
        //On verifie que la cellule est vide pour pouvoir inserer la piece
        guard grid[atRow][andColumn].piece == nil else {
            return .failed(reason: .cellNotEmpty)
        }
        
        //On insere la piece dans les cordonnées passés en parametres
        grid[atRow][andColumn].piece = piece
        return .ok
    }
    
    //Function pour supprimer une piece dans les cordonnées passés en parametres.
    public mutating func removePiece(piece:Piece, atRow: Int, andColumn : Int) -> BoardResult{
        
        //On verifie que la ligne et la colonne ne sont pas negatives et sont inferieurs à la taille du board
        guard atRow < nbRows && andColumn < nbColumns && atRow >= 0 && andColumn >= 0 else {
            return .failed(reason: .outOfBounds)
        }
        
        //On verifie que la cellule n'est pas vide pour pouvoir supprimer la piece
        guard grid[atRow][andColumn].piece != nil else {
            return .failed(reason: .cellEmpty)
        }
        
        //On insere la piece dans les cordonnées passés en parametres
        grid[atRow][andColumn].piece = nil
        return .ok
    }
}
