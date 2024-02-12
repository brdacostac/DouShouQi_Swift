import Foundation
import Model

public struct MyFileManager {
    
    public static func getSaveDirectoryUrl() throws -> URL {
            // build base URL to save data to
            let documentsUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let baseUrl = documentsUrl.appendingPathComponent("Game")
            
            // check if the file at the url already exists
            if !FileManager.default.fileExists(atPath: baseUrl.absoluteString) {
                // if not create
                try FileManager.default.createDirectory(at: baseUrl, withIntermediateDirectories: true)
            }
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Game")
        }
    
}
