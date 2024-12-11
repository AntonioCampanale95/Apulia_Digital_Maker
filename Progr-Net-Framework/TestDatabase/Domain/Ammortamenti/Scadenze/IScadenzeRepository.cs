namespace Domain.Ammortamenti.Scadenze;

public interface IScadenzeRepository
{
    Scadenza GetById(long id);
}