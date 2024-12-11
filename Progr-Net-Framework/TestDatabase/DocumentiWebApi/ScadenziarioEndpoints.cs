using DocumentiWebApi.Dtos;
using Domain.Ammortamenti;
using Domain.Scadenziario;
using Microsoft.AspNetCore.Mvc;

namespace DocumentiWebApi;

public class ScadenziarioEndpoints
{
    public static void SetupEndpoints(WebApplication app)
    {
        app.MapGet("/scadenziario", (
            [FromQuery] int annoDa,
            [FromQuery] int meseDa,
            [FromQuery] int annoA,
            [FromQuery] int meseA,
            [FromServices] ScadenziarioService svc) =>
        {


            MeseAnnoRange r = MeseAnnoRange.Create(
                MeseAnno.Create(Mese.Create(meseDa), Anno.Create(annoDa)),
                MeseAnno.Create(Mese.Create(meseA), Anno.Create(annoA))
            );
            
            List<PianoDiAmmortamento> scadenziario = svc.CreaScadenziario(r);
            
            return new ScadenziarioDto(annoDa, meseDa, annoA, meseA, scadenziario);
        });
        
        
        
    }
}