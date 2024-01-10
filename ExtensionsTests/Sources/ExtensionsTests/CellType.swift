import Foundation
import Model

//Extension de la classe CellType du Model pour l'affichage avec un emoji
public extension Model.CellType{
    var symbol: String{
        switch self{
        case .jungle:
            return "🌿"
        case .water:
            return "💧"
        case .trap:
            return "🪤"
        case .den:
            return "🪹"
        case .unknown:
            return " "
        }
    }
}
