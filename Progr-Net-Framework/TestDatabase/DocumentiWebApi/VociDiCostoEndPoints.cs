using AutoMapper;
using DocumentiWebApi.Dtos;
using Domain.VocidiCosto;
using Microsoft.AspNetCore.Mvc;

namespace DocumentiWebApi;

public class VociDiCostoEndPoints
{
    public static void SetupVociDiCostoEndpoints(WebApplication app)
    {
        app.MapGet("/vocidicosto", ([FromServices] IVoceDiCostoRepository vRep,
            [FromServices] IMapper mapper) =>
        {
            var voci = vRep.GetAll();
            return mapper.Map<List<VoceDiCostoDto>>(voci);
        });
        
        app.MapGet("/vocidicosto/{id}", ([FromServices] IVoceDiCostoRepository vRep,
            [FromServices] IMapper mapper, [FromRoute] long id) =>
        {
            var voci = vRep.GetById(id);
            return mapper.Map<VoceDiCostoDto>(voci);
        });
        
        app.MapPost("/vocidicosto", ([FromServices] IVoceDiCostoRepository vRep,
            [FromBody] VoceDiCostoDto voceDiCostoDto) =>
        {
            var voce = new VoceDiCosto()
            {
                Descrizione = voceDiCostoDto.Descrizione
            };
            vRep.Insert(voce);
            return voce.Id;
        });
    }
}