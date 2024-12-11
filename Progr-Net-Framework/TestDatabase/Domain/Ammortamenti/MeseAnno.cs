namespace Domain.Ammortamenti;

public class MeseAnno
{
    private readonly Mese _mese;
    private readonly Anno _anno;

    private MeseAnno(Mese mese, Anno anno)
    {
        _mese = mese ?? throw new ArgumentNullException(nameof(mese));
        _anno = anno ?? throw new ArgumentNullException(nameof(anno));
    }

    public static MeseAnno Create(Mese mese, Anno anno)
    {
        return new MeseAnno(mese, anno);
    }

    public override bool Equals(object? obj)
    {
        MeseAnno? other = obj as MeseAnno;
        if (other == null)
            return false;
        return _mese == other._mese && _anno == other._anno;
    }

    public Mese Mese => _mese;

    public Anno Anno => _anno;


    public MeseAnno ForYear(int anno)
    {
        return new MeseAnno(_mese, Anno.Create(anno));
    }
}