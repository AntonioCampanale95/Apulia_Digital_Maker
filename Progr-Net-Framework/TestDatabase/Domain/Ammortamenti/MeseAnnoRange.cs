namespace Domain.Ammortamenti;

public class MeseAnnoRange
{
    private readonly MeseAnno _meseIniziale;
    private readonly MeseAnno _meseFinale;

    private MeseAnnoRange(MeseAnno meseIniziale, MeseAnno meseFinale)
    {
        _meseIniziale = meseIniziale ?? throw new ArgumentNullException(nameof(meseIniziale));
        _meseFinale = meseFinale ?? throw new ArgumentNullException(nameof(meseFinale));
        
        
        if (_meseIniziale.Anno.AnnoSelezionato > _meseFinale.Anno.AnnoSelezionato)
        {
            throw new ArgumentException("AnnoDa deve essere minore o uguale ad AnnoA");
        }
        
        var annoDa = _meseIniziale.Anno.AnnoSelezionato;
        var annoA = _meseFinale.Anno.AnnoSelezionato;
        var meseDa = _meseIniziale.Mese.MeseSelezionato;
        var meseA = _meseFinale.Mese.MeseSelezionato;

        if (annoA == annoDa)
        {
            if (meseDa > meseA)
            {
                throw new ArgumentException("MeseDa deve essere minore o uguale ad MeseA");
            }
        }
        
    }

    public static MeseAnnoRange Create(MeseAnno meseIniziale, MeseAnno meseFinale)
    {
        return new MeseAnnoRange(meseIniziale, meseFinale);
    }

    public MeseAnno MeseIniziale => _meseIniziale;

    public MeseAnno MeseFinale => _meseFinale;

    public bool IsAnnuale
    {
        get
        {
            if (_meseIniziale.Anno.AnnoSelezionato == _meseFinale.Anno.AnnoSelezionato
                && _meseIniziale.Mese.MeseSelezionato == 1
                && _meseFinale.Mese.MeseSelezionato == 12)
            {
                return true;
            }

            return false;
        }
    }

    public bool Contiene(MeseAnno scadenzaMeseScadenza)
    {
        var annoScadenza = scadenzaMeseScadenza.Anno.AnnoSelezionato;
        var meseScadenza = scadenzaMeseScadenza.Mese.MeseSelezionato;
        var annoDa = _meseIniziale.Anno.AnnoSelezionato;
        var annoA = _meseFinale.Anno.AnnoSelezionato;
        var meseDa = _meseIniziale.Mese.MeseSelezionato;
        var meseA = _meseFinale.Mese.MeseSelezionato;

        if (annoScadenza < annoDa || annoScadenza > annoA)
        {
            return false;
        }

        if (annoScadenza == annoDa && meseScadenza < meseDa)
        {
            return false;
        }

        if (annoScadenza == annoA && meseScadenza > meseA)
        {
            return false;
        }

        return true;
         
    }

    public static MeseAnnoRange FromAnno(int anno)
    {
        return new MeseAnnoRange(
            MeseAnno.Create(Mese.Create(1), Anno.Create(anno)), 
            MeseAnno.Create(Mese.Create(12), Anno.Create(anno)));
    }
}