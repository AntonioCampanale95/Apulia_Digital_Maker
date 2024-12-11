namespace Domain.VocidiCosto;

public class VoceDiCostoFakeRepository:IVoceDiCostoRepository
{
    public List<VoceDiCosto> GetAll()
    {
        VoceDiCosto v = new VoceDiCosto()
        {
            Descrizione = "Test1"
        };
        VoceDiCosto v1 = new VoceDiCosto()
        {
            Descrizione = "Test2"
        };
        VoceDiCosto v2 = new VoceDiCosto()
        {
            Descrizione = "Test3"
        };
        return new List<VoceDiCosto>(){v, v1,v2};
    }

    public VoceDiCosto GetById(long id)
    {
        return new VoceDiCosto()
        {
            Id = id,
            Descrizione = "Test"
        };
    }

    public void Insert(VoceDiCosto voceDiCosto)
    {
        voceDiCosto.Id = Random.Shared.Next(200, 500);
    }
}