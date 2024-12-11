using AutoMapper;
using DocumentiWebApi.Dtos;
using Domain.Beneficiari;
using Microsoft.AspNetCore.Mvc;

namespace DocumentiWebApi;

public class BeneficiariEndpoints
{
    public static void SetupEndpoints(WebApplication app)
    {
        app.MapGet("/beneficiari", ([FromServices] IBeneficiarioRepository vRep,
            [FromServices] IMapper mapper) =>
        {
            var voci = vRep.GetAll();
            return mapper.Map<List<BeneficiarioDto>>(voci);
        });
        
        app.MapGet("/beneficiari/{id}", ([FromServices] IBeneficiarioRepository vRep,
            [FromServices] IMapper mapper, [FromRoute] long id) =>
        {
            var voci = vRep.GetById(id);
            return mapper.Map<BeneficiarioDto>(voci);
        });
        
        app.MapPost("/beneficiari", ([FromServices] IBeneficiarioRepository vRep,
            [FromBody] BeneficiarioDto BeneficiarioDto) =>
        {
            var voce = new Beneficiario()
            {
                Descrizione = BeneficiarioDto.Descrizione
            };
            vRep.Insert(voce);
            return voce.Id;
        });
    }
}