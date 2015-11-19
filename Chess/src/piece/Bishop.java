package piece;

import agent.Move;
import agent.Player;

public class Bishop extends Piece {

	public Bishop(int player) {
		super(player);
	}

	public Bishop() {
	}

	@Override
	public String toString() {
		return ((this.player == Player.WHITE) ? "P" : "p");
	}

	@Override
	public boolean isMoveLegal(Move mv) {
		// TODO Implement this with an aspect
		return false;}
}
