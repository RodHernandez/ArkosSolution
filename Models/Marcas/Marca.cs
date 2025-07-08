using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ArkosWebApplication.Models.Proveedores;

namespace ArkosWebApplication.Models.Marcas
{
    public class Marca
    {
        public Marca()
        {
            Proveedores = new HashSet<Proveedor>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Nombre { get; set; }

        public bool Activo { get; set; } = true;

        public DateTime FechaRegistro { get; set; } = DateTime.Now;

        // Relación muchos a muchos con Proveedor
        public virtual ICollection<Proveedor> Proveedores { get; set; }
    }
} 