import Foundation

public enum BoardResult {
    case unknow
    case ok
    case failed (reason : BoardFaillingReason)
}
