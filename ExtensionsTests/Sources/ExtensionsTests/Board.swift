import Foundation
import Model


//Extension de la classe Board du Model pour l'affichage avec des emojis pour mieux visualiser
extension Model.Board : CustomStringConvertible{
    
    public var description: String {
        var variable : String = " "
        for r in 0..<self.grid.count{
            variable += "\n"
            for c in 0..<self.grid[r].count{
                variable += "\(self.grid[r][c].cellType) \(self.grid[r][c].piece?.animal) \(self.grid[r][c].initialOwner)"
            }
        }
        return variable
    }
}
