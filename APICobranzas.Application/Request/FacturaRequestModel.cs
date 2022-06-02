using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APICobranzas.Application.Request
{
   public class FacturaRequestModel
    {
        [Required(ErrorMessage = "Obra social requerida")]
        public int ObraSocialId { get; set; }
        [Required(ErrorMessage = "Ingrese un importe")]
        public decimal ImporteFactura { get; set; }
        public string Observacion { get; set; }
    }
}
