package TreeMapCanzoni;

import java.util.Comparator;

public class ComparatoreCanzoni implements Comparator<Canzone> {

	@Override
	public int compare(Canzone c1, Canzone c2) {
		return Integer.compare(c2.getAscoltiStream(), c1.getAscoltiStream());
	}

}
