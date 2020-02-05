package online.dwResources;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import online.configuration.TopTrumpsJSONConfiguration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import database.DBConnect;
import model.Card;
import model.CardBuffer;
import model.Game;
import model.Player;

@Path("/toptrumps") // Resources specified here should be hosted at http://localhost:7777/toptrumps
@Produces(MediaType.APPLICATION_JSON) // This resource returns JSON content
@Consumes(MediaType.APPLICATION_JSON) // This resource can take JSON content as input
/**
 * This is a Dropwizard Resource that specifies what to provide when a user
 * requests a particular URL. In this case, the URLs are associated to the
 * different REST API methods that you will need to expose the game commands
 * to the Web page.
 * 
 * Below are provided some sample methods that illustrate how to create
 * REST API methods in Dropwizard. You will need to replace these with
 * methods that allow a TopTrumps game to be controled from a Web page.
 */
public class TopTrumpsRESTAPI {

	/** A Jackson Object writer. It allows us to turn Java objects
	 * into JSON strings easily. */
	ObjectWriter oWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();
	
	Game model;
	
	/**
	 * Contructor method for the REST API. This is called first. It provides
	 * a TopTrumpsJSONConfiguration from which you can get the location of
	 * the deck file and the number of AI players.
	 * @param conf
	 */
	public TopTrumpsRESTAPI(TopTrumpsJSONConfiguration conf) {
		model = new Game(4);
		
	}
	
	// ----------------------------------------------------
	// Add relevant API methods here
	// ----------------------------------------------------
	
	@GET
	@Path("/helloJSONList")
	/**
	 * Here is an example of a simple REST get request that returns a String.
	 * We also illustrate here how we can convert Java objects to JSON strings.
	 * @return - List of words as JSON
	 * @throws IOException
	 */
	public String helloJSONList() throws IOException {
		
		List<String> listOfWords = new ArrayList<String>();
		listOfWords.add("Hello");
		listOfWords.add("World!");
		
		// We can turn arbatory Java objects directly into JSON strings using
		// Jackson seralization, assuming that the Java objects are not too complex.
		String listAsJSONString = oWriter.writeValueAsString(listOfWords);
		
		return listAsJSONString;
	}
	
	@GET
	@Path("/gameInit")
	public void gameInit() throws Exception{
		model.gameInit();
	}

	
	@GET
	@Path("/roundStart")
	public String roundStart() throws Exception{
		model.roundInit();
		model.playersDrawCard();
		HashMap<Player,Card> cards = model.getCardThisRound();
		int size = cards.size();
		List<CardBuffer> cardBuffers = new ArrayList<CardBuffer>();
		for(int i = 0; i < size; i++) {
			Card c = cards.get(model.getPlayers()[i]);
			CardBuffer cb = c.toCardBuffer();
			cardBuffers.add(cb);
		}
		return oWriter.writeValueAsString(cardBuffers);
	}
	
	@GET
	@Path("/humanChoice")
	public void humanChoice(@QueryParam("choice") int choice) {
		HashMap<Player,Card> cards = model.getCardThisRound();
		Player winner = model.compare(cards, choice);
	}

	
	
	@GET
	@Path("/getNumOfGames")
	public int getNumOfGames() throws Exception{
		return DBConnect.getNumOfGames();
	}
	@GET
	@Path("/getNumOfHumanWins")
	public int getNumOfHumanWins() throws Exception{
		return DBConnect.getNumOfHumanWins();
	}
	@GET
	@Path("/getNumOfAIWins")
	public int getNumOfAIWins() throws Exception{
		return DBConnect.getNumOfAIWins();
	}
	@GET
	@Path("/getAverageDraws")
	public int getAverageDraws() throws Exception{
		return DBConnect.getAverageDraws();
	}
	@GET
	@Path("/getLongestGame")
	public int getLongestGame() throws Exception{
		return DBConnect.getLongestGame();
	}
	
	
	
	@GET
	@Path("/helloWord")
	/**
	 * Here is an example of how to read parameters provided in an HTML Get request.
	 * @param Word - A word
	 * @return - A String
	 * @throws IOException
	 */
	public String helloWord(@QueryParam("Word") String Word) throws IOException {
		return "Hello "+Word;
	}
	
}
