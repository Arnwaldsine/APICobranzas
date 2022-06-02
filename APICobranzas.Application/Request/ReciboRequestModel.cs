using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APICobranzas.Application.Request
{
    public class ReciboRequestModel
    {
       public string? Observaciones { get; set; }
        [Required(ErrorMessage = "Metodo de pago requerido")]
        public IList<FacturaReciboRequestModel> Detalles {get;set;}
    }
}
