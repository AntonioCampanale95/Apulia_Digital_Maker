using Domain.Ammortamenti.Scadenze;
using Domain.Beneficiari;
using Domain.VocidiCosto;

namespace Domain.Ammortamenti;

public class PianoDiAmmortamentoService
{
    private readonly IVoceDiCostoRepository _vociDiCostoRepository;
    private readonly IPianoAmmortamentoRepository _pianoAmmortamentoRepository;
    private readonly IBeneficiarioRepository _beneficiarioRepository;
    private readonly IScadenzeRepository _scadenzeRepository;

    public PianoDiAmmortamentoService(IVoceDiCostoRepository vociDiCostoRepository,
        IPianoAmmortamentoRepository pianoAmmortamentoRepository,
        IBeneficiarioRepository beneficiarioRepository,
        IScadenzeRepository scadenzeRepository)
    {
        _vociDiCostoRepository = vociDiCostoRepository;
        _pianoAmmortamentoRepository = pianoAmmortamentoRepository;
        _beneficiarioRepository = beneficiarioRepository;
        _scadenzeRepository = scadenzeRepository;
    }
    public PianoDiAmmortamento CreaPiano(PianoDiAmmortamentoRequest req)
    {
        VoceDiCosto v = _vociDiCostoRepository.GetById(req.VoceDiCostoId);
        MeseAnnoRange periodo = MeseAnnoRange.Create(
            MeseAnno.Create(Mese.Create(req.MeseDa),Anno.Create(req.AnnoDa)), 
            MeseAnno.Create(Mese.Create(req.MeseA),Anno.Create(req.AnnoA)));
            
         PianoDiAmmortamento p = new PianoDiAmmortamento(v, periodo);
        _pianoAmmortamentoRepository.Insert(p);
         return p;
    }

    public void AggiungiScadenza(AggiungiScadenzaRequest req)
    {
        PianoDiAmmortamento a = _pianoAmmortamentoRepository.GetById(req.IdPianoDiAmmortamento);
        Beneficiario b = _beneficiarioRepository.GetById(req.IdBeneficiario);
        
        a.AggiungiScadenza(MeseAnno.Create(Mese.Create(req.Mese), Anno.Create(req.Anno)),b,req.Importo );
        
        _pianoAmmortamentoRepository.Update(a);
        
        
    }

    public long ClonaPianoAmmortamento(long id, int anno)
    {
        PianoDiAmmortamento p = _pianoAmmortamentoRepository.GetById(id);
        PianoDiAmmortamento clone = p.Clone(anno);
        _pianoAmmortamentoRepository.Insert(clone);
        return clone.Id;
    }

    public void EffettuaPagamento(EffettuaPagamentoRequest req)
    {
        Scadenza sc = _scadenzeRepository.GetById(req.ScadenzaId);
        PianoDiAmmortamento p = _pianoAmmortamentoRepository.GetById(sc.PianoDiAmmortamento.Id);
        p.EffettuaPagamento(sc, req.Importo, req.StatoScadenza, req.Annotazioni);
    }
}