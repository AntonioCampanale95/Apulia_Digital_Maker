namespace Domain.Ammortamenti;

public class Mese
{
    private readonly int _meseSelezionato;

    private Mese(int mese)
    {
        if (mese < 1 || mese > 12)
        {
            throw new ArgumentException("Mese deve essere compreso tra 1 e 12");
        }
        _meseSelezionato = mese;
    }

    public override bool Equals(object? obj)
    {
        Mese? other = obj as Mese;
        if (other == null)
            return false;
        return _meseSelezionato == other._meseSelezionato;
    
    
    }

    public static Mese Create(int mese)
    {
        return new Mese(mese);
    }

    public int MeseSelezionato => _meseSelezionato;
}