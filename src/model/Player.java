package model;

import java.util.ArrayList;
import java.util.Collections;

public class Player {
	private String name;
	private int score;
	private ArrayList<Card> cards;
	private boolean inGame;
	//constructor:
	public Player(String name){
		this.name = name;
		initPlayer();
	}
	public void initPlayer(){
		cards = new ArrayList<Card>();
		score = 0;
		inGame = true;
	}
	//getters and setters
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public ArrayList<Card> getCards() {
		return cards;
	}
	public boolean isInGame() {
		return inGame;
	}
	public void setInGame(boolean inGame) {
		this.inGame = inGame;
	}
	//methods

	//get the number of cards that the player has.
	public int numOfCards(){
		return cards.size();
	}
	//when get new cards, shuffle the cards and put them into the card list.
	public void addCards(ArrayList<Card> newCards){
		Collections.shuffle(newCards); //shuffle the new cards
		for(Card c: newCards){
			c.setOwner(this);//set the owner to this player
		}
		cards.addAll(newCards);
	}
	//Player draw a card and the card is removed from the card list. 
	public Card drawCard(){
		if(cards.size()<1){
			System.out.println("Error: No card to draw.");
			return null;
		}//Can not draw card when the play doesn't have any card left 
		Card oneCard = cards.get(0);
		cards.remove(0);
		return oneCard;
	}
	
	
}
