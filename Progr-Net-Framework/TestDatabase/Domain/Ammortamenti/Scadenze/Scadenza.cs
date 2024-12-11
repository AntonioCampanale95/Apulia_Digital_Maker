using Domain.Beneficiari;
using RepoLibrary;

namespace Domain.Ammortamenti.Scadenze;

public class Scadenza: BaseEntity
{
    private readonly MeseAnno _meseScadenza;
    private readonly Beneficiario _beneficiario;
    private  decimal? _importo;
    private readonly PianoDiAmmortamento _pianoDiAmmortamento;
    private StatoScadenza _stato = StatoScadenza.NonPagato;
    
    public string Notes { get; set; }
    
    
    public Scadenza(MeseAnno scadenza, 
        Beneficiario beneficiario,
        decimal? importo,
        PianoDiAmmortamento pianoDiAmmortamento)
    {
        _meseScadenza = scadenza ?? throw new ArgumentNullException(nameof(scadenza));
        _beneficiario = beneficiario;
        _importo = importo;
        _pianoDiAmmortamento = pianoDiAmmortamento ?? throw new ArgumentNullException(nameof(pianoDiAmmortamento));
    }

    

    public MeseAnno MeseScadenza => _meseScadenza;

    public Beneficiario Beneficiario => _beneficiario;

    public decimal? Importo => _importo;

    public PianoDiAmmortamento PianoDiAmmortamento => _pianoDiAmmortamento;

    public StatoScadenza Stato => _stato;

    public void EffettuaPagamento(decimal? reqImporto, StatoScadenza reqStatoScadenza, string reqAnnotazioni)
    {
        _importo = reqImporto;
        _stato = reqStatoScadenza;
        Notes = reqAnnotazioni;
        
    }
}

public enum StatoScadenza
{
    Pagato,
    NonPagato,
    Sospesa
}