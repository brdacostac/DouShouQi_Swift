import Foundation
import Model


//Extension de la classe Board du Model pour l'affichage avec des emojis pour mieux visualiser
extension Model.Board : CustomStringConvertible{
    
    public var description: String {
        var variable : String = " "
        for r in 0..<grid.count{
            variable += "\n"
            for c in 0..<grid[r].count{
                variable += "\(grid[r][c].cellType.symbol) \(grid[r][c].piece?.animal.symbol ?? "   ") \(grid[r][c].initialOwner.symbol)"
            }
        }
        return variable
    }
}
