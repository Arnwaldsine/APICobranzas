using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APICobranzas.Application.Request
{
   public class FacturaReciboRequestModel
    {
       public int FacturaId { get; set; }
       public int FormaPagoId { get; set; }
       [Required]
       public string NroChequeTransf { get; set; }
       [Required]
       public string NroReciboTes { get; set; }
        [Required]
        public int BancoId { get; set; }
        public decimal SubTotal { get; set; }
    }
}
