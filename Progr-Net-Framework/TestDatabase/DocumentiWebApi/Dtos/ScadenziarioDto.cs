using Domain.Ammortamenti;

namespace DocumentiWebApi.Dtos;

public class ScadenziarioDto
{
    

    public ScadenziarioDto(int annoDa, int meseDa, int annoA, int meseA,
        List<PianoDiAmmortamento> scadenziario)
    {
        AnnoDa = annoDa;
        MeseDa = meseDa;
        AnnoA = annoA;
        MeseA = meseA;
        
        RigheScadenziario = new List<RigaScadenziarioDto>();
        foreach (var pianoDiAmmortamento in scadenziario)
        {
            RigheScadenziario.Add(new RigaScadenziarioDto(pianoDiAmmortamento));
        }
    }
    public int MeseDa { get; set; }
    public int MeseA { get; set; }
    public int AnnoA { get; set; }
    public int AnnoDa { get; set; }
    public List<RigaScadenziarioDto> RigheScadenziario { get; set; }
}