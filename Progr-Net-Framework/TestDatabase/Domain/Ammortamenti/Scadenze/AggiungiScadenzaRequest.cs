namespace Domain.Ammortamenti.Scadenze;

public class AggiungiScadenzaRequest
{
    public int Mese { get; set; }
    public int Anno { get; set; }
    public long IdBeneficiario { get; set; }
    public decimal? Importo { get; set; }
    public long IdPianoDiAmmortamento { get; set; }
}