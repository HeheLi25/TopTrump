package model;

public class Card {
	public String description;
	public Player owner;
	// Categories will be same for every single card
	public static String[] category;
	// data of each category
	public int[] data = new int[5];

	// Constructor:
	public Card(String des, int d0, int d1, int d2, int d3, int d4) {
		description = des;
		data[0] = d0;
		data[1] = d1;
		data[2] = d2;
		data[3] = d3;
		data[4] = d4;
		owner = null;
	}

	// getters and setters
	public void setOwner(Player player) {
		owner = player;
	}

	public Player getOwner() {
		return owner;
	}

	// category data and the description only need to be get
	public int[] getData() {
		return data;
	}

	public String getDescription() {
		return description;
	}

	public String[] getCategory() {
		return category;
	}

	public void setCategory(String[] category) {
		Card.category = category;
	}

	@Override
	public String toString() {
		String result = "\'" + description + "\':" + "\n";
		for (int i = 0; i < category.length; i++) {
			String temp = String.format("   > %-10s:%3d", category[i], data[i]);
			result = result + temp + "\n";
		}
		return result;
	}
	public String printWithAnArrow(int position){
		String result = "";
		for (int i = 0; i < category.length; i++) {
			String temp = String.format("   > %-10s:%3d", category[i], data[i]);
			if(i == position) result = result + temp + "  <---" + "\n";
			else result = result + temp + "\n";
		}
		return result;
		
	}

	public int returnHighestStat() {
		int biggest = 0;
		int position = 0;
		for (int i = 0; i < data.length; i++) {
			if (data[i] > biggest) {
				biggest = data[i];
				position = i;
			}
		}
		return position;

	}
	public CardBuffer toCardBuffer() {
		CardBuffer cb = new CardBuffer(description, data[0],data[1],data[2],data[3],data[4],owner.getName());
		return cb;
	}

}
