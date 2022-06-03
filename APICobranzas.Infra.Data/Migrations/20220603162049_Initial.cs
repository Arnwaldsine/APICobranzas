using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace APICobranzas.Infra.Data.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Bancos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Nombre = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bancos", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Contactos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Tipo = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Contactos", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Estados",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Detalle = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Estados", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "FormasPago",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Forma = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FormasPago", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IdentityRole",
                columns: table => new
                {
                    Id = table.Column<string>(type: "TEXT", nullable: false),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    NormalizedName = table.Column<string>(type: "TEXT", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IdentityRole", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PuntosVenta",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Numero = table.Column<int>(type: "INTEGER", nullable: false),
                    Punto = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PuntosVenta", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Respuestas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Detalle = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Respuestas", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TiposPrestador",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Tipo = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TiposPrestador", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "NotasCredito",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Fecha = table.Column<DateTime>(type: "TEXT", nullable: true),
                    Total = table.Column<decimal>(type: "TEXT", nullable: false),
                    Anulado = table.Column<bool>(type: "INTEGER", nullable: false),
                    Observaciones = table.Column<string>(type: "TEXT", nullable: true),
                    PuntoVentaId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NotasCredito", x => x.Id);
                    table.ForeignKey(
                        name: "FK_NotasCredito_PuntosVenta_PuntoVentaId",
                        column: x => x.PuntoVentaId,
                        principalTable: "PuntosVenta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Recibos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Total = table.Column<decimal>(type: "TEXT", precision: 10, scale: 2, nullable: false),
                    Fecha = table.Column<DateTime>(type: "smalldatetime", nullable: false),
                    Anulado = table.Column<bool>(type: "INTEGER", nullable: false),
                    Observaciones = table.Column<string>(type: "TEXT", nullable: true),
                    PuntoVentaId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Recibos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Recibos_PuntosVenta_PuntoVentaId",
                        column: x => x.PuntoVentaId,
                        principalTable: "PuntosVenta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Usuarios",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    PuntoVentaId = table.Column<int>(type: "INTEGER", nullable: false),
                    Nombre = table.Column<string>(type: "TEXT", nullable: true),
                    Apellido = table.Column<string>(type: "TEXT", nullable: true),
                    Email = table.Column<string>(type: "TEXT", nullable: true),
                    PasswordHash = table.Column<string>(type: "TEXT", nullable: true),
                    AceptaTerminos = table.Column<bool>(type: "INTEGER", nullable: false),
                    Rol = table.Column<int>(type: "INTEGER", nullable: false),
                    TokenDeVerificacion = table.Column<string>(type: "TEXT", nullable: true),
                    FechaVerificion = table.Column<DateTime>(type: "TEXT", nullable: true),
                    TokenReinicio = table.Column<string>(type: "TEXT", nullable: true),
                    FechaExpiracionTokenReseteo = table.Column<DateTime>(type: "TEXT", nullable: true),
                    FechaReseteoPassword = table.Column<DateTime>(type: "TEXT", nullable: true),
                    Creado = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Actualizado = table.Column<DateTime>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Usuarios", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Usuarios_PuntosVenta_PuntoVentaId",
                        column: x => x.PuntoVentaId,
                        principalTable: "PuntosVenta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ObrasSociales",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Rnos = table.Column<uint>(type: "INTEGER", nullable: false),
                    Nombre = table.Column<string>(type: "TEXT", nullable: false),
                    Cuit = table.Column<uint>(type: "INTEGER", nullable: false),
                    Tel = table.Column<string>(type: "TEXT", nullable: true),
                    Direccion = table.Column<string>(type: "TEXT", nullable: true),
                    CP = table.Column<uint>(type: "INTEGER", nullable: false),
                    Pagina = table.Column<string>(type: "TEXT", nullable: true),
                    HorarioAdmin = table.Column<string>(type: "TEXT", nullable: true),
                    ContactoAdmin1 = table.Column<string>(type: "TEXT", nullable: true),
                    ContactoAdmin2 = table.Column<string>(type: "TEXT", nullable: true),
                    TelAdmin = table.Column<uint>(type: "INTEGER", nullable: true),
                    ContactoGeren1 = table.Column<string>(type: "TEXT", nullable: true),
                    ContactoGeren2 = table.Column<string>(type: "TEXT", nullable: true),
                    TelGeren = table.Column<uint>(type: "INTEGER", nullable: true),
                    Mailgeren = table.Column<string>(type: "TEXT", nullable: true),
                    Observaciones = table.Column<string>(type: "TEXT", nullable: true),
                    TipoPrestadorId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ObrasSociales", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ObrasSociales_TiposPrestador_TipoPrestadorId",
                        column: x => x.TipoPrestadorId,
                        principalTable: "TiposPrestador",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "RefreshToken",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    AccountId = table.Column<int>(type: "INTEGER", nullable: false),
                    Token = table.Column<string>(type: "TEXT", nullable: true),
                    Expires = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Created = table.Column<DateTime>(type: "TEXT", nullable: false),
                    CreatedByIp = table.Column<string>(type: "TEXT", nullable: true),
                    Revoked = table.Column<DateTime>(type: "TEXT", nullable: true),
                    RevokedByIp = table.Column<string>(type: "TEXT", nullable: true),
                    ReplacedByToken = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RefreshToken", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RefreshToken_Usuarios_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Facturas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Nro = table.Column<string>(type: "TEXT", nullable: true),
                    ObraSocialId = table.Column<int>(type: "INTEGER", nullable: false),
                    PuntoventaId = table.Column<int>(type: "INTEGER", nullable: false),
                    FechaEmision = table.Column<DateTime>(type: "smalldatetime", nullable: false, defaultValueSql: "getdate()"),
                    FechaUltPago = table.Column<DateTime>(type: "smalldatetime", nullable: true),
                    FechaAcuse = table.Column<DateTime>(type: "smalldatetime", nullable: true, defaultValueSql: "getdate()"),
                    ImporteDebe = table.Column<decimal>(type: "TEXT", precision: 10, scale: 2, nullable: false, computedColumnSql: "[ImporteFactura] - [ImporteCobrado]", stored: true),
                    ImporteFactura = table.Column<decimal>(type: "TEXT", precision: 10, scale: 2, nullable: false),
                    ImporteCobrado = table.Column<decimal>(type: "TEXT", precision: 10, scale: 2, nullable: false),
                    EstadoId = table.Column<int>(type: "INTEGER", nullable: true),
                    Observacion = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Facturas", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Facturas_Estados_EstadoId",
                        column: x => x.EstadoId,
                        principalTable: "Estados",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Facturas_ObrasSociales_ObraSocialId",
                        column: x => x.ObraSocialId,
                        principalTable: "ObrasSociales",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Facturas_PuntosVenta_PuntoventaId",
                        column: x => x.PuntoventaId,
                        principalTable: "PuntosVenta",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Gestiones",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    ObraSocialId = table.Column<int>(type: "INTEGER", nullable: false),
                    ContactoId = table.Column<int>(type: "INTEGER", nullable: false),
                    FechaContacto = table.Column<DateTime>(type: "smalldatetime", nullable: false),
                    RespuestaId = table.Column<int>(type: "INTEGER", nullable: false),
                    FechaProxContacto = table.Column<DateTime>(type: "smalldatetime", nullable: true),
                    AccountId = table.Column<int>(type: "INTEGER", nullable: false),
                    Observacion = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Gestiones", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Gestiones_Contactos_ContactoId",
                        column: x => x.ContactoId,
                        principalTable: "Contactos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Gestiones_ObrasSociales_ObraSocialId",
                        column: x => x.ObraSocialId,
                        principalTable: "ObrasSociales",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Gestiones_Respuestas_RespuestaId",
                        column: x => x.RespuestaId,
                        principalTable: "Respuestas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Gestiones_Usuarios_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FacturaNota",
                columns: table => new
                {
                    FacturaId = table.Column<int>(type: "INTEGER", nullable: false),
                    NotaCreditoId = table.Column<int>(type: "INTEGER", nullable: false),
                    FormaPagoId = table.Column<int>(type: "INTEGER", nullable: false),
                    Subtotal = table.Column<decimal>(type: "TEXT", precision: 10, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FacturaNota", x => new { x.FacturaId, x.NotaCreditoId });
                    table.ForeignKey(
                        name: "FK_FacturaNota_Facturas_FacturaId",
                        column: x => x.FacturaId,
                        principalTable: "Facturas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FacturaNota_FormasPago_FormaPagoId",
                        column: x => x.FormaPagoId,
                        principalTable: "FormasPago",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FacturaNota_NotasCredito_NotaCreditoId",
                        column: x => x.NotaCreditoId,
                        principalTable: "NotasCredito",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FacturaRecibo",
                columns: table => new
                {
                    FacturaId = table.Column<int>(type: "INTEGER", nullable: false),
                    ReciboId = table.Column<int>(type: "INTEGER", nullable: false),
                    FormaPagoId = table.Column<int>(type: "INTEGER", nullable: false),
                    NroChequeTransf = table.Column<string>(type: "TEXT", nullable: false),
                    NroReciboTes = table.Column<string>(type: "TEXT", nullable: false),
                    BancoId = table.Column<int>(type: "INTEGER", nullable: false),
                    SubTotal = table.Column<decimal>(type: "TEXT", precision: 10, scale: 2, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FacturaRecibo", x => new { x.FacturaId, x.ReciboId });
                    table.ForeignKey(
                        name: "FK_FacturaRecibo_Bancos_BancoId",
                        column: x => x.BancoId,
                        principalTable: "Bancos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_FacturaRecibo_Facturas_FacturaId",
                        column: x => x.FacturaId,
                        principalTable: "Facturas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FacturaRecibo_FormasPago_FormaPagoId",
                        column: x => x.FormaPagoId,
                        principalTable: "FormasPago",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FacturaRecibo_Recibos_ReciboId",
                        column: x => x.ReciboId,
                        principalTable: "Recibos",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "IdentityRole",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "5816c74e-5626-4d6f-9a9e-9ef8009893eb", "2d61343e-10ff-47f3-a5b1-fa8701a7a132", "Usuario", "USUARIO" });

            migrationBuilder.InsertData(
                table: "IdentityRole",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "d738d8e0-9586-4c5b-ac4e-1138e80a3601", "b83693be-2a74-4915-9a4c-6f89824e2c01", "Administrador", "ADMINISTRADOR" });

            migrationBuilder.CreateIndex(
                name: "IX_FacturaNota_FormaPagoId",
                table: "FacturaNota",
                column: "FormaPagoId");

            migrationBuilder.CreateIndex(
                name: "IX_FacturaNota_NotaCreditoId",
                table: "FacturaNota",
                column: "NotaCreditoId");

            migrationBuilder.CreateIndex(
                name: "IX_FacturaRecibo_BancoId",
                table: "FacturaRecibo",
                column: "BancoId");

            migrationBuilder.CreateIndex(
                name: "IX_FacturaRecibo_FormaPagoId",
                table: "FacturaRecibo",
                column: "FormaPagoId");

            migrationBuilder.CreateIndex(
                name: "IX_FacturaRecibo_ReciboId",
                table: "FacturaRecibo",
                column: "ReciboId");

            migrationBuilder.CreateIndex(
                name: "IX_Facturas_EstadoId",
                table: "Facturas",
                column: "EstadoId");

            migrationBuilder.CreateIndex(
                name: "IX_Facturas_ObraSocialId",
                table: "Facturas",
                column: "ObraSocialId");

            migrationBuilder.CreateIndex(
                name: "IX_Facturas_PuntoventaId",
                table: "Facturas",
                column: "PuntoventaId");

            migrationBuilder.CreateIndex(
                name: "IX_Gestiones_AccountId",
                table: "Gestiones",
                column: "AccountId");

            migrationBuilder.CreateIndex(
                name: "IX_Gestiones_ContactoId",
                table: "Gestiones",
                column: "ContactoId");

            migrationBuilder.CreateIndex(
                name: "IX_Gestiones_ObraSocialId",
                table: "Gestiones",
                column: "ObraSocialId");

            migrationBuilder.CreateIndex(
                name: "IX_Gestiones_RespuestaId",
                table: "Gestiones",
                column: "RespuestaId");

            migrationBuilder.CreateIndex(
                name: "IX_NotasCredito_PuntoVentaId",
                table: "NotasCredito",
                column: "PuntoVentaId");

            migrationBuilder.CreateIndex(
                name: "IX_ObrasSociales_TipoPrestadorId",
                table: "ObrasSociales",
                column: "TipoPrestadorId");

            migrationBuilder.CreateIndex(
                name: "IX_PuntosVenta_Numero",
                table: "PuntosVenta",
                column: "Numero",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Recibos_PuntoVentaId",
                table: "Recibos",
                column: "PuntoVentaId");

            migrationBuilder.CreateIndex(
                name: "IX_RefreshToken_AccountId",
                table: "RefreshToken",
                column: "AccountId");

            migrationBuilder.CreateIndex(
                name: "IX_Usuarios_PuntoVentaId",
                table: "Usuarios",
                column: "PuntoVentaId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "FacturaNota");

            migrationBuilder.DropTable(
                name: "FacturaRecibo");

            migrationBuilder.DropTable(
                name: "Gestiones");

            migrationBuilder.DropTable(
                name: "IdentityRole");

            migrationBuilder.DropTable(
                name: "RefreshToken");

            migrationBuilder.DropTable(
                name: "NotasCredito");

            migrationBuilder.DropTable(
                name: "Bancos");

            migrationBuilder.DropTable(
                name: "Facturas");

            migrationBuilder.DropTable(
                name: "FormasPago");

            migrationBuilder.DropTable(
                name: "Recibos");

            migrationBuilder.DropTable(
                name: "Contactos");

            migrationBuilder.DropTable(
                name: "Respuestas");

            migrationBuilder.DropTable(
                name: "Usuarios");

            migrationBuilder.DropTable(
                name: "Estados");

            migrationBuilder.DropTable(
                name: "ObrasSociales");

            migrationBuilder.DropTable(
                name: "PuntosVenta");

            migrationBuilder.DropTable(
                name: "TiposPrestador");
        }
    }
}
