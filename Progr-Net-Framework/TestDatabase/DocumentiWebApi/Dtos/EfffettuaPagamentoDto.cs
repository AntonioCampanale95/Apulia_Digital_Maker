using Domain.Ammortamenti.Scadenze;

namespace DocumentiWebApi.Dtos;

public class EfffettuaPagamentoDto
{
    public StatoScadenza StatoScadenza { get; set; }
    public decimal? Importo { get; set; }
    public string Annotazioni { get; set; }
    
}