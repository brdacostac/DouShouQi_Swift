import Foundation
import Model
import ExtensionsTests
import Persistance

// Création des pièces des joueurs 1 et 2
let rat1: Piece = Piece(withOwner: .player1, andAnimal: .rat)
let rat2: Piece = Piece(withOwner: .player2, andAnimal: .rat)
let cat1: Piece = Piece(withOwner: .player1, andAnimal: .cat)
let cat2: Piece = Piece(withOwner: .player2, andAnimal: .cat)
let dog1: Piece = Piece(withOwner: .player1, andAnimal: .dog)
let dog2: Piece = Piece(withOwner: .player2, andAnimal: .dog)
let wolf1: Piece = Piece(withOwner: .player1, andAnimal: .wolf)
let wolf2: Piece = Piece(withOwner: .player2, andAnimal: .wolf)
let leopard1: Piece = Piece(withOwner: .player1, andAnimal: .leopard)
let leopard2: Piece = Piece(withOwner: .player2, andAnimal: .leopard)
let tiger1: Piece = Piece(withOwner: .player1, andAnimal: .tiger)
let tiger2: Piece = Piece(withOwner: .player2, andAnimal: .tiger)
let lion1: Piece = Piece(withOwner: .player1, andAnimal: .lion)
let lion2: Piece = Piece(withOwner: .player2, andAnimal: .lion)
let elephant1: Piece = Piece(withOwner: .player1, andAnimal: .elephant)
let elephant2: Piece = Piece(withOwner: .player2, andAnimal: .elephant)

// Création des cellules avec différents types
let jungleCell: Cell = Cell(ofType: .jungle)
let waterCell: Cell = Cell(ofType: .water)
let denCell: Cell = Cell(ofType: .den)
let trapCell: Cell = Cell(ofType: .trap)
let voidCell: Cell = Cell(ofType: .unknown)

// Création des cellules de départ pour chaque pièce
let rat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat1.owner, withPiece: rat1)
let rat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat2.owner, withPiece: rat2)
let cat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat1)
let cat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat2)
let dog1StartCell: Cell = Cell(ofType: .jungle, ownedBy: dog1.owner, withPiece: dog1)
let dog2StartCell: Cell = Cell(ofType: .jungle, ownedBy: dog2.owner, withPiece: dog2)
let wolf1StartCell: Cell = Cell(ofType: .jungle, ownedBy: wolf1.owner, withPiece: wolf1)
let wolf2StartCell: Cell = Cell(ofType: .jungle, ownedBy: wolf2.owner, withPiece: wolf2)
let leopard1StartCell: Cell = Cell(ofType: .jungle, ownedBy: leopard1.owner, withPiece: leopard1)
let leopard2StartCell: Cell = Cell(ofType: .jungle, ownedBy: leopard2.owner, withPiece: leopard2)
let tiger1StartCell: Cell = Cell(ofType: .jungle, ownedBy: tiger1.owner, withPiece: tiger1)
let tiger2StartCell: Cell = Cell(ofType: .jungle, ownedBy: tiger2.owner, withPiece: tiger2)
let lion1StartCell: Cell = Cell(ofType: .jungle, ownedBy: lion1.owner, withPiece: lion1)
let lion2StartCell: Cell = Cell(ofType: .jungle, ownedBy: lion2.owner, withPiece: lion2)
let elephant1StartCell: Cell = Cell(ofType: .jungle, ownedBy: elephant1.owner, withPiece: elephant1)
let elephant2StartCell: Cell = Cell(ofType: .jungle, ownedBy: elephant2.owner, withPiece: elephant2)

// Initialisation du plateau de jeu avec une configuration prédéfinie
var board: Board = Board(withGrid: [
    [lion1StartCell, jungleCell, trapCell, denCell, trapCell, jungleCell, tiger1StartCell],
    [jungleCell, dog1StartCell, jungleCell, trapCell, jungleCell, cat1StartCell, jungleCell],
    [rat1StartCell, jungleCell, leopard1StartCell, jungleCell, wolf1StartCell, jungleCell, elephant1StartCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [elephant2StartCell, jungleCell, wolf2StartCell, jungleCell, leopard2StartCell, jungleCell, rat2StartCell],
    [jungleCell, cat2StartCell, jungleCell, trapCell, jungleCell, dog2StartCell, jungleCell],
    [tiger2StartCell, jungleCell, trapCell, denCell, trapCell, jungleCell, lion2StartCell]
])!

//Decomentez pour avoir les tests en CLI sur le Model
/*
// Affichage du tableau dans le console
var test = board.description
print(test)


// Testes des methodes pour conter le nombre de pieces
let countPiecesP1 = board.countPieces(of: .player1)
let countPiecesP2 = board.countPieces(of: .player1)
let countPiecesPlayers = board.countPiecesTwoPlayers()

print("Nombre pieces P1 : ", countPiecesP1)
print("Nombre pieces P2 : ", countPiecesP2)
print("Nombre de pieces de P1 et P2 : ", countPiecesPlayers)

//Testes des methodes d'insertion et suppression pour bouger les pieces dans le board
let statusInsertion = board.insertPiece(piece: wolf1, atRow: 0, andColumn: 1)
print("Insertion : Piece Wolf du player 1 dans le board")
print("Insertion Status : " , statusInsertion)
print(board.description)

//Ici on veut tester si la valeur de nombre de pieces de P1 change aprés avoir inseré une nouvelle piece
let countPiecesP1ApresInsertion = board.countPieces(of: .player1)
print("Nombre pieces P1 aprés insertion : ", countPiecesP1ApresInsertion)

let statusSuppression = board.removePiece(atRow: 0, andColumn: 0)
print("Suppression : Piece Lion du player 1 dans le board")
print("Suppression Status : " , statusSuppression)
print(board.description)



// Testes VERIFY SIMPLE RULES

let simpleRules: VerySimpleRules = VerySimpleRules()
var initialBoard: Board = VerySimpleRules.createBoard()
print("Teste Creation Board - VerySimpleRules")
print(initialBoard.description)


print("VerySimpleRules : Board valide")

//Afficher le prochain jouer
var player: Owner = simpleRules.getNextPlayer()
print("Next Player :" ,player)

//Afficher les prochains couts d'un player
let nextMovesPlayer = simpleRules.getMoves(initialBoard, .player1)
print("Prochains coups du joueur 1 :")
print(nextMovesPlayer)

//Afficher les prochains couts d'un player à partir de la case 0,1
let nextMovesPlayerCase = simpleRules.getMoves(initialBoard, .player1, fromRow: 0, andColumn: 1)
print("Coups à realiser du joueur 1 à partir de la case 0,1 : ")
print(nextMovesPlayerCase)

//Vérification si la partie est fini
let gameOver: (Bool, Result) = simpleRules.isGameOver(initialBoard, lastMoveRow: 0, lastMoveColumn: 1)
print("Resultat de la partie: ", gameOver)



//TESTS PLAYER, HUMANPLAYER et RANDOMPLAYER

let rulesPlayer = VerySimpleRules()
var boardPlayer = VerySimpleRules.createBoard()

print(boardPlayer.description)
 */



//TESTS PLAYER, HUMANPLAYER et RANDOMPLAYER

//let rulesPlayer = VerySimpleRules()
//var boardPlayer = VerySimpleRules.createBoard()


//func userInput(humanPlayer : HumanPlayer) -> Move {
//    print("Entrer le mouvement:")
//    print("Ligne de depart:")
//    let fromRow = Int(readLine() ?? "") ?? 0
//
//    print("Colonne de depart:")
//    let fromColumn = Int(readLine() ?? "") ?? 0
//
//    print("Pour aller à la ligne:")
//    let toRow = Int(readLine() ?? "") ?? 0
//
//    print("Pour aller à la colonne:")
//    let toColumn = Int(readLine() ?? "") ?? 0
//
//    return Move(owner: humanPlayer.id, rowOrigin: fromRow, columnOrigin: fromColumn, rowDestination: toRow, columnDestination: toColumn)
//}
//
//if let player1 = HumanPlayer(withName: "Bruno", andId: .player1, andInputMethod: userInput) {
//    let move1 = player1.input(player1)
//    print(move1)
//
//    if let move1 = player1.chooseMove(in: board, with: rulesPlayer) {
//        print(move1)
//    }
//}

//if let bot = RandomPlayer(withName: "BotDoBrasil", andId: .player2) {
//    if let move2 = bot.chooseMove(in: board, with: rulesPlayer) {
//        print(move2)
//    } else {
//        print("Le random player n'a pas de moves valides")
//    }
//}


// - VARIABLES POUR LA BOUCLE -

//var rules = VerySimpleRules()
//var leBoard = VerySimpleRules.createBoard()
//
//print("starting board : ")
//print(leBoard.description)
//
//var lastRow: Int = 0
//var lastColumn: Int = 0
//
//var player1 = RandomPlayer(withName: "Bruno", andId: .player1)!
//var player2 = RandomPlayer(withName: "RandomBrazilian", andId: .player2)!
//
//var prochainJoueur: Owner
//var joueurActuel: Player = player1
//
//
//// - BOUCLE DU JEU -
//while(!rules.isGameOver(leBoard, lastMoveRow: lastRow, lastMoveColumn: lastColumn).0) {
//
//    // Obtenir le prochain joueur
//    prochainJoueur = rules.getNextPlayer()
//    joueurActuel = player1.id == prochainJoueur ? player1 : player2
//
//    var mouvementEstValide = false // Indicateur de validité du mouvement
//
//    // Boucler jusqu'à ce que le mouvement soit valide ou qu'il n'y ait plus de mouvements possibles
//    while mouvementEstValide == false {
//        // Choisir un mouvement
//        if let move = joueurActuel.chooseMove(in: leBoard, with: rules) {
//            // Un mouvement a été trouvé
//            print("un mouvement a été trouvé :  \(move)")
//
//            // Vérifier s'il est valide
//            do {
//                mouvementEstValide = try rules.isMoveValid(leBoard, move: move)
//
//                // Le mouvement est valide car aucune erreur n'a été détectée
//                print("mouvement valide : \(move)")
//
//                // Sauvegarder le plateau avant le mouvement
//                let plateauAvantMouvement = leBoard
//
//                // Jouer le mouvement
//                let ligneDestination = move.rowDestination
//                let colonneDestination = move.columnDestination
//                let ligneOrigine = move.rowOrigin
//                let colonneOrigine = move.columnOrigin
//
//                print("cell d'origine \(leBoard.grid[ligneOrigine][colonneOrigine])")
//                print("cell de destination \(leBoard.grid[ligneDestination][colonneDestination])")
//
//                // Vider la cellule de destination
//                if let _ = leBoard.grid[ligneDestination][colonneDestination].piece {
//                    // S'il y a une pièce, la retirer
//                    let resultatRetrait = leBoard.removePiece(atRow: ligneDestination, andColumn: colonneDestination)
//                    guard resultatRetrait == .ok else {
//                        print("échec du retrait de la pièce de la cellule de destination, raison: \(resultatRetrait)")
//                        print("ligne destination: \(ligneDestination)")
//                        print("colonne destination: \(colonneDestination) \n")
//
//                        break  // Arrêter le jeu
//                    }
//                }
//
//                // Insérer la pièce dans la nouvelle cellule
//                let pieceAMouvoir = leBoard.grid[ligneOrigine][colonneOrigine].piece! // Le mouvement est valide donc il y a forcément une pièce
//                let resultatInsertion = leBoard.insertPiece(piece: pieceAMouvoir, atRow: ligneDestination, andColumn: colonneDestination)
//                guard resultatInsertion == .ok else {
//                    print("échec de l'insertion de la pièce dans la cellule de destination, raison: \(resultatInsertion)")
//                    print("ligne destination: \(ligneDestination)")
//                    print("colonne destination: \(colonneDestination) \n")
//
//                    break // Arrêter le jeu
//                }
//
//                // Enlever la pièce de la cellule d'origine
//                let resultatRetrait = leBoard.removePiece(atRow: ligneOrigine, andColumn: colonneOrigine)
//                guard resultatRetrait == .ok else {
//                    print("échec du retrait de la pièce de la cellule d'origine, raison: \(resultatRetrait) \n")
//                    print("ligne origine: \(ligneOrigine)")
//                    print("colonne origine: \(colonneOrigine) \n")
//
//                    break // Arrêter le jeu
//                }
//
//                // Jouer fait son mouvement
//                rules.playedMove(move, fromBoard: plateauAvantMouvement, toBoard: leBoard)
//
//            } catch GameError.invalidMove {
//                print("Le mouvement choisi n'est pas valide, veuillez réessayer.")
//                continue
//            }
//        } else {
//            // Aucun mouvement trouvé, donc la partie est terminée sans mouvements restants
//            print("le mouvement était nul")
//        }
//
//        // Un mouvement a été joué
//        print("Nouveau Plateau")
//        print(leBoard.description)
//        print("\n")
//    }
//
//    print("tour suivant...")
//}
//
//print("PARTIE TERMINÉE")
//let result = rules.isGameOver(leBoard, lastMoveRow: lastRow, lastMoveColumn: lastColumn)
//print(result)

//
//
//func userInput(humanPlayer : HumanPlayer) -> Move {
//    print("Entrer le mouvement:")
//    print("Ligne de depart:")
//    let fromRow = Int(readLine() ?? "") ?? 0
//
//    print("Colonne de depart:")
//    let fromColumn = Int(readLine() ?? "") ?? 0
//
//    print("Pour aller à la ligne:")
//    let toRow = Int(readLine() ?? "") ?? 0
//
//    print("Pour aller à la colonne:")
//    let toColumn = Int(readLine() ?? "") ?? 0
//
//    return Move(owner: humanPlayer.id, rowOrigin: fromRow, columnOrigin: fromColumn, rowDestination: toRow, columnDestination: toColumn)
//}
//
//

//Decomentez pour avoir des tests en CLI sur les Players

//// Créez les règles du jeu, les joueurs et les observateurs
///
//let rules1 = VerySimpleRules()
////let player2 = HumanPlayer(withName: "Bruno", andId: .player2, andInputMethod: userInput)!
//let player1 = RandomPlayer(withName: "Player 1", andId: .player1)!
//let player2 = RandomPlayer(withName: "Player 2", andId: .player2)!
//let gameMessenger = GameMessenger()
//
//// Créez une instance de Game
//var game = Game(withRules: rules1, andPlayer1: player1, andPlayer2: player2)
//
//// Ajout des listener messanger
//game.addGameStartsListener(callBack: gameMessenger.gameStarts)
//game.addNextPlayerTurnListener(callBack: gameMessenger.nextPlayerTurn)
//game.addGameOverListener(callBack: gameMessenger.gameOver)
//game.addMoveChosenListener(callBack: gameMessenger.moveChosen)
//game.addInvalidMoveListener(callBack: gameMessenger.invalidMove)
//game.addBoardChangedListener(callBack: gameMessenger.boardChanged)
//// Démarrez le jeu
//do {
//    try game.start()
//} catch {
//    print("An error occurred while starting the game: \(error)")
//}


//PERSISTANCES TESTS

//Animal
var jsonEncoder = JSONEncoder()
var jsonDecoder = JSONDecoder()

//var animalTest : Animal = .elephant
//let animalTestEncode = try jsonEncoder.encode(animalTest.rawValue)
//print(animalTest.rawValue, "Test ENCODE")
//print(String(data: animalTestEncode, encoding: .utf8)!)
//
//let animalTestDecode = try jsonDecoder.decode(Animal.self, from: animalTestEncode)
//print(animalTestDecode, "Test DECODE")
//
////Board
//let boardTest : Board = VerySimpleRules.createBoard()
//let boardTestEncode = try jsonEncoder.encode(boardTest)
//if let boardTestEncodeString = String(data: boardTestEncode, encoding: .utf8){
//    print(boardTestEncodeString, "Test ENCODE")
//}
//let boardTestDecode = try jsonDecoder.decode(Board.self, from: boardTestEncode)
//print(boardTestDecode, "Test DECODE")
//
////Owner
//let owner = Owner.player1
//let ownerEncode = try jsonEncoder.encode(owner)
//if let ownerEncodeString = String(data: ownerEncode, encoding: .utf8){
//    print(ownerEncodeString, "Test ENCODE")
//}
//let ownerDecode = try jsonDecoder.decode(Owner.self, from: ownerEncode)
//print(ownerDecode.description, "Test DECODE")
//
////CellType
//let jungle = CellType.jungle
//let jungleEncode = try jsonEncoder.encode(jungle)
//if let jungleEncodeString = String(data: jungleEncode, encoding: .utf8){
//    print(jungleEncodeString, "Test ENCODE")
//}
//let jungleDecode = try jsonDecoder.decode(CellType.self, from: jungleEncode)
//print(jungleDecode, "Test DECODE")
//
////Cell
//let wolfStartCellTest : Cell = Cell(ofType: .jungle,ownedBy: rat1.owner, withPiece: rat1)
//let wolfStartCellTestEncode = try jsonEncoder.encode(wolfStartCellTest)
//if let wolfStartCellTestEncodeString = String(data: wolfStartCellTestEncode, encoding: .utf8){
//    print(wolfStartCellTestEncodeString, "Test ENCODE")
//}
//let wolfStartCellTestDecode = try jsonDecoder.decode(Cell.self, from: wolfStartCellTestEncode)
//print(wolfStartCellTestDecode, "Test DECODE")
//
////Piece
//let wolfPieceTest : Piece = Piece(withOwner: .player1, andAnimal: .wolf)
//let wolfPieceTestEncode = try jsonEncoder.encode(wolfPieceTest)
//if let wolfPieceTestEncodeString = String(data: wolfPieceTestEncode, encoding: .utf8){
//    print(wolfPieceTestEncodeString, "Test ENCODE")
//}
//let wolfPieceTestDecode = try jsonDecoder.decode(Piece.self, from: wolfPieceTestEncode)
//print(wolfPieceTestDecode , "Test DECODE")
//
////Move
//let moveTest : Move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 0)
//let moveTestEncode = try jsonEncoder.encode(moveTest)
//if let moveTestEncodeString = String(data: moveTestEncode, encoding: .utf8){
//    print(moveTestEncodeString , "Test ENCODE")
//}
//let moveTestDecode = try jsonDecoder.decode(Move.self, from: moveTestEncode)
//print(moveTestDecode, "Test DECODE")
//
//
////Rules et VerifySimpleRules
//
//let verySimpleRulesTest: VerySimpleRules = VerySimpleRules()
//let rulesData = RulesData(occurrences: verySimpleRulesTest.occurrences, historic: verySimpleRulesTest.historic, rulesType: "VerySimpleRules")
//let rulesDataEncode = try jsonEncoder.encode(rulesData)
//if let rulesDataEncodeString = String(data: rulesDataEncode, encoding: .utf8){
//    print(rulesDataEncodeString, "Test ENCODE")
//}
//let rulesDataDecode = try jsonDecoder.decode(RulesData.self, from: rulesDataEncode)
//let rulesDecode = verySimpleRulesTest.decodeRules(rulesData: rulesDataDecode)
//print(rulesDecode, "Test DECODE")
//
//
////RandomPlayer
//let randomPlayerTest: RandomPlayer = RandomPlayer(withName: "BotRandom", andId: .player1)!
//let playerDataRandom = PlayerData(id: randomPlayerTest.id, name: randomPlayerTest.name, playerType: "RandomPlayer")
//let playerDataRandomEncode = try jsonEncoder.encode(playerDataRandom)
//if let playerDataRandomEncodeString = String(data: playerDataRandomEncode, encoding: .utf8){
//    print(playerDataRandomEncodeString, "Test ENCODE")
//}
//let playerDataRandomDecode = try jsonDecoder.decode(PlayerData.self, from: playerDataRandomEncode)
//let playerRandomDecode = randomPlayerTest.decodePlayer(playerData: playerDataRandomDecode)
//print(playerRandomDecode, "Test DECODE")
//
//
//// HumanPlayer
//let humanPlayerTest: HumanPlayer = HumanPlayer(withName: "Human", andId: .player1, andInputMethod: { _ in return Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 0) })!
//let playerDataHuman = PlayerData(id: humanPlayerTest.id, name: humanPlayerTest.name, playerType: "HumanPlayer")
//let playerDataHumanEncode = try jsonEncoder.encode(playerDataHuman)
//if let playerDataHumanEncodeString = String(data: playerDataHumanEncode, encoding: .utf8){
//    print(playerDataHumanEncodeString, "Test ENCODE")
//}
//let playerDataHumanDecode = try jsonDecoder.decode(PlayerData.self, from: playerDataHumanEncode)
//let playerHumanDecode = humanPlayerTest.decodePlayer(playerData: playerDataHumanDecode)
//print(playerHumanDecode, "Test DECODE")






// Game jouer une partie enregistrée
let rules = VerySimpleRules()
let player1 = RandomPlayer(withName: "Player 1", andId: .player1)!
let player2 = RandomPlayer(withName: "Player 2", andId: .player2)!

var game1 = Game(withRules: rules, andPlayer1: player1, andPlayer2: player2)
let gameMessenger = GameMessenger()

// Définissez une fonction de sauvegarde de jeu
func saveGameCallback(game: Game) async {
    do {
        try await MyFileManager.saveGame(game, withName: "saved_game")
    } catch {
        print("Error saving game: \(error)")
    }
}

// Ajoutez la fonction de sauvegarde en tant qu'observateur de sauvegarde de jeu
game1.gameSavedListener(callBack: saveGameCallback)
// Ajout des listener messanger
game1.addGameStartsListener(callBack: gameMessenger.gameStarts)
game1.addNextPlayerTurnListener(callBack: gameMessenger.nextPlayerTurn)
game1.addGameOverListener(callBack: gameMessenger.gameOver)
game1.addMoveChosenListener(callBack: gameMessenger.moveChosen)
game1.addInvalidMoveListener(callBack: gameMessenger.invalidMove)
game1.addBoardChangedListener(callBack: gameMessenger.boardChanged)

// Lancez le jeu
do {
    try game1.start()
} catch {
    print("An error occurred while starting the game: \(error)")
}

 //Chargement du jeu
do {
    if let loadedGame = try await MyFileManager.loadGame(withName: "saved_game") {
        // Utilisation du jeu chargé
        print("Game a bien reussi à charger: \(loadedGame.board)")
    } else {
        print("Fail pour charger le jeu")
    }
} catch {
    print("Fail pour charger le jeu: \(error)")
}













