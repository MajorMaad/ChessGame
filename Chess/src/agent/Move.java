package agent;

public class Move {
	public int xI, xF, yI, yF;

	public Move(int x0, int y0, int x1, int y1) {
		this.xI = x0;
		this.xF = x1;
		this.yI = y0;
		this.yF = y1;
	}

	public String toString() {
		return (char)('a' + xI) + "" + (yI+1) + (char)('a' + xF) + "" + (yF+1);
	}
}
