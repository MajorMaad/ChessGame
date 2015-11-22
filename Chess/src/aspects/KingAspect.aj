package aspects;

import agent.Move;

public aspect KingAspect {

	/**
	 * Will replace the isMoveLegal function for King
	 * @param mv
	 * @return
	 */
    boolean around(Move mv): execution(boolean piece.King.isMoveLegal(Move)) && args(mv) {
    	return checkKingMove(mv);
    }
    
    /**
     * Check if the King move is legal
     * @param mv
     * @return
     */
	private boolean checkKingMove(Move mv) {
		if (mv.xF < 0 || mv.xF > 7 || mv.yF < 0 || mv.yF > 7) {
			return false;
		}
		
		if (Math.abs(mv.xF-mv.xI)>1 || Math.abs(mv.yF-mv.yI)>1) {
			return false;
		}
		
		return true;
	}
	
}
