namespace Domain.Ammortamenti;

public class Anno
{
    private readonly int _annoSelezionato;

    private Anno(int anno)
    {
        if (anno < 2000 || anno > 2100)
        {
            throw new ArgumentException("Anno deve essere compreso tra 2000 e 2100");
        }
        _annoSelezionato = anno;
    }

    public override bool Equals(object? obj)
    {
        Anno? other = obj as Anno;
        if (other == null)
            return false;
        return _annoSelezionato == other._annoSelezionato;
    
    }

    public static Anno Create(int anno)
    {
        return new Anno(anno);
    }

    public int AnnoSelezionato => _annoSelezionato;

    
}