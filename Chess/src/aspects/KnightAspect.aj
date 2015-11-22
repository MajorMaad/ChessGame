package aspects;

import agent.Move;

public aspect KnightAspect {
    
	/**
	 * Will replace the isMoveLegal function for Knight
	 * @param mv
	 * @return
	 */
    boolean around(Move mv): execution(boolean piece.Knight.isMoveLegal(Move)) && args(mv) {
    	return checkKnightMove(mv);
    }
    
    /**
     * Check if the Knight move is legal
     * @param mv
     * @return
     */
	private boolean checkKnightMove(Move mv) {
		if (mv.xF < 0 || mv.xF > 7 || mv.yF < 0 || mv.yF > 7) {
			return false;
		}
		
		int moveX = Math.abs(mv.xF-mv.xI);
		int moveY = Math.abs(mv.yF-mv.yI);
		
		if ((moveX == 2 && moveY ==1) || (moveX == 1 && moveY == 2))
			return true;
		
		return false;
	}

}