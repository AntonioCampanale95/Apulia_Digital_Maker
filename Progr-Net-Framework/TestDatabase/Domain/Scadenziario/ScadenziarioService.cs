using Domain.Ammortamenti;

namespace Domain.Scadenziario;

public class ScadenziarioService
{
    private readonly IPianoAmmortamentoRepository _repo;

    public ScadenziarioService(IPianoAmmortamentoRepository repo)
    {
        _repo = repo;
    }
    public List<PianoDiAmmortamento> CreaScadenziario(MeseAnnoRange range)
    {
        var pAmmortamento = _repo.GetPianiAmmortmantoConScadenzeNelPeriodo(range);
        
        return pAmmortamento;
    }
}