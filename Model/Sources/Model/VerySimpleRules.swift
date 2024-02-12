import Foundation

/// Struct VerySimpleRules
public struct VerySimpleRules: Rules {
    
    public var occurrences: [Board:Int] = [:]
    public var historic: [Move] = []
    
    
    ///Constructor
    public init() {
        
    }
    
    ///Methode pour initialiser le board avec 5 lignes et 5 colonnes
    ///
    /// - Returns : Un nouveau board du jeu
    public static func createBoard() -> Board {
        let jungleEmptyCell: Cell = Cell(ofType: .jungle)
        let denCell1: Cell = Cell(ofType: .den, ownedBy: .player1)
        let denCell2: Cell = Cell(ofType: .den, ownedBy: .player2)

        let rat1: Piece = Piece(withOwner: .player1, andAnimal: .rat)
        let rat2: Piece = Piece(withOwner: .player2, andAnimal: .rat)
        let cat1: Piece = Piece(withOwner: .player1, andAnimal: .cat)
        let cat2: Piece = Piece(withOwner: .player2, andAnimal: .cat)
        let tiger1: Piece = Piece(withOwner: .player1, andAnimal: .tiger)
        let tiger2: Piece = Piece(withOwner: .player2, andAnimal: .tiger)
        let lion1: Piece = Piece(withOwner: .player1, andAnimal: .lion)
        let lion2: Piece = Piece(withOwner: .player2, andAnimal: .lion)
        let elephant1: Piece = Piece(withOwner: .player1, andAnimal: .elephant)
        let elephant2: Piece = Piece(withOwner: .player2, andAnimal: .elephant)
        
        let rat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat1.owner, withPiece: rat1)
        let rat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: rat2.owner, withPiece: rat2)
        let cat1StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat1)
        let cat2StartCell: Cell = Cell(ofType: .jungle, ownedBy: cat1.owner, withPiece: cat2)
        let tiger1StartCell: Cell = Cell(ofType: .jungle, ownedBy: tiger1.owner, withPiece: tiger1)
        let tiger2StartCell: Cell = Cell(ofType: .jungle, ownedBy: tiger2.owner, withPiece: tiger2)
        let lion1StartCell: Cell = Cell(ofType: .jungle, ownedBy: lion1.owner, withPiece: lion1)
        let lion2StartCell: Cell = Cell(ofType: .jungle, ownedBy: lion2.owner, withPiece: lion2)
        let elephant1StartCell: Cell = Cell(ofType: .jungle, ownedBy: elephant1.owner, withPiece: elephant1)
        let elephant2StartCell: Cell = Cell(ofType: .jungle, ownedBy: elephant2.owner, withPiece: elephant2)
        
        
        let board: Board = Board(withGrid: [
            [jungleEmptyCell, lion1StartCell, denCell1, tiger1StartCell, jungleEmptyCell],
            [rat1StartCell, jungleEmptyCell, cat1StartCell, jungleEmptyCell, elephant1StartCell],
            [jungleEmptyCell, jungleEmptyCell, jungleEmptyCell, jungleEmptyCell, jungleEmptyCell],
            [elephant2StartCell, jungleEmptyCell, cat2StartCell, jungleEmptyCell, rat2StartCell],
            [jungleEmptyCell, tiger2StartCell, denCell2, lion2StartCell, jungleEmptyCell],
        ])!;
        
        return board
        
    }
    
    ///Methode qui retourne le prochain joueur à jouer
    ///
    /// - Returns : Le player que doit jouer
    public func getNextPlayer() -> Owner {
        
        if self.historic.last?.owner == .player1{
            return .player2
        }
        else {
            return .player1
        }
    }

    ///Methode pour recuperer les moves autorisés par 1 joueur dans le board
    ///
    /// - Parameters:
    ///  - board : Le plateau du jeu actuel
    ///  - player : Le player actuel
    public func getMoves(_ board: Board, _ player: Owner) -> [Move] {
        var availableMoves: [Move] = []
        
        for r in 0..<board.nbRows {
            for c in 0..<board.nbColumns {
                // Si la case contient une pièce du joueur actuel
                if let piece = board.grid[r][c].piece, piece.owner == player {
                    // Recuperer les moves valides d'un jouer pour un board donné, dans une cell.
                    let pieceMoves = getMoves(board, player, fromRow: r, andColumn: c)
                    availableMoves.append(contentsOf: pieceMoves)
                }
            }
        }

        return availableMoves
    }


    ///Methode pour recuperer les moves autorisés par 1 joueur à partir d'une case donné
    ///
    /// - Parameters
    ///    - board : Le plateau du jeu actuel
    ///    - player : Le player actuel
    ///    - row : La ligne de départ
    ///    - column : La colonne de depart
    /// - Returns : La liste de mouvements autorisés
    public func getMoves(_ board: Board, _ player: Owner, fromRow row: Int, andColumn column: Int) -> [Move] {
        var availableMoves: [Move] = []
            
        let possibleDirections: [(Int, Int)] = [
            (0, 1), // Droit
            (0, -1), // Gauche
            (1, 0), // Haut
            (-1, 0) // Bas
        ]
        
        for direction in possibleDirections {
            let newRow = row + direction.0
            let newColumn = column + direction.1
            
            do{
                // Si la methode isMoveValid return true alors on ajoute le move dans la liste
                if try isMoveValid(board, fromRow: row, fromColumn: column, toRow: newRow, toColumn: newColumn) {
                    let move = Move(owner: player, rowOrigin: row, columnOrigin: column, rowDestination: newRow, columnDestination: newColumn)
                    availableMoves.append(move)
                }
            }catch{
                
            }
        }
        
        return availableMoves
    }
    
    ///Methode pour verifier si un mouvement d'une piece est valide
    ///
    /// - Parameters
    ///  - board : Le plateau actuel
    ///  - fromRow: La ligne de depart du move actuel
    ///  - fromColumn: La colone de depart du move actuel
    ///  - toRow : La ligne aprés le mouvement efectué
    ///  - toColumn : La colone aprés le mouvement efectué
    /// - Returns : 'true' si le movement est valide ou 'false' sinon
    public func isMoveValid(_ board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) throws -> Bool {
        // Verifier les nbRows et le nbColumns
        guard fromRow >= 0 && fromRow < board.nbRows && fromColumn >= 0 && fromColumn < board.nbColumns &&
              toRow >= 0 && toRow < board.nbRows && toColumn >= 0 && toColumn < board.nbColumns else {
            throw GameError.invalidMove
        }
        
        
        // Ici on va verifier si la cell contient une piece
        let startingCell = board.grid[fromRow][fromColumn]
        guard let startingPiece = startingCell.piece else {
            throw GameError.invalidMove
        }
        
        let destinationCell = board.grid[toRow][toColumn]
        if let destinationPiece = destinationCell.piece {
            
            // Ici on va check si le player essaye de manger sa propre piece ou si l'animal attacant est plus faible que l'animal cible
            if destinationPiece.owner == startingPiece.owner || startingPiece.animal.rawValue < destinationPiece.animal.rawValue {
                throw GameError.animalStronger
            }
        }
        
        // On verifie qu'on ne peut pas faire un mouvement en diagonal et aussi que la piece à bougé
        guard (abs(toRow - fromRow) == 1 && toColumn == fromColumn) || (toRow == fromRow && abs(toColumn - fromColumn) == 1) && abs(toRow - fromRow) + abs(toColumn - fromColumn) != 2 && abs(toRow - fromRow) + abs(toColumn - fromColumn) != 0 else {
            throw GameError.diagonalMove
        }
        
        


        return true
    }
    
    ///Methode pour verifier si un mouvement spécifique d'une piece est valide sur un board donné
    ///
    /// - Parameters
    ///  - board : Le plateau actuel
    ///  - move : Le mouvement à verifier
    /// - Returns : 'true' si le movement est valide ou 'false' sinon
    public func isMoveValid(_ board: Board, move: Move) throws -> Bool {
        //on utilise la méthode en haut
        return try isMoveValid(board, fromRow: move.rowOrigin, fromColumn: move.columnOrigin, toRow: move.rowDestination, toColumn: move.columnDestination)
    }
    
    ///Methode pour verifier si le jeu a fini utiliser les parametized labels
    ///
    /// - Parameters
    ///  - board : Le plateau actuel
    ///  - lastMoveRow : La ligne du dernier mouvement
    ///  - lastMoveColumn: La colone du dernier mouvement
    /// - Returns : un tuble avec un boolean pour savoir si la partie est fini et le resultat de la partie
    public func isGameOver(_ board: Board, lastMoveRow: Int, lastMoveColumn: Int) -> (Bool, Result) {
        let currentPlayer = getNextPlayer()
        let opponent = (currentPlayer == .player1) ? Owner.player2 : Owner.player1
        
        
        let lastMoveCell = board.grid[lastMoveRow][lastMoveColumn]
        
        //Ici on verifie si un joueur a reussi à arriver dans la tanniere de son adversaire
        if (lastMoveCell.cellType == .den && lastMoveCell.initialOwner != opponent) {
            if (lastMoveCell.piece?.owner == opponent){
                return (true, .winner(opponent, .denReached))
            }
        }
        
        //Ici on va verifier si un des joueurs a mangé tout les pieces de son adversaire
        let (player1Pieces, player2Pieces) = board.countPiecesTwoPlayers()
        
        if player1Pieces == 0 && player2Pieces == 0 {
            return (true, .winner(.player1, .noMorePieces))  // Les deux joueurs n'ont plus de pièces
        } else if player1Pieces == 0 {
            return (true, .winner(.player2, .noMorePieces))  // Le joueur 1 n'a plus de pièces
        } else if player2Pieces == 0 {
            return (true, .winner(.player1, .noMorePieces))  // Le joueur 2 n'a plus de pièces
        }

        //Ici on va verifier si l'adversaire est coincé
        let availableMoves = getMoves(board, opponent)

        if availableMoves.isEmpty {
            return (true, .winner(opponent, .noMovesLeft))  // L'adversaire n'a plus de coups valides
        } else {
            return (false, .notFinished)  // L'adversaire a encore des coups valides
        }

    }
    
    ///Méthode qui va stocker les coups réalisés
    /// - Parameters :
    ///  - move : Le mouvement actuel
    ///  - board: Le tableau actuel
    ///  - toBoard : Le tableau aprés le mouvement effectué
    public mutating func playedMove(_ move: Move, fromBoard: Board, toBoard: Board) {
        //Ajouter le coup dans l'historique
        historic.append(move)
        
    }
    
    /// Méthode qui va verifier si le board du jeu est valide
    ///
    ///  - Parameters :
    ///    - board : Le board a verifier
    ///  - Returns: Un erreur d'invalidité si jamais il en a, sinon on va returner 'true'
    public static func checkBoard(_ board: Board) throws -> Bool {
        let expectedRows = 5
        let expectedColumns = 5
        
        //Le nombre de lignes et de colonnes
        guard board.nbRows == expectedRows && board.nbColumns == expectedColumns else {
            throw InvalidBoardError.badDimensions(board.nbRows, board.nbColumns)
        }
        
        
        //vérifier l'emplacement de la den du joueur 1 sur le board
        guard board.grid[0][2].cellType == CellType.den else {
            throw InvalidBoardError.badCellType(.den, 0, 2)
        }
        
        //vérifier l'emplacement de la den du joueur 2 sur le board
        guard board.grid[4][2].cellType == CellType.den else {
            throw InvalidBoardError.badCellType(.den, 4, 2)
        }
        
        var piecesNumber: [Piece:Int] = [:]
        
        //vérifier chaque emplacement du board
        for row in 0..<board.grid.count {
            for column in 0..<board.grid[row].count {
                let cell = board.grid[row][column]
                
                //vérifier que pour chaque emplacement du board on a pas type water
                if cell.cellType == .water {
                    throw InvalidBoardError.badCellType(.water, row, column)
                }
                //vérifier que pour chaque emplacement du board on a pas type trap
                if cell.cellType == .trap {
                    throw InvalidBoardError.badCellType(.trap, row, column)
                }
                
                if let piece = cell.piece {
                    
                    //vérifier qu'il n'y a pas multiple ocurrences de la même piece
                    piecesNumber[piece,default: 0] += 1
                    
                    guard piecesNumber[piece]! <= 1 else {
                        throw InvalidBoardError.multipleOccurencesOfSamePiece(piece)
                    }
                    
                    //vérifier que chaque piece contient un player
                    guard piece.owner != .noOne else{
                        throw InvalidBoardError.pieceWithNoOwner(piece)
                    }
                }
            }
        }
        
        
        // vérifier le nombre de pièces de chaque joueur
        let player1Pieces = board.countPieces(of: .player1)
        let player2Pieces = board.countPieces(of: .player2)
        
        guard player1Pieces == 5 && player2Pieces == 5 else {
            throw InvalidBoardError.numberOfPiece(piecesPlayer1: player1Pieces, piecesPlayer2: player2Pieces)
        }
        
        
        return true
    }

}

