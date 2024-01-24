import Foundation

public enum Result : Equatable{
    case notFinished
    case even
    case winner(Owner, WinningReason)
}
