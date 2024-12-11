namespace Domain.VocidiCosto;

public interface IVoceDiCostoRepository
{
    List<VoceDiCosto> GetAll();
    VoceDiCosto GetById(long id);
    void Insert(VoceDiCosto voceDiCosto);
}