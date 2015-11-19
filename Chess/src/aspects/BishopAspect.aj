package aspects;

import agent.Move;

public aspect BishopAspect {
    
	pointcut callIsMoveLegal(): execution(* piece.Bishop.isMoveLegal(Move));
	
    boolean around(): callIsMoveLegal() {
  	  return false;
    }
	
}
