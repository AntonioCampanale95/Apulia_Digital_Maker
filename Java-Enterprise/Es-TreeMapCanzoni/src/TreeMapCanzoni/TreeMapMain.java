package TreeMapCanzoni;

import java.time.LocalDate;
import java.util.TreeMap;

public class TreeMapMain {

	public static void main(String[] args) {

		ComparatoreCanzoni comparatorePerAscolti = new ComparatoreCanzoni();

		TreeMap<Canzone, String> canzoni = new TreeMap<>(comparatorePerAscolti);

		canzoni.put(new Canzone("In the end", "Nu metal", 13002406, LocalDate.of(2001, 9, 11)), "Linkin Park");
		canzoni.put(new Canzone("Astronaut", "Pop punk", 1200300, LocalDate.of(2011, 9, 21)), "Simple Plan");
		canzoni.put(new Canzone("Stressed Out", "Alternative Hip Hop", 9000345, LocalDate.of(2015, 4, 15)),
				"Twenty One Pilots");
		canzoni.put(new Canzone("Lego House", "Pop Rock", 15698765, LocalDate.of(2011, 11, 18)), "Ed Sheeran");
		canzoni.put(new Canzone("Circles", "Pop psichedelico", 17896754, LocalDate.of(2019, 8, 4)), "Post Malone");
		canzoni.put(new Canzone("Sacrifice", "Disco Funk", 14876546, LocalDate.of(2022, 1, 7)), "The Weeknd");
		canzoni.put(new Canzone("Ho imparato a sognare", "Alternative Rock", 543098, LocalDate.of(1997, 9, 19)),
				"Negrita");

		System.out.println("Classifica ascolti canzoni nel TreeMap in base agli streaming totali: ");
		System.out.println("------------------------------");
		for (Canzone canzone : canzoni.keySet()) {
			System.out.println("Titolo: " + canzone.getTitolo() + ", Artista: " + canzoni.get(canzone)
					+ ", Anno di uscita: " + canzone.getDataUscita().getYear() + "------ Streaming totali: "
					+ canzone.getAscoltiStream());
		}
		System.out.println("------------------------------");

	}

}
