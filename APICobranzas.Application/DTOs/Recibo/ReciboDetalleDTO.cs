using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace APICobranzas.Application.DTOs
{
   public class ReciboDetalleDTO
    {
        public int Id { get; set; }
        [DisplayName("N°")]
        public string Nro { get; set; }   
        public decimal Total { get; set; }
        public DateTime Fecha { get; set; }
        public FormaPagoDTO FormaPago { get; set; }
        [DisplayName("N° de Cheque o transferencia")]
        public string NroChequeTransf { get; set; }
        [DisplayName("N° recibo tesoreria")]
        public string NroReciboTes { get; set; }
        public BancoDTO Banco { get; set; }
        public IList<DetalleFacturasReciboDTO> Detalles { get; set; }
    }
}
