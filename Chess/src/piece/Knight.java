package piece;

import agent.Move;
import agent.Player;

public class Knight extends Piece {

	public Knight(int player) {
		super(player);
	}

	@Override
	public String toString() {
		return ((this.player == Player.WHITE) ? "C" : "c");
	}

	@Override
	public boolean isMoveLegal(Move mv) {
		// TODO Implement this with an aspect
		return false;}
}