using AutoMapper;
using DocumentiWebApi.Dtos;
using Domain.Ammortamenti;
using Domain.Ammortamenti.Scadenze;
using Microsoft.AspNetCore.Mvc;

namespace DocumentiWebApi;

public class ScadenzeEndpoints
{
    public static void setupEndPoints(WebApplication app)
    {
        app.MapPut("/scadenze/{id}/pagamento", (
            [FromRoute]long id,
            [FromBody]EfffettuaPagamentoDto dto,
            [FromServices] PianoDiAmmortamentoService paService,
            [FromServices] IMapper mapper) =>
        {
            EffettuaPagamentoRequest req = mapper.Map<EffettuaPagamentoRequest>(dto);
            req.ScadenzaId = id;
            paService.EffettuaPagamento(req);
            return Results.Ok();
        });
    }
}