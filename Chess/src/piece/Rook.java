package piece;

import agent.Move;
import agent.Player;

public class Rook extends Piece {

	public Rook(int player) {
		super(player);
	}

	public Rook() {
	}

	@Override
	public String toString() {
		return ((this.player == Player.WHITE) ? "T" : "t");
	}

	@Override
	public boolean isMoveLegal(Move mv) {
		// TODO Implement this with an aspect
		return false;
	}
}