import Foundation

/// Structure representant un mouvement dans le jeu
public struct Move : Equatable{
    public let owner: Owner
    public let rowOrigin: Int
    public let columnOrigin: Int
    public let rowDestination: Int
    public let columnDestination: Int
    
    
    /// Constructeur
    ///
    ///  - Parameters :
    ///     - owner : Le player actuel
    ///     - rowOrigin: La ligne de depart
    ///     - columnOrigin: La colonne de depart
    ///     - rowDestination: La ligne visé pour le mouvement
    ///     - ColumnDestination :La colonne visé pour le mouvement
    public init(owner: Owner, rowOrigin: Int, columnOrigin: Int, rowDestination: Int, columnDestination: Int) {
        self.owner = owner
        self.rowOrigin = rowOrigin
        self.columnOrigin = columnOrigin
        self.rowDestination = rowDestination
        self.columnDestination = columnDestination
    }
    
    public var description: String {
        return "\(owner) a joué dans la ligne \(rowOrigin) et colonne \(columnOrigin) pour aller à la ligne \(rowDestination) et colonne \(columnDestination)"
    }
}
