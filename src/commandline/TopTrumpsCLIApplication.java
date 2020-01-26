package commandline;

import java.util.Scanner;

import model.Game;

/**
 * Top Trumps command line application
 */
public class TopTrumpsCLIApplication {

	/**
	 * This main method is called by TopTrumps.java when the user specifies that they want to run in
	 * command line mode. The contents of args[0] is whether we should write game logs to a file.
 	 * @param args
	 */
	public static void main(String[] args) {

		boolean writeGameLogsToFile = false; // Should we write game logs to file?
		if (args[0].equalsIgnoreCase("true")) writeGameLogsToFile=true; // Command line selection
		
		// State
		boolean userWantsToQuit = false; // flag to check whether the user wants to quit the application
		Scanner s = new Scanner(System.in);
		// Loop until the user wants to exit the game
		while (!userWantsToQuit) {
			
			// ----------------------------------------------------
			// Add your game logic here based on the requirements
			// ----------------------------------------------------
				System.out.println("Do you want to see past results or play a game?");
				System.out.println("1: Print Game Statistics"+
					   "\n2: Play game");
					   
				System.out.println("Enter the number for your selection:");
				int userInput = s.nextInt();
				if(userInput == 2){
					Game game = new Game();
					while(game.isInGame()){
						game.oneRound();
					}
				}
			
			
				//userWantsToQuit=true; // use this when the user wants to exit the game
		}


	}

}
