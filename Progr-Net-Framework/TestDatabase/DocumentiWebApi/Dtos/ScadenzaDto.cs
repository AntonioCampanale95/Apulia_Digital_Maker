using Domain.Ammortamenti.Scadenze;

namespace DocumentiWebApi.Dtos;

public class ScadenzaDto
{
    public ScadenzaDto()
    {
        
    }

    public ScadenzaDto(Scadenza scadenza)
    {
        Id = scadenza.Id;
        Mese = scadenza.MeseScadenza.Mese.MeseSelezionato;
        Anno = scadenza.MeseScadenza.Anno.AnnoSelezionato;
        Importo = scadenza.Importo;
        Beneficiario = new BeneficiarioDto()
        {
            Descrizione = scadenza.Beneficiario?.Descrizione
        };
        Notes = scadenza.Notes;
        StatoScadenza = scadenza.Stato.ToString();
    }
    
    public long Id { get; set; }
    public int Mese { get; set; }
    public int Anno { get; set; }
    public decimal? Importo { get; set; }

    public string StatoScadenza { get; set; }

    public string Notes { get; set; }
    public BeneficiarioDto Beneficiario { get; set; }
}