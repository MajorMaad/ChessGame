package aspects;

import java.io.FileWriter;
import java.io.IOException;

import agent.HumanPlayer;
import agent.Move;
import agent.Player;


/**
 * This aspect manages the writing of all the moves in an external file
 * It contains an only pointcut named writeMove that is called after any makeMove(Move) execution
 * That way, it will be called after Human's or AI's makeMove method
 * @author Marie Darrigol
 *
 */
public aspect FileWriterAspect {
	
	/** The path of the file where all the moves will be written **/
	private String outputPath = "log.txt";
	
	/**
	 * When the aspect is created, we make sure that the file is empty
	 * That way, only the results of the last game will be saved 
	 */
	pointcut initialize() : execution(void *.main(..));
	
	before() : initialize(){
		try {
			FileWriter out = new FileWriter(outputPath);
			out.write("----- Moves of the game -----\n");
			out.write(System.getProperty("line.separator"));
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * The pointcut is set during the execution of the method makeMove of any player (AI or human)
	 * We get some parameters :
	 * @param mv the move that has been played
	 * @param p the player that has played the move
	 */
	pointcut writeMove(Move mv, Player p) : execution(boolean *.makeMove(Move))
									&& args(mv)
									&& target(p);
	
	/**
	 * The writing of the move takes place after the execution of the previous method
	 * That way, we can get the returning value of the method
	 * @param mv the move that has been played
	 * @param p the player that has played the move
	 * @param res the returning method that indicates if the movement is valid or not
	 */
	after(Move mv, Player p) returning(boolean res): writeMove(mv, p){
		
		/** First, we check if the move is correct by testing the returning value that we have got **/
		if(res){
			
			/** If so, we check if the player is a human or an AI in order to make the right display **/
			String playerName = "";
			if(p instanceof HumanPlayer){
				playerName = "Human";
			}else{
				playerName = "AI";
			}
			
			/** Finally, the move and the name of the player are written on the screen and in the file **/
			String s = playerName+"'s move : "+mv.toString()+"\n\n";
			System.out.println(s);
			
			try {
				FileWriter out = new FileWriter(outputPath, true);
				out.write(s);
				out.write(System.getProperty("line.separator"));
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}