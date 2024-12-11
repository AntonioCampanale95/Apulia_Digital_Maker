package GiorniRimanenti;

import java.time.Duration;
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class MainGiorni {


	public static void main(String[] args) {
		
		//data di oggi
		LocalDate oggi = LocalDate.now();
		System.out.println(oggi);
		
		//data di ferragosto
		LocalDate date = LocalDate.of(2024, Month.AUGUST, 15);
		System.out.println(date);
		
		//come formattare le date "all'italiana"
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String formattedOggi = oggi.format(formatter);
		String formattedDate = date.format(formatter);		
		System.out.println("Data di oggi e del 15 agosto formattate : " + formattedOggi + " ---- " + formattedDate);
		
		
		//primo metodo per calcolare la distanza da una data ad un'altra
		Duration duration = Duration.between(oggi.atStartOfDay(), date.atStartOfDay());
		long giorniRimanenti = duration.toDays();
		System.out.println("Tempo rimanente: " + giorniRimanenti + " giorni");
		
		//oppure altro metodo
		long giorni = ChronoUnit.DAYS.between(oggi, date);
		System.out.println("Mancano: " + giorni + " giorni al " + date);
		
		//terzo metodo 
		Period period = Period.between(oggi, date);
		System.out.println("Mancano " + period.getMonths() + " mesi");
		
		
		//-------------------------------------------------------------
		
		
		//durata della mia festa di compleanno dell'anno scorso
		LocalDate mioCompleanno = LocalDate.of(2023, Month.OCTOBER, 14);
		LocalDate fineFestaCompleanno = mioCompleanno.plusDays(5);
		
		Duration durataCompleanno = Duration.between(mioCompleanno.atStartOfDay(), fineFestaCompleanno.atStartOfDay());
		long giorniFesta = durataCompleanno.toDays();
		System.out.println("La festa è durata : " + giorniFesta + " giorni");
		
		
	}

}
