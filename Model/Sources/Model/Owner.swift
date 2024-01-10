import Foundation

// Énumération Owner représentant les propriétaires, qui contiennent des identifiants "x", "1", et "2"
public enum Owner : CustomStringConvertible{
    
    public var description: String{
        switch self {
        case .noOne:
            return "x"
        case .player1:
            return "1"
        case .player2:
            return "2"
        }
    }
    
    case noOne
    case player1
    case player2
}
