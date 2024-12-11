namespace Domain.Ammortamenti;

public interface IPianoAmmortamentoRepository
{
    void Insert(PianoDiAmmortamento pianoDiAmmortamento);
    PianoDiAmmortamento GetById(long reqIdPianoDiAmmortamento);
    void Update(PianoDiAmmortamento pianoDiAmmortamento);

    List<PianoDiAmmortamento> GetPianiAmmortmantoConScadenzeNelPeriodo(MeseAnnoRange rperiodo);
}