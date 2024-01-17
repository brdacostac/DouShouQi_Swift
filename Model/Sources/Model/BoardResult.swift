import Foundation

public enum BoardResult: Equatable {
    case unknow
    case ok
    case failed (reason : BoardFaillingReason)
}
