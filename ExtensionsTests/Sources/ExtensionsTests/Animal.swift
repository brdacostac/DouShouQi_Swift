import Foundation
import Model

//Extension de la classe Animal du Model pour l'affichage avec un emoji
public extension Model.Animal{
    var symbol: String{
        switch self{
        case .rat:
            return "🐭"
        case .cat:
            return "🐱"
        case .dog:
            return "🐶"
        case .wolf:
            return "🐺"
        case .leopard:
            return "🐆"
        case .tiger:
            return "🐯"
        case .lion:
            return "🦁"
        case .elephant:
            return "🐘"
        }
    }
}
