package piece;

import agent.Move;
import agent.Player;

public class King extends Piece {

	public King(int player) {
		super(player);
	}

	@Override
	public String toString() {
		return ((this.player == Player.WHITE) ? "R" : "r");
	}

	@Override
	public boolean isMoveLegal(Move mv) {
		// TODO Implement this with an aspect
		return false;}
}