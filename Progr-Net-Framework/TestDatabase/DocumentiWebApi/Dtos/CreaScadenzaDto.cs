namespace DocumentiWebApi.Dtos;

public class CreaScadenzaDto
{
    public long BeneficiarioId { get; set; }
    public decimal?  Importo { get; set; }
    public int Mese { get; set; }
    public int Anno { get; set; }
}