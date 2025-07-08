using System;
using System.ComponentModel.DataAnnotations;

namespace ArkosWebApplication.Models.Proveedores
{
    public class Proveedor
    {
        [Key]
        [StringLength(20)]
        public string Codigo { get; set; }

        [Required]
        [StringLength(200)]
        public string RazonSocial { get; set; }

        [Required]
        [StringLength(13)]
        public string RFC { get; set; }

        [StringLength(200)]
        public string NombreComercial { get; set; }

        public bool EsNacional { get; set; }

        [StringLength(200)]
        public string PaginaWeb { get; set; }

        [StringLength(18)]
        public string CLABE { get; set; }

        [StringLength(50)]
        public string Banco { get; set; }

        public bool Activo { get; set; } = true;

        public DateTime FechaRegistro { get; set; } = DateTime.Now;
    }
} 