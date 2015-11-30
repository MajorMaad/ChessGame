package aspects;

import agent.Move;

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
     * Check if the Bishop move is legal
     * @param mv
     * @return
     */
	private boolean checkBishopMove(Move mv) {
		// Outside
		if (mv.xF < 0 || mv.xF > 7 || mv.yF < 0 || mv.yF > 7) {
			return false;
		}
		// Correct move
		if (Math.abs(mv.xF - mv.xI) != Math.abs(mv.yF - mv.yI)) {
			return false;
		}
		
		return true;
	}

}
