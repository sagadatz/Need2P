import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cell", "mineCounter", "timer", "resetButton", "winMessage", "loseMessage"]

  connect() {
    console.log("Minesweeper controller connected!")
    this.boardSize = 8
    this.mineCount = 8
    this.resetGame()
  }

  resetGame() {
    console.log("Resetting game...")
    this.gameOver = false
    this.firstClick = true
    this.flagCount = 0
    this.uncoveredCount = 0

    // Reset all cells
    this.cellTargets.forEach(cell => {
      cell.className = "cell covered"
      cell.textContent = ""
    })

    // Initialize empty board
    this.board = Array(this.boardSize).fill().map(() =>
      Array(this.boardSize).fill().map(() => ({
        isMine: false,
        neighborMines: 0,
        isUncovered: false,
        isFlagged: false
      }))
    )

    // Update UI
    if (this.hasResetButtonTarget) {
      this.resetButtonTarget.textContent = "😊"
    }
    if (this.hasWinMessageTarget) {
      this.winMessageTarget.classList.add("d-none")
    }
    if (this.hasLoseMessageTarget) {
      this.loseMessageTarget.classList.add("d-none")
    }
    this.updateMineCounter()
  }

  handleClick(event) {
    event.preventDefault()
    console.log("Cell clicked!")
    if (this.gameOver) return

    const cell = event.currentTarget
    const row = parseInt(cell.dataset.row)
    const col = parseInt(cell.dataset.col)

    if (this.board[row][col].isFlagged) return

    if (this.firstClick) {
      this.firstClick = false
      this.placeMines(row, col)
      this.calculateNeighborMines()
    }

    this.uncoverCell(row, col)
  }

  handleRightClick(event) {
    event.preventDefault()
    console.log("Right click!")
    if (this.gameOver || this.firstClick) return

    const cell = event.currentTarget
    const row = parseInt(cell.dataset.row)
    const col = parseInt(cell.dataset.col)

    if (!this.board[row][col].isUncovered) {
      this.toggleFlag(row, col)
    }
  }

  placeMines(firstRow, firstCol) {
    let minesPlaced = 0
    while (minesPlaced < this.mineCount) {
      const row = Math.floor(Math.random() * this.boardSize)
      const col = Math.floor(Math.random() * this.boardSize)

      if ((row !== firstRow || col !== firstCol) && !this.board[row][col].isMine) {
        this.board[row][col].isMine = true
        minesPlaced++
      }
    }
  }

  calculateNeighborMines() {
    for (let row = 0; row < this.boardSize; row++) {
      for (let col = 0; col < this.boardSize; col++) {
        if (!this.board[row][col].isMine) {
          let count = 0
          for (let r = -1; r <= 1; r++) {
            for (let c = -1; c <= 1; c++) {
              const newRow = row + r
              const newCol = col + c
              if (this.isValidCell(newRow, newCol) && this.board[newRow][newCol].isMine) {
                count++
              }
            }
          }
          this.board[row][col].neighborMines = count
        }
      }
    }
  }

  uncoverCell(row, col) {
    if (!this.isValidCell(row, col) ||
        this.board[row][col].isUncovered ||
        this.board[row][col].isFlagged) return

    const cell = this.cellTargets.find(
      cell => parseInt(cell.dataset.row) === row && parseInt(cell.dataset.col) === col
    )

    this.board[row][col].isUncovered = true
    cell.classList.remove("covered")
    cell.classList.add("uncovered")

    if (this.board[row][col].isMine) {
      cell.classList.add("mine")
      this.gameOver = true
      this.loseMessageTarget.classList.remove("d-none")
      this.revealAllMines()
      return
    }

    const neighborMines = this.board[row][col].neighborMines
    if (neighborMines > 0) {
      cell.textContent = neighborMines
      cell.classList.add(`number-${neighborMines}`)
    } else {
      // Recursively uncover neighbors for cells with no adjacent mines
      for (let r = -1; r <= 1; r++) {
        for (let c = -1; c <= 1; c++) {
          this.uncoverCell(row + r, col + c)
        }
      }
    }
  }

  toggleFlag(row, col) {
    const cell = this.cellTargets.find(
      cell => parseInt(cell.dataset.row) === row && parseInt(cell.dataset.col) === col
    )

    if (this.board[row][col].isFlagged) {
      this.board[row][col].isFlagged = false
      cell.classList.remove("flagged")
      this.flagCount--
    } else if (this.flagCount < this.mineCount) {
      this.board[row][col].isFlagged = true
      cell.classList.add("flagged")
      this.flagCount++
    }
    this.updateMineCounter()
  }

  revealAllMines() {
    for (let row = 0; row < this.boardSize; row++) {
      for (let col = 0; col < this.boardSize; col++) {
        if (this.board[row][col].isMine) {
          const cell = this.cellTargets.find(
            cell => parseInt(cell.dataset.row) === row && parseInt(cell.dataset.col) === col
          )
          cell.classList.remove("covered")
          cell.classList.add("uncovered", "mine")
        }
      }
    }
  }

  updateMineCounter() {
    if (this.hasMineCounterTarget) {
      this.mineCounterTarget.querySelector("span").textContent = this.mineCount - this.flagCount
    }
  }

  isValidCell(row, col) {
    return row >= 0 && row < this.boardSize && col >= 0 && col < this.boardSize
  }
}
