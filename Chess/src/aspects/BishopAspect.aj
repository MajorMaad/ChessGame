package aspects;

import agent.Move;
import main.Spot;

public aspect BishopAspect {
    
	/**
	 * Will replace the isMoveLegal function for Bishop
	 * @param mv
	 * @return
	 */
    boolean around(Move mv): execution(boolean piece.Bishop.isMoveLegal(Move)) && args(mv) {
    	return checkBishopMove(mv);
    }
	
    /**
     * Check if the bishop move is legal
     * @param mv
     * @return
     */
	private boolean checkBishopMove(Move mv) {
		if (mv.xF < 0 || mv.xF > 7 || mv.yF < 0 || mv.yF > 7) {
			return false;
		}
		
		if (Math.abs(mv.xF - mv.xI) != Math.abs(mv.yF - mv.yI)) {
			return false;
		}
		
		int checkIterations = Math.abs(mv.xF - mv.yI);
		
		for (int i=1; i<checkIterations; i++) {
			Spot spot = new Spot(mv.xI+i, mv.yF+i);
			if (spot.isOccupied())
				return false;
		}
		
		return true;
	}

}
