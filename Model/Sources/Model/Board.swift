import Foundation

// Structure Board représentant un plateau du jeu avec des cellules
public struct Board {
    public let nbRows: Int
    public let nbColumns: Int
    private(set) var grid: [[Cell]]
    
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
        for ligne in withGrid {
            guard ligne.count == columns
            else {
                return nil // Retourner nil si une ligne a une taille différente
            }
        }
        
        self.nbRows = withGrid.count
        self.nbColumns = columns
        self.grid = withGrid
    }
}
