namespace Domain.Beneficiari;

public interface IBeneficiarioRepository
{
    List<Beneficiario> GetAll();
    Beneficiario GetById(long id);
    void Insert(Beneficiario beneficiario);
}