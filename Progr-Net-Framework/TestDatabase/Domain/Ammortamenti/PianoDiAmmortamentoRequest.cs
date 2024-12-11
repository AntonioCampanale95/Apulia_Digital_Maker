namespace Domain.Ammortamenti;

public class PianoDiAmmortamentoRequest
{
    public long VoceDiCostoId { get; set; }
    public int MeseDa { get; set; }
    public int MeseA { get; set; }
    public int AnnoA { get; set; }
    public int AnnoDa { get; set; }
}