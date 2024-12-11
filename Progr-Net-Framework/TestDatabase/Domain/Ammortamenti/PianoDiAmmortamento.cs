using Domain.Ammortamenti.Scadenze;
using Domain.Beneficiari;
using Domain.VocidiCosto;
using RepoLibrary;

namespace Domain.Ammortamenti;

public class PianoDiAmmortamento: BaseEntity
{
    private readonly VoceDiCosto _vodeDiCosto;
    private readonly MeseAnnoRange _periodo;
    private readonly TipoAmmortamento _tipoAmmortamento;
    private decimal? _importo;
    private List<Scadenza> _scadenze = new List<Scadenza>();
    private StatoPianoAmmortamento _stato = StatoPianoAmmortamento.Aperto;
    
    
    
    public PianoDiAmmortamento(VoceDiCosto vodeDiCosto,
        MeseAnnoRange periodo)
    {
        _vodeDiCosto = vodeDiCosto ?? throw new ArgumentNullException(nameof(vodeDiCosto));
        _periodo = periodo ?? throw new ArgumentNullException(nameof(periodo));
       if (periodo.IsAnnuale)
           _tipoAmmortamento = TipoAmmortamento.Annuale;
       else 
            _tipoAmmortamento = TipoAmmortamento.Periodico;
    }

    public VoceDiCosto VodeDiCosto => _vodeDiCosto;

    public MeseAnnoRange Periodo => _periodo;

    public IReadOnlyList<Scadenza> Scadenze
    {
        get => _scadenze.AsReadOnly();
    }

    public StatoPianoAmmortamento Stato => _stato;


    public void AggiungiScadenza(MeseAnno scadenza, Beneficiario beneficiario, decimal? importo)
    {
        Scadenza s = new Scadenza(scadenza, beneficiario, importo, this);

        if (_stato == StatoPianoAmmortamento.Chiuso)
        {
            throw new InvalidOperationException("Ammortamento chiuso");
           
        }
        
        ValidaInvariantiPerAggiuntaScadenza(s);
        
        _scadenze.Add(s);
    }
    
    public int NumRate
    {
        get => _scadenze.Count;
    }

    public decimal? Importo => _importo;

    public void SetImporto(decimal? importo)
    {
        if (_stato == StatoPianoAmmortamento.Chiuso)
            throw new InvalidOperationException("Scadenziario chiuso");

        _importo = importo;
    }
    
    public decimal ImportoResiduo
    {
        get
        {
            decimal importoResiduo = 0;
            foreach (var scadenza in _scadenze)
            {
                if (scadenza.Stato == StatoScadenza.Pagato)
                {
                    importoResiduo += scadenza.Importo ?? 0;
                }
            }

            return importoResiduo;
        }
        
    }

    public TipoAmmortamento TipoAmmortamento => _tipoAmmortamento;

    private void ValidaInvariantiPerAggiuntaScadenza(Scadenza scadenza)
    {
        //non devono esserci due scadenze uguali dove per uguale si intende stesso beneficiario
        // e stesso mese/anno

        VerificaScadenzeEsistenti(scadenza);

        //la scadenza deve essere compresa nel periodo del piano
        VerificaPeriodoContieneScadenza(scadenza);
    }

    private void VerificaPeriodoContieneScadenza(Scadenza scadenza)
    {
        if (_periodo.Contiene(scadenza.MeseScadenza) == false)
        {
            throw new InvalidOperationException("La scadenza non è compresa nel periodo del piano");
        }
    }

    private void VerificaScadenzeEsistenti(Scadenza scadenza)
    {
        foreach (var scadenzaEsistente in _scadenze)
        {
            if (scadenzaEsistente.MeseScadenza.Equals(scadenza.MeseScadenza) && 
                scadenzaEsistente.Beneficiario?.Id == scadenza.Beneficiario?.Id)
            {
                throw new InvalidOperationException("Non possono esserci due scadenze uguali");
            }
        }
    }

    public PianoDiAmmortamento Clone(int anno)
    {
        if (_tipoAmmortamento == TipoAmmortamento.Periodico)
            throw new InvalidOperationException("Solo per ammortamenti annuali");
        
        PianoDiAmmortamento clone = new PianoDiAmmortamento(_vodeDiCosto, 
            MeseAnnoRange.FromAnno(anno));
        foreach (var scadenza in _scadenze)
        {
            clone.AggiungiScadenza(scadenza.MeseScadenza.ForYear(anno), scadenza.Beneficiario, scadenza.Importo);
        }

        return clone;
    }

    public void EffettuaPagamento(Scadenza sc, decimal? reqImporto, StatoScadenza reqStatoScadenza, string reqAnnotazioni)
    {
        if (!_scadenze.Contains(sc))
            throw new InvalidOperationException("Scadenza non presente nel piano");
        
        sc.EffettuaPagamento(reqImporto, reqStatoScadenza, reqAnnotazioni);
        
        if (_scadenze.All(a => a.Stato == StatoScadenza.Pagato))
        {
            _stato = StatoPianoAmmortamento.Chiuso;
            return;
        }
        
        if (_scadenze.All(a => a.Stato == StatoScadenza.NonPagato))
        {
            _stato = StatoPianoAmmortamento.Aperto;
            return;
        }
        
        _stato = StatoPianoAmmortamento.InCorso;
    }
}

public enum TipoAmmortamento
{
    Annuale,
    Periodico
}

public enum StatoPianoAmmortamento
{
    Aperto,
    InCorso,
    Chiuso
}