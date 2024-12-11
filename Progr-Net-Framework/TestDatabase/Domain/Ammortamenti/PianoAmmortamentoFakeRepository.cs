namespace Domain.Ammortamenti;

public class PianoAmmortamentoFakeRepository:IPianoAmmortamentoRepository
{
    public void Insert(PianoDiAmmortamento pianoDiAmmortamento)
    {
        
    }

    public PianoDiAmmortamento GetById(long reqIdPianoDiAmmortamento)
    {
        return null;
    }

    public void Update(PianoDiAmmortamento pianoDiAmmortamento)
    {
        
        
    }

    public List<PianoDiAmmortamento> GetPianiAmmortmantoConScadenzeNelPeriodo(MeseAnnoRange rperiodo)
    {

        return new List<PianoDiAmmortamento>();
    }
}