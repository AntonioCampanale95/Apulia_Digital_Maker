using AutoMapper;
using DocumentiWebApi.Dtos;
using Domain.Ammortamenti;
using Domain.Ammortamenti.Scadenze;
using Microsoft.AspNetCore.Mvc;

namespace DocumentiWebApi;

public class PianoDiAmmortamentoEndpoints
{
    public static void SetupEndpoints(WebApplication app)
    {
        app.MapPost("/pianidiammortamento", (
            [FromServices] IMapper mapper,
            [FromServices] PianoDiAmmortamentoService pService,
            [FromBody] CreaPianoAmmortamentoDto data) =>
        {
            PianoDiAmmortamentoRequest req = mapper.Map<PianoDiAmmortamentoRequest>(data);
            var p = pService.CreaPiano(req);
            return mapper.Map<PianoDiAmmortamentoDto>(p);
        });


        app.MapPost("/pianidiammortamento/{id}/scadenza", ([FromRoute]long idPa,
            [FromBody] CreaScadenzaDto data,
            [FromServices] PianoDiAmmortamentoService paService,
            [FromServices] IMapper mapper) =>
        {
            AggiungiScadenzaRequest req = mapper.Map<AggiungiScadenzaRequest>(data);
            req.IdPianoDiAmmortamento = idPa;
            paService.AggiungiScadenza(req);
            return Results.Ok();
        });
        
        
        
        app.MapPost("/pianidiammortamento/{id}/clone", ([FromRoute]long idPa,
            [FromBody] ClonePianoAmmortamentoDto data,
            [FromServices] PianoDiAmmortamentoService paService) =>
        {
            var idNuovoPiano = paService.ClonaPianoAmmortamento(idPa, data.Anno);
            return Results.Ok(idNuovoPiano);
        });
        
        
    }
}