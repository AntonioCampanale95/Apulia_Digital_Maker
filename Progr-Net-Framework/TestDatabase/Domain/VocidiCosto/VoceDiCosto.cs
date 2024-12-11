using RepoLibrary;

namespace Domain.VocidiCosto;

public class VoceDiCosto:BaseEntity
{
  
    
    private string _descrizione;

    public string Descrizione
    {
        get
        {
            return _descrizione;
        }
        set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("La descrizone non può esserre nulla");
            _descrizione = value;
        }
    }
}