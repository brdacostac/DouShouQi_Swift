import Foundation
import Model
import ExtensionsTests

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

let jungleCell: Cell = Cell(ofType: .jungle)
let waterCell: Cell = Cell(ofType: .water)
let denCell: Cell = Cell(ofType: .den)
let trapCell: Cell = Cell(ofType: .trap)
let voidCell: Cell = Cell(ofType: .unknown)

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

let board: Board = Board(withGrid: [
    [lion1StartCell, trapCell, trapCell, denCell, trapCell, jungleCell, lion1StartCell],
    [jungleCell, dog1StartCell, jungleCell, trapCell, jungleCell, cat1StartCell, jungleCell],
    [rat1StartCell, jungleCell, leopard1StartCell, jungleCell, wolf1StartCell, jungleCell, elephant1StartCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [jungleCell, waterCell, waterCell, jungleCell, waterCell, waterCell, jungleCell],
    [elephant2StartCell, jungleCell, wolf2StartCell, jungleCell, leopard2StartCell, jungleCell, rat2StartCell],
    [jungleCell, cat2StartCell, jungleCell, trapCell, jungleCell, dog2StartCell, jungleCell],
    [lion2StartCell, jungleCell, trapCell, denCell, trapCell, jungleCell, lion2StartCell]
])!


var test = board.description
print(test)
