namespace Domain.Beneficiari;

public class BeneficiarioFakeRepository:IBeneficiarioRepository
{
    public List<Beneficiario> GetAll()
    {
        Beneficiario v = new Beneficiario()
        {
            Descrizione = "Test1"
        };
        Beneficiario v1 = new Beneficiario()
        {
            Descrizione = "Test2"
        };
        Beneficiario v2 = new Beneficiario()
        {
            Descrizione = "Test3"
        };
        return new List<Beneficiario>(){v, v1,v2};
    }

    public Beneficiario GetById(long id)
    {
        return new Beneficiario()
        {
            Id = id,
            Descrizione = "Test"
        };
    }

    public void Insert(Beneficiario beneficiario)
    {
        beneficiario.Id = Random.Shared.Next(200, 500);
    }
}