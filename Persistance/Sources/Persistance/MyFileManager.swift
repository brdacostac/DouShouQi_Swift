import Foundation
import Model

/// Structure pour charger et sauvegarder une Game
public struct MyFileManager {
    //Ça ira sauvegarder en documents
    static func getSaveDirectoryUrl() throws -> URL {
        let baseUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let directoryUrl = baseUrl.appendingPathComponent("SavedGames", isDirectory: true)
        if !FileManager.default.fileExists(atPath: directoryUrl.path) {
            try FileManager.default.createDirectory(at: directoryUrl, withIntermediateDirectories: true, attributes: nil)
        }
        return directoryUrl
    }
    
    // Sauvegarder le jeu
    @available(macOS 10.15, *)
    public static func saveGame(_ game: Game, withName name: String) async throws {
        let task = Task {
            do {
                let data = try JSONEncoder().encode(game)
                let saveUrl = try getSaveDirectoryUrl().appendingPathComponent(name).appendingPathExtension("json")
                try data.write(to: saveUrl)
            } catch {
                throw error
            }
        }
        _ = try await task.value
    }
    
    // Charger le jeu
    @available(macOS 10.15, *)
    public static func loadGame(withName name: String) async throws -> Game? {
        let task = Task<Game?, Error> {
            do {
                let saveUrl = try getSaveDirectoryUrl().appendingPathComponent(name).appendingPathExtension("json")
                guard let data = try? Data(contentsOf: saveUrl) else {
                    return nil
                }
                let game = try JSONDecoder().decode(Game.self, from: data)
                return game
            } catch {
                throw error
            }
        }
        return try await task.value
    }
}
