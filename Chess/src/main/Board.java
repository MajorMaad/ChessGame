package main;
import agent.Move;
import agent.Player;
import piece.Bishop;
import piece.King;
import piece.Knight;
import piece.Pawn;
import piece.Piece;
import piece.Queen;
import piece.Rook;

public class Board {
	private Spot[][] grid;
	public static final int SIZE = 8; // size of board

	public Board() {
		grid = new Spot[SIZE][SIZE];
		for (int i = 0; i < SIZE; i++) {
			for (int j = 0; j < SIZE; j++) {
				grid[j][i] = new Spot(j, i);
				grid[j][i].setOccupied(false);
			}
		}
	}

	public void setupChessBoard() {

		for (int x = 0; x < SIZE; x++) {
			grid[x][1].setPiece(new Pawn(Player.WHITE));
			grid[x][6].setPiece(new Pawn(Player.BLACK));
		}
		for (int x = 2; x < 8; x += 3) {
			grid[x][0].setPiece(new Bishop(Player.WHITE));
			grid[x][7].setPiece(new Bishop(Player.BLACK));
		}

		for (int x = 1; x < 8; x += 5) {
			grid[x][0].setPiece(new Knight(Player.WHITE));
			grid[x][7].setPiece(new Knight(Player.BLACK));
		}

		for (int x = 0; x < 8; x += 7) {
			grid[x][0].setPiece(new Rook(Player.WHITE));
			grid[x][7].setPiece(new Rook(Player.BLACK));
		}

		grid[3][0].setPiece(new Queen(Player.WHITE));
		grid[3][7].setPiece(new Queen(Player.BLACK));

		grid[4][0].setPiece(new King(Player.WHITE));
		grid[4][7].setPiece(new King(Player.BLACK));
	}

	public void movePiece(Move mv) {
		grid[mv.xF][mv.yF].setPiece(grid[mv.xI][mv.yI].getPiece());
		grid[mv.xI][mv.yI].release();
	}

	public Spot[][] getGrid() {
		return grid;
	}

	public String toString() {
		String s = "";
		for (int y = 0; y < SIZE; y++) {
			s += ((char) ('1' + y) + "| ");
			for (int x = 0; x < SIZE; x++) {
				if (grid[x][y].isOccupied()) {
					s += grid[x][y].getPiece() + " ";
				} else
					s += "  ";
			}
			s += "\n";
		}

		s += "  ";
		for (int x = 0; x < SIZE; x++)
			s += ("--");

		s += "\n";
		s += "   ";
		for (int x = 0; x < SIZE; x++)
			s += ((char) ('a' + x) + " ");
		s += "\n";
		return s;
	}

	public void print() {
		System.out.println(this.toString());
	}

	@Override
	public Object clone() {
		Board b = new Board();
		for (int y = 0; y < SIZE; y++)
			for (int x = 0; x < SIZE; x++)
				b.getGrid()[y][x].setPiece((Piece) grid[y][x].getPiece().clone());

		return b;
	}

}
