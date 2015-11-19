package main;
import piece.Piece;

public class Spot {
	private boolean occupied;
	private Piece piece;
	private int xPos, yPos;

	public Spot(int x, int y) {
		this.xPos = x;
		this.yPos = y;
		setOccupied(false);
	}


	public Spot(int x, int y, Piece p) {
		this.xPos = x;
		this.yPos = y;
		setPiece(p);
	}

	public void setOccupied(boolean occupied) {
		this.occupied = occupied;
	}

	public boolean isOccupied() {
		return occupied;
	}

	public void setPiece(Piece piece) {
		this.piece = piece;
		setOccupied(true);
	}
	public Piece getPiece() {
		return piece;
	}
	public void release(){
		setPiece(null);
		setOccupied(false);
	}

	@Override
	public boolean equals(Object o) {
		Spot b = (Spot) o;
		return (this.xPos == b.xPos) && (this.yPos == b.yPos);
	}

	@Override
	public String toString() {
		String s = xPos + "" + yPos;
		return s;
	}

}