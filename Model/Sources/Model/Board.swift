import Foundation

// Structure Board représentant un plateau du jeu avec des cellules
public struct Board : Hashable {
        
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
    
    public static func == (left: Board, right: Board) -> Bool {
        return left.nbRows == right.nbRows &&
        left.nbColumns == right.nbColumns &&
        left.grid == right.grid
    }
    
    public func hash(into hasher: inout Hasher) {
            hasher.combine(nbRows)
            hasher.combine(nbColumns)
            hasher.combine(grid)
        }
    
    // Ici "of" c'est pour entiquetter le parametre
    public func countPieces(of player : Owner ) -> Int {
        // flatMap transforme mon tableau de 2 dimensions en 1 seul dimension
        let grille = grid.flatMap { $0 }
        
        //On filtre pour guarder seulement les pieces du joueur passé en parametres
        // NbPieces maintenant est un tableau de 1 dimension que contient la liste de piece du player passé en parametre
        let nbPieces = grille.filter { $0.piece?.owner == player }
        
        return nbPieces.count
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
    public mutating func removePiece( atRow: Int, andColumn : Int) -> BoardResult{
        
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
