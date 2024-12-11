using AutoMapper;
using DocumentiWebApi.Dtos;
using Domain.Ammortamenti;
using Domain.Ammortamenti.Scadenze;
using Domain.Beneficiari;
using Domain.VocidiCosto;

namespace DocumentiWebApi.Profiles;

public class ProfileData:Profile
{
    public ProfileData()
    {
        CreateMap<VoceDiCosto, VoceDiCostoDto>();
        CreateMap<VoceDiCostoDto, VoceDiCosto>();
        
        CreateMap<BeneficiarioDto, Beneficiario>();
        CreateMap<Beneficiario, BeneficiarioDto>();
        
        CreateMap<Scadenza, ScadenzaDto>()
            .ForMember(a => a.Anno, 
                b => 
                    b.MapFrom(c => c.MeseScadenza.Anno.AnnoSelezionato))
            .ForMember(a => a.Mese, 
                b => 
                    b.MapFrom(c => c.MeseScadenza.Mese.MeseSelezionato));
        
        CreateMap<CreaScadenzaDto, AggiungiScadenzaRequest>();

        CreateMap<EfffettuaPagamentoDto, EffettuaPagamentoRequest>();
        
        CreateMap<CreaPianoAmmortamentoDto, PianoDiAmmortamentoRequest>();
        CreateMap<PianoDiAmmortamento, PianoDiAmmortamentoDto>()
            .ForMember(a => a.AnnoA, 
                b => 
                    b.MapFrom(c => c.Periodo.MeseFinale.Anno.AnnoSelezionato))
            .ForMember(a => a.MeseA, 
                b => 
                    b.MapFrom(c => c.Periodo.MeseFinale.Mese.MeseSelezionato))
            
            .ForMember(a => a.AnnoDa, 
                b => 
                    b.MapFrom(c => c.Periodo.MeseIniziale.Anno.AnnoSelezionato))
            .ForMember(a => a.MeseDa, 
                b => 
                    b.MapFrom(c => c.Periodo.MeseIniziale.Mese.MeseSelezionato));

    }
}