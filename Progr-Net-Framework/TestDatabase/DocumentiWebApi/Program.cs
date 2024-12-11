using DocumentiWebApi;
using Domain.Ammortamenti;
using Domain.Ammortamenti.Scadenze;
using Domain.Beneficiari;
using Domain.Scadenziario;
using Domain.VocidiCosto;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IVoceDiCostoRepository, VoceDiCostoFakeRepository>();
builder.Services.AddScoped<IBeneficiarioRepository, BeneficiarioFakeRepository>();
builder.Services.AddScoped<IScadenzeRepository, ScadenzaFakeRepository>();
builder.Services.AddScoped<IPianoAmmortamentoRepository, PianoAmmortamentoFakeRepository>();
builder.Services.AddScoped<PianoDiAmmortamentoService>();
builder.Services.AddScoped<ScadenziarioService>();
builder.Services.AddAutoMapper(typeof(Program).Assembly);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

VociDiCostoEndPoints.SetupVociDiCostoEndpoints(app);
PianoDiAmmortamentoEndpoints.SetupEndpoints(app);
BeneficiariEndpoints.SetupEndpoints(app);
ScadenzeEndpoints.setupEndPoints(app);



app.Run();

