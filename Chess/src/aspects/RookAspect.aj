package aspects;

import agent.Move;

public aspect RookAspect {
    
	/**
	 * Will replace the isMoveLegal function for Rook
	 * @param mv
	 * @return
	 */
    boolean around(Move mv): execution(boolean piece.Rook.isMoveLegal(Move)) && args(mv) {
    	return checkRookMove(mv);
    }
    
    /**
     * Check if the Rook move is legal
     * @param mv
     * @return
     */
	private boolean checkRookMove(Move mv) {
		if (mv.xF < 0 || mv.xF > 7 || mv.yF < 0 || mv.yF > 7) {
			return false;
		}
		
		if (Math.abs(mv.xF - mv.xI) != 0 && Math.abs(mv.yF - mv.yI) == 0) {
			return true;
		}
		
		if (Math.abs(mv.xF - mv.xI) == 0 && Math.abs(mv.yF - mv.yI) != 0) {
			return true;
		}
		
		return false;
	}

}