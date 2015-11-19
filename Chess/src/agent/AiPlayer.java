package agent;

import java.util.Random;
import main.Board;

public class AiPlayer extends Player {
	// dies roooooll
	private Random Dies = new Random(0);

	public AiPlayer(int arg, Board board) {
		setColor(arg);
		this.playGround = board;
	}

	@Override
	public boolean makeMove(Move mv) {
		if (mv == null)
			return false;
		if (!playGround.getGrid()[mv.xI][mv.yI].isOccupied())
			return false;
		if (playGround.getGrid()[mv.xI][mv.yI].getPiece().getPlayer() == this.getColor())
			return false;
		if (!playGround.getGrid()[mv.xI][mv.yI].getPiece().isMoveLegal(mv))
			return false;
		playGround.movePiece(mv);
		return true;
	}

	@Override
	public Move makeMove() {
		Move mv;
		int iniX = -1, iniY = -1, finX = -1, finY = -1;

		do {
			iniX = Dies.nextInt(8);
			iniY = Dies.nextInt(8);
			finX = Dies.nextInt(8);
			finY = Dies.nextInt(8);
			mv = new Move(iniX, iniY, finX, finY);
		} while (!makeMove(mv));

		System.out.println("Votre coup? <" + mv.toString()+ ">");
		return mv;
	}
}
