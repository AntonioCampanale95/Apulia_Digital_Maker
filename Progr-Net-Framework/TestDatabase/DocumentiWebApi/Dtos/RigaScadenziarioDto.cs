using Domain.Ammortamenti;

namespace DocumentiWebApi.Dtos;

public class RigaScadenziarioDto
{
    public RigaScadenziarioDto(PianoDiAmmortamento pianoDiAmmortamento)
    {
        PianoAmmortamentoId = pianoDiAmmortamento.Id;
        VoceDiCosto = pianoDiAmmortamento.VodeDiCosto.Descrizione;
        StatoPa = pianoDiAmmortamento.Stato.ToString();
        NumRate = pianoDiAmmortamento.NumRate;
        ImportoPa = pianoDiAmmortamento.Importo;
        ImportoResiduoPa = pianoDiAmmortamento.ImportoResiduo;
        ScadenzaDtos = new List<ScadenzaDto>();
        
        foreach (var scadenza in pianoDiAmmortamento.Scadenze)
        {
            ScadenzaDtos.Add(new ScadenzaDto(scadenza));
        }
    }

    public long PianoAmmortamentoId { get; set; }
    public string VoceDiCosto { get; set; }
    public decimal? ImportoPa { get; set; }
    public decimal ImportoResiduoPa { get; set; }
    public string StatoPa { get; set; }
    public int NumRate { get; set; }
    public List<ScadenzaDto> ScadenzaDtos { get; set; }
    
}