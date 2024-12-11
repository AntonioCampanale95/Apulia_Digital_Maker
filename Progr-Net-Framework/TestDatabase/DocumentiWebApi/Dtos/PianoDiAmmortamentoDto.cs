using Domain.Ammortamenti;

namespace DocumentiWebApi.Dtos;

public class PianoDiAmmortamentoDto
{
    public VoceDiCostoDto VoceDiCosto { get; set; }
    public int MeseDa { get; set; }
    public int MeseA { get; set; }
    public int AnnoA { get; set; }
    public int AnnoDa { get; set; }
    public StatoPianoAmmortamento StatoPianoAmmortamento { get; set; }
    private List<ScadenzaDto> Scadenze { get; set; }
}