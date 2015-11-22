package aspects;

import agent.Move;

public aspect QueenAspect {
    
	/**
	 * Will replace the isMoveLegal function for Bishop
	 * @param mv
	 * @return
	 */
    boolean around(Move mv): execution(boolean piece.Queen.isMoveLegal(Move)) && args(mv) {
    	return checkQueenMove(mv);
    }
    
    /**
     * Check if the Queen move is legal
     * @param mv
     * @return
     */
	private boolean checkQueenMove(Move mv) {
		if (mv.xF < 0 || mv.xF > 7 || mv.yF < 0 || mv.yF > 7) {
			return false;
		}
		
		if (Math.abs(mv.xF - mv.xI) != 0 && Math.abs(mv.yF - mv.yI) == 0) {
			return true;
		}
		
		if (Math.abs(mv.xF - mv.xI) == 0 && Math.abs(mv.yF - mv.yI) != 0) {
			return true;
		}
		
		if (Math.abs(mv.xF - mv.xI) == Math.abs(mv.yF - mv.yI)) {
			return true;
		}
		
		return false;
	}

}