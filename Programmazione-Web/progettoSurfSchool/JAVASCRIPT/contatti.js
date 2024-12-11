/************ FUNZIONE PER LA NAVBAR E PER IL PULSANTE TORNA SU ************/

// Aspetta il caricamento completo della pagina prima di eseguire lo script
window.onload = function () {
  // Assegna la funzione scrollata() all'evento onscroll
  window.onscroll = function () {
    scrollata();
  };

  // Gestisci il click sul pulsante "Torna su"
  document
    .getElementById("backToTopBtn")
    .addEventListener("click", function (event) {
      event.preventDefault(); // Evita il comportamento di default del link
      window.scrollTo({ top: 0, behavior: "smooth" }); // Scorrimento fluido verso l'alto
    });
};

// Funzione per gestire lo scroll e mostrare/nascondere il pulsante "Torna su"
function scrollata() {
  // Ottieni la posizione dello scroll verticale
  let scrollTop = window.scrollY;

  // Ottieni l'elemento navbar dal DOM
  let navbar = document.getElementById("navbar");

  // Ottieni l'elemento del pulsante "Torna su"
  let backToTopBtn = document.getElementById("backToTopBtn");

  // Controlla se lo scroll è superiore a 200px
  if (scrollTop > 200) {
    // Se lo è, nascondi la navbar
    navbar.style.height = "0";
    navbar.style.transition = "0.8s";
    navbar.style.borderBottom = "none";
  } else {
    // Altrimenti, mostra la navbar con altezza 200px
    navbar.style.height = "220px";
    navbar.style.backgroundColor = "transparent";
    navbar.style.borderBottom = "2px solid darkorange";
  }

  // Controlla se lo scroll è superiore a metà del viewport
  if (scrollTop > window.innerHeight / 2) {
    // Se lo è, mostra il pulsante "Torna su"
    backToTopBtn.style.display = "block";
  } else {
    // Altrimenti, nascondi il pulsante "Torna su"
    backToTopBtn.style.display = "none";
  }
}

/*********** CONTOLLO FORM GRANDE CON MESSAGGIO ***********/

console.log("Codice JavaScript in esecuzione");
document.addEventListener("DOMContentLoaded", function () {
  var form = document.getElementById("formContatti");

  form.addEventListener("submit", function (event) {
    console.log("Form submitted");

    var nome = document.getElementById("nome").value.trim();
    console.log("Nome:", nome);

    var cognome = document.getElementById("cognome").value.trim();
    console.log("Cognome:", cognome);

    var telefono = document.getElementById("telefono").value.trim();
    console.log("Telefono:", telefono);

    var email = document.getElementById("email").value.trim();
    console.log("Email:", email);

    var messaggio = document.getElementById("messaggio").value.trim();
    console.log("Messaggio:", messaggio);

    var errore = false;

    // Validazione del campo nome
    if (nome === "") {
      alert("Inserisci il tuo nome.");
      errore = true;
      console.log("Nome non inserito");
    } else if (!/^[a-zA-Z]+$/.test(nome)) {
      alert("Il nome deve contenere solo lettere.");
      errore = true;
      console.log("Nome contiene caratteri non validi");
    }

    // Validazione del campo cognome
    if (cognome === "") {
      alert("Inserisci il tuo cognome.");
      errore = true;
      console.log("Cognome non inserito");
    } else if (!/^[a-zA-Z]+$/.test(cognome)) {
      alert("Il cognome deve contenere solo lettere.");
      errore = true;
      console.log("Cognome contiene caratteri non validi");
    }

    // Validazione del campo telefono
    if (telefono === "") {
      alert("Inserisci il tuo numero di telefono.");
      errore = true;
      console.log("Telefono non inserito");
    } else if (!/^\d{10}$/.test(telefono)) {
      alert(
        "Il numero di telefono non è valido. Inserisci un numero di telefono valido (10 cifre)."
      );
      errore = true;
      console.log("Telefono non valido");
    }

    // Validazione del campo email
    if (email === "") {
      alert("Inserisci la tua email.");
      errore = true;
      console.log("Email non inserita");
    } else if (!/^\S+@\S+\.\S+$/.test(email)) {
      alert(
        "L'indirizzo email non è valido. Inserisci un indirizzo email valido."
      );
      errore = true;
      console.log("Email non valida");
    }

    // Validazione del campo messaggio
    if (messaggio === "") {
      alert("Scrivi il tuo messaggio.");
      errore = true;
      console.log("Messaggio non inserito");
    }

    // Se ci sono errori, impedisci l'invio del modulo
    if (errore) {
      event.preventDefault();
      console.log("Errore nella validazione del modulo");
    } else {
      console.log("Il modulo è stato validato correttamente");
    }
  });
});

/********** FUNZIONE PER IL CONTROLLO DELLA NEWSLETTER NEL FOOTER ***********/

document.addEventListener("DOMContentLoaded", function () {
  // Il codice JavaScript che accede agli elementi del DOM va qui
  function validateForm() {
    var email = document.getElementById("eMail").value;

    // Validazione del campo email
    if (email === "") {
      alert("Inserisci la tua email.");
      console.log("Email non inserita");
      return false;
    } else if (!/^\S+@\S+\.\S+$/.test(email)) {
      alert(
        "L'indirizzo email non è valido. Inserisci un indirizzo email valido."
      );
      console.log("Email non valida");
      return false;
    }

    // Se la validazione passa, ritorno true per inviare il form
    return true;
  }
});
