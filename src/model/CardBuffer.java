package model;

public class CardBuffer {
	public String description;
	public int attribute0;
	public int attribute1;
	public int attribute2;
	public int attribute3;
	public int attribute4;
	public String owner;
	
	public CardBuffer(String d, int a0,int a1, int a2, int a3, int a4,String owner) {
		this.owner = owner;
		this.description = d;
		this.attribute0 = a0;
		this.attribute1 = a1;
		this.attribute2 = a2;
		this.attribute3 = a3;
		this.attribute4 = a4;
		
	}

}
