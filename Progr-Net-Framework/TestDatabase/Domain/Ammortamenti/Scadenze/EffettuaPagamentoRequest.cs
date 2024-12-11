namespace Domain.Ammortamenti.Scadenze;

public class EffettuaPagamentoRequest
{
    public StatoScadenza StatoScadenza { get; set; }
    public decimal? Importo { get; set; }
    public string Annotazioni { get; set; }
    public long ScadenzaId { get; set; }
}