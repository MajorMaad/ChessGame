package aspects;

import agent.Move;
import agent.Player;
import piece.Pawn;

public aspect PawnAspect {
    
	/**
	 * Will replace the isMoveLegal function for Pawn
	 * @param mv
	 * @return
	 */
    boolean around(Move mv, Pawn p): execution(boolean piece.Pawn.isMoveLegal(Move)) && args(mv) && target(p){
    	return checkPawnMove(mv, p);
    }
    
    /**
     * Check if the Pawn move is legal
     * @param mv
     * @return
     */
	private boolean checkPawnMove(Move mv, Pawn p) {
		if (mv.xF < 0 || mv.xF > 7 || mv.yF < 0 || mv.yF > 7) {
			return false;
		}
		
		int moveX = mv.xF-mv.xI;
		int moveY = mv.yF-mv.yI;
		
		// White Pawn
		if (p.getPlayer() == Player.WHITE) {
			
			// Straight move
			if ((moveY == 1 || moveY == 2) && moveX == 0)
				return true;
			
			// Cross move
			if ((moveX == 1 && moveY == 1) || (moveX == -1 && moveY == 1))
				return true;
				
		} else { // Black pawn
			
			// Straight move
			if ((moveY == -1 || moveY == -2) && moveX == 0)
				return true;
			
			// Cross move
			if ((moveX == 1 && moveY == -1) || (moveX == -1 && moveY == -1))
				return true;
			
		}
		
		return false;
	}

}
