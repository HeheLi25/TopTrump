package model;

import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Scanner;

import database.DBConnect;

public class Game {
	private Player[] players;
	private int round;
	private int numOfPlayers;
	private ArrayList<Card> commonPile;
	private int theActivePlayer;//This is the position of the active player in the array.
	private int howManyAlive;
	private int roundChoice;
	private boolean inGame;
	private boolean isDraw;
	private int numOfDraws;
	public HashMap<Player, Card> cardThisRound;
	public Player roundWinner;
	
	
	public Game(int AIPlayers){
		this.numOfPlayers = AIPlayers+1; //total player number
		players = new Player[numOfPlayers];
		
		//first player is the human player
		players[0] = new Player("Human Player");
		//fill the array with AI players
		for(int i = 1; i < numOfPlayers; i++){
			players[i] = new Player("AI Player "+i);
		}
		round = 0;
		commonPile = new ArrayList<Card>();
		theActivePlayer = 0;
		//Distribute card
		distributeCards();
		System.out.println("Game start");
		howManyAlive = numOfPlayers;
		inGame = true;
		isDraw = false;
		numOfDraws = 0;
		cardThisRound = new  HashMap<Player, Card>();
	}
	
	public void gameInit() {
		round = 0;
		commonPile.clear();
		theActivePlayer = 0;
		//Distribute card
		distributeCards();
		System.out.println("Game start");
		howManyAlive = numOfPlayers;
		inGame = true;
		isDraw = false;
		numOfDraws = 0;
		cardThisRound.clear();
	}
	//the overload constructor calls the origin constructor with numOfPlayers = 4.
	public Game(){
		this(4); 
	}
	//getters and setters
	public Player[] getPlayers() {
		return players;
	}
	public int getRound() {
		return round;
	}
	public void addRound() {
		round++;
	}
	public ArrayList<Card> getCommonPile() {
		return commonPile;
	}
	public boolean isInGame(){
		return inGame;
	}
	public int getTheActivePlayer() {
		return theActivePlayer;
	}
	public HashMap<Player, Card> getCardThisRound() {
		return cardThisRound;
	}
	//read cards from the file and distribute to players
	private void distributeCards(){
		FileReader fr = null;
		ArrayList<Card> deck = new ArrayList<Card>();
		try{
			String fn = "Pokemonlist.txt";
			fr = new FileReader(fn);
			Scanner s = new Scanner(fr);
			String[] split;
			s.next();
			//read the first line: name of categories
			String firstLine = s.nextLine().trim();
			String[] categories = firstLine.split("\\s+");
			//read cards and store in deck.
			while(s.hasNextLine()){
				String line = s.nextLine();
				split = line.split("\\s+");
				Card oneCard = new Card(split[0],Integer.parseInt(split[1]),Integer.parseInt(split[2]),
						Integer.parseInt(split[3]),Integer.parseInt(split[4]),Integer.parseInt(split[5]));
				deck.add(oneCard);
			}
			//set the name of categories of the cards
			deck.get(0).setCategory(categories);
			
		}catch(IOException e){
			System.err.println("File reading error");
			e.printStackTrace();
		}finally{
			try {
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		Collections.shuffle(deck); //shuffle card deck
//		System.out.println(deck);
		int cardForEach = deck.size()/numOfPlayers;
		int cardRemain = deck.size()%numOfPlayers; //if the number of cards cannot be evenly distributed
		//put the remain cards into common pile.
		if(cardRemain != 0){
			for(int i = 0; i < cardRemain; i++){
				Card tempCard = deck.get(0);
				commonPile.add(tempCard);
				deck.remove(0);
			}
		}
		//distribute card evenly
		for(int i = 0; i < numOfPlayers; i++){
			for(int j = 0; j < cardForEach; j++){
				Card tempCard = deck.get(0);
				tempCard.setOwner(players[i]);
				players[i].getCards().add(tempCard);
				deck.remove(0);
			}
		}
	}
	public void roundInit() {
		round++;
		System.out.println();
		cardThisRound.clear();
		System.out.println("Round "+round);
	}
	//check whether the human player is in game or not.
	public boolean getHumanStatus() {
		if(players[0].isInGame()) {
			return true;
		}else {
			return false;
		}
	}
	
	//The method that the players draw card and store the cards in cardThisRound.
	public void playersDrawCard() {
		for(int i = 0; i<numOfPlayers; i++){
			if(players[i].isInGame()){
				cardThisRound.put(players[i], players[i].drawCard());
			}	
		}
		System.out.println("Round "+round +": Players have drawn their cards.");
	}
	
	
	public void oneRound(){
		roundInit();
		
		Player winner = null;
		
		playersDrawCard();
		
		if(getHumanStatus()){
			System.out.print("You drew ");
			System.out.print(cardThisRound.get(players[0]));
			System.out.println("There are \'"+ players[0].getCards().size() + " cards in your deck");
		}
		if(theActivePlayer == 0){
			winner = humanPlayerRound(cardThisRound);
		}else{
			winner = AIPlayerRound(cardThisRound);
		}
		roundWinner = winner;
		endRound();
	}
	
	
	
	public void endRound() {
		Player winner = roundWinner;
		//We got the result now. Handle the end of a round.
		ArrayList<Card> cardThisRoundArray = new ArrayList<Card>(cardThisRound.values());
		if(isDraw == true){
			//handle the draw!	
			commonPile.addAll(cardThisRoundArray);
			System.out.println("Round "+round +": This round was a Draw, common pile now has "+commonPile.size()+" cards");
			isDraw = false;	//initial the flag
			numOfDraws++;
			//the active player remains unchanged
		}else{
			//Winner gets all the cards this round.
			winner.addCards(cardThisRoundArray);
			winner.setScore(winner.getScore()+1);
			if(commonPile.size() != 0);{ //if there are cards in common pile, give them to the winner.
				winner.addCards(commonPile);
				commonPile.clear();
			}
			System.out.println("Round "+round +": Player "+ winner.getName() +" won this round.");
			//change the active player.
			for(int i = 0; i < players.length; i++){ 
				if(players[i].equals(winner))
					theActivePlayer = i;
			}
		}
			Card winningCard = cardThisRound.get(winner);
			System.out.println("The winning card was: '" + winningCard.getDescription() + "':");
			System.out.println(winningCard.printWithAnArrow(roundChoice));
			
		//Eliminate players, check whether the game should be end.
		checkAlivePlayers();
		if (howManyAlive <= 1) {
			System.out.println("\nGame End\n");
			if (howManyAlive == 1) {
				System.out.println("The overall winnder was" + winner.getName());
				try {
					recordStatistic(winner);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			else{
				try {
					recordStatistic(null);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println("There is no winner.");
			}
			System.out.println("Scores:");
			for (int i = 0; i < numOfPlayers; i++) {
				System.out.println("   " + players[i].getName() + ": " + players[i].getScore());
			}
			System.out.println();
			inGame = false;
		}
	}
	
	
	
	public Player humanPlayerRound(HashMap<Player, Card> cardThisRound){
		Player winner = null;	
		System.out.println("It is your turn to select a category, the categories are:");
		for(int i = 0; i < 5; i++){
			System.out.println("   "+(i+1)+": "+cardThisRound.get(players[0]).getCategory()[i]);
		}
		System.out.println("Enter the number for your attribute:");
		Scanner s = new Scanner(System.in);
		int humanChoice = -1;
		humanChoice = s.nextInt();
		while(humanChoice<0||humanChoice>5) {
			System.out.println("Please input a valid number.");
			humanChoice = s.nextInt();
		}
		humanChoice --; //the options start from 1 but we need the number start from 0.
		roundChoice = humanChoice;
		winner = compare(cardThisRound, humanChoice);
		return winner;
	}
	
	
	public Player AIPlayerRound(HashMap<Player, Card> cardThisRound){
		Player winner = null;
		Card currentCard = cardThisRound.get(players[theActivePlayer]);
		int AIChoice = currentCard.returnHighestStat();
		roundChoice = AIChoice;
		winner = compare(cardThisRound, AIChoice);
		return winner;
	}
	
	
	
	//Method to compare the cards that players drawn this round and find the winner. 
	public Player compare(HashMap<Player, Card> cardThisRound, int choice){
	    int biggest = -1;
	    int position = 0;
	    Card biggestCard = null;
	    ArrayList<Card> cards = new ArrayList<Card>(cardThisRound.values());
	    for(int i = 0; i<cards.size(); i++ ) {
	    	Card temp = cards.get(i);
	    	if(temp.getData()[choice] > biggest) {
	    		biggest = cards.get(i).getData()[choice];
	    		biggestCard = temp;
	    	}
	    }
	    //check whether there is a draw:
	    int counter = 0;
	    for(int i = 0; i<cards.size(); i++ ) {
	    	Card temp = cards.get(i);
	    	if(temp.getData()[choice] == biggest) {
	    		counter ++;
	    	}
	    }
	    if(counter > 1) isDraw = true;
		return biggestCard.getOwner();
	}
	
	//This method will get the players who have no cards out of the game. 
	public void checkAlivePlayers(){
		howManyAlive = numOfPlayers;
		for(Player p : players){			
			if(p.getCards().size() == 0){
				p.setInGame(false);
				howManyAlive--;
			}
		}
	}
	
	
	public void recordStatistic(Player winner) throws SQLException{
		DBConnect db = new DBConnect();
		ResultSet rs = null;
		Statement stmt = null;
		int numOfGames=0, numOfHumanWins=0,numOfAIWins=0,aveNumOfDraws=0,longestGame=0;
		try {
			stmt = db.getConnection().createStatement();
			rs = stmt.executeQuery("select * from pokemon");
			rs.next();
			numOfGames = rs.getInt("number_of_games");
			numOfHumanWins = rs.getInt("number_of_humanwins");
			numOfAIWins = rs.getInt("number_of_aiwins");
			aveNumOfDraws = rs.getInt("average_number_of_draws");
			longestGame = rs.getInt("longest_game");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int newNumOfGames = numOfGames+1;
		int newNumOfDraws = (numOfGames*aveNumOfDraws+numOfDraws)/newNumOfGames;
		stmt = db.getConnection().createStatement();
		stmt.executeUpdate("update pokemon set number_of_games = "+ newNumOfGames);
		stmt.close();
		stmt = db.getConnection().createStatement();
		stmt.executeUpdate("update pokemon set average_number_of_draws = "+ newNumOfDraws);
		stmt.close();
		
		if(round-1 > longestGame){
			int newLongestGame = round-1;
			stmt = db.getConnection().createStatement();
			stmt.executeUpdate("update pokemon set longest_game = "+ newLongestGame);
			stmt.close();
		}
		if(winner != null){
			if(winner.getName().equals("Human Player")){
				numOfHumanWins ++;
				stmt = db.getConnection().createStatement();
				stmt.executeUpdate("update pokemon set number_of_humanwins = "+ numOfHumanWins );
				stmt.close();
			}else{
				numOfAIWins ++;
				stmt = db.getConnection().createStatement();
				stmt.executeUpdate("update pokemon set number_of_aiwins = "+ numOfAIWins );
				stmt.close();
			}
		}
		db.close();
		
	}
	
	
	

	
//	public static void main(String[] args){
//		Game test = new Game(2);
//		System.out.println(test.getPlayers()[1].getCards().toString());
//		System.out.println("------------------------------------");
//		System.out.println(test.getCommonPile().toString());
//	}
	

}
