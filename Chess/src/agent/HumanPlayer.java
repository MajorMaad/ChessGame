package agent;

import main.Board;

public class HumanPlayer extends Player {

	public HumanPlayer(int arg, Board board) {
		setColor(arg);
		this.playGround = board;
	}

	@Override
	public boolean makeMove(Move mv) {
		if(mv == null)
			return false;
		if(!playGround.getGrid()[mv.xI][mv.yI].isOccupied())
			return false;
		if(playGround.getGrid()[mv.xI][mv.yI].getPiece().getPlayer() == this.getColor())
			return false;
		if(!playGround.getGrid()[mv.xI][mv.yI].getPiece().isMoveLegal(mv))
			return false;		
		playGround.movePiece(mv);
			return true;
	}

	@Override
	public Move makeMove() {
		Move mv;
		char initialX = '\0';
		char initialY = '\0';
		char finalX = '\0';
		char finalY = '\0';
		do{				
			System.out.print ("Votre coup? <a2a4> ");				
			initialX = Lire();
			initialY = Lire();
			finalX = Lire();
			finalY = Lire();
			ViderBuffer();

			mv = new Move(initialX-'a', initialY-'1', finalX - 'a', 	finalY-'1');
		}
		while(!makeMove(mv));
		return mv;
	}
	


	private static char Lire() {
		char C = 'A';
		boolean OK;
		do {
			OK = true;
			try {
				C = (char) System.in.read();
			}catch (java.io.IOException e) {

				OK = false;
			}
		} while (!OK);
		return C;
	}

	private static void ViderBuffer() {
		try {
			while (System.in.read() != '\n')
				;
		} catch (java.io.IOException e) {
		}
	}
}
