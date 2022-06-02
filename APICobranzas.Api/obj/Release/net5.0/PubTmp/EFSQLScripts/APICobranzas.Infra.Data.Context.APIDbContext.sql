IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [Bancos] (
        [Id] int NOT NULL IDENTITY,
        [Nombre] nvarchar(max) NULL,
        CONSTRAINT [PK_Bancos] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [Contactos] (
        [Id] int NOT NULL IDENTITY,
        [Tipo] nvarchar(max) NULL,
        CONSTRAINT [PK_Contactos] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [Estados] (
        [Id] int NOT NULL IDENTITY,
        [Detalle] nvarchar(max) NULL,
        CONSTRAINT [PK_Estados] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [FormasPago] (
        [Id] int NOT NULL IDENTITY,
        [Forma] nvarchar(max) NULL,
        CONSTRAINT [PK_FormasPago] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [NotasCredito] (
        [Id] int NOT NULL IDENTITY,
        [Fecha] datetime2 NULL,
        [Total] float NOT NULL,
        [Anulado] bit NOT NULL,
        CONSTRAINT [PK_NotasCredito] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [PuntosVenta] (
        [Id] int NOT NULL IDENTITY,
        [Numero] int NOT NULL,
        [Punto] nvarchar(max) NULL,
        CONSTRAINT [PK_PuntosVenta] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [Respuestas] (
        [Id] int NOT NULL IDENTITY,
        [Detalle] nvarchar(max) NULL,
        CONSTRAINT [PK_Respuestas] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [TiposPrestador] (
        [Id] int NOT NULL IDENTITY,
        [Tipo] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_TiposPrestador] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [PuntoVentaId] int NOT NULL,
        [Apellido] nvarchar(max) NULL,
        [Nombre] nvarchar(max) NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUsers_PuntosVenta_PuntoVentaId] FOREIGN KEY ([PuntoVentaId]) REFERENCES [PuntosVenta] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [Recibos] (
        [Id] int NOT NULL IDENTITY,
        [Total] decimal(10,2) NOT NULL,
        [Fecha] smalldatetime NOT NULL,
        [Anulado] bit NOT NULL,
        [PuntoVentaId] int NULL,
        CONSTRAINT [PK_Recibos] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Recibos_PuntosVenta_PuntoVentaId] FOREIGN KEY ([PuntoVentaId]) REFERENCES [PuntosVenta] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [ObrasSociales] (
        [Id] int NOT NULL IDENTITY,
        [Rnos] bigint NOT NULL,
        [Nombre] nvarchar(max) NOT NULL,
        [Cuit] bigint NOT NULL,
        [Tel] nvarchar(max) NULL,
        [Direccion] nvarchar(max) NULL,
        [CP] bigint NOT NULL,
        [Pagina] nvarchar(max) NULL,
        [HorarioAdmin] nvarchar(max) NULL,
        [ContactoAdmin1] nvarchar(max) NULL,
        [ContactoAdmin2] nvarchar(max) NULL,
        [TelAdmin] bigint NULL,
        [ContactoGeren1] nvarchar(max) NULL,
        [ContactoGeren2] nvarchar(max) NULL,
        [TelGeren] bigint NULL,
        [Mailgeren] nvarchar(max) NULL,
        [Observaciones] nvarchar(max) NULL,
        [TipoPrestadorId] int NOT NULL,
        CONSTRAINT [PK_ObrasSociales] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ObrasSociales_TiposPrestador_TipoPrestadorId] FOREIGN KEY ([TipoPrestadorId]) REFERENCES [TiposPrestador] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [Facturas] (
        [Id] int NOT NULL IDENTITY,
        [ObraSocialId] int NOT NULL,
        [PuntoventaId] int NOT NULL,
        [FechaEmision] smalldatetime NOT NULL DEFAULT (getdate()),
        [FechaUltPago] smalldatetime NULL,
        [FechaAcuse] smalldatetime NULL DEFAULT (getdate()),
        [ImporteDebe] AS [ImporteFactura] - [ImporteCobrado] PERSISTED,
        [ImporteFactura] decimal(10,2) NOT NULL,
        [ImporteCobrado] decimal(10,2) NULL,
        [EstadoId] int NULL,
        [Observacion] nvarchar(max) NULL,
        CONSTRAINT [PK_Facturas] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Facturas_Estados_EstadoId] FOREIGN KEY ([EstadoId]) REFERENCES [Estados] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Facturas_ObrasSociales_ObraSocialId] FOREIGN KEY ([ObraSocialId]) REFERENCES [ObrasSociales] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Facturas_PuntosVenta_PuntoventaId] FOREIGN KEY ([PuntoventaId]) REFERENCES [PuntosVenta] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [Gestiones] (
        [Id] int NOT NULL IDENTITY,
        [ObraSocialId] int NOT NULL,
        [ContactoId] int NOT NULL,
        [FechaContacto] smalldatetime NOT NULL,
        [RespuestaId] int NOT NULL,
        [FechaProxContacto] smalldatetime NULL,
        [ApplicationUserId] nvarchar(450) NOT NULL,
        [Observacion] nvarchar(max) NULL,
        CONSTRAINT [PK_Gestiones] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Gestiones_AspNetUsers_ApplicationUserId] FOREIGN KEY ([ApplicationUserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Gestiones_Contactos_ContactoId] FOREIGN KEY ([ContactoId]) REFERENCES [Contactos] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Gestiones_ObrasSociales_ObraSocialId] FOREIGN KEY ([ObraSocialId]) REFERENCES [ObrasSociales] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Gestiones_Respuestas_RespuestaId] FOREIGN KEY ([RespuestaId]) REFERENCES [Respuestas] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [FacturaNota] (
        [FacturaId] int NOT NULL,
        [NotaCreditoId] int NOT NULL,
        [FormaPagoId] int NOT NULL,
        [Subtotal] decimal(10,2) NOT NULL,
        CONSTRAINT [PK_FacturaNota] PRIMARY KEY ([FacturaId], [NotaCreditoId]),
        CONSTRAINT [FK_FacturaNota_Facturas_FacturaId] FOREIGN KEY ([FacturaId]) REFERENCES [Facturas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_FacturaNota_FormasPago_FormaPagoId] FOREIGN KEY ([FormaPagoId]) REFERENCES [FormasPago] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_FacturaNota_NotasCredito_NotaCreditoId] FOREIGN KEY ([NotaCreditoId]) REFERENCES [NotasCredito] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE TABLE [FacturaRecibo] (
        [FacturaId] int NOT NULL,
        [ReciboId] int NOT NULL,
        [FormaPagoId] int NOT NULL,
        [NroChequeTransf] nvarchar(max) NOT NULL,
        [NroReciboTes] nvarchar(max) NOT NULL,
        [BancoId] int NOT NULL,
        [SubTotal] decimal(10,2) NOT NULL,
        CONSTRAINT [PK_FacturaRecibo] PRIMARY KEY ([FacturaId], [ReciboId]),
        CONSTRAINT [FK_FacturaRecibo_Bancos_BancoId] FOREIGN KEY ([BancoId]) REFERENCES [Bancos] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_FacturaRecibo_Facturas_FacturaId] FOREIGN KEY ([FacturaId]) REFERENCES [Facturas] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_FacturaRecibo_FormasPago_FormaPagoId] FOREIGN KEY ([FormaPagoId]) REFERENCES [FormasPago] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_FacturaRecibo_Recibos_ReciboId] FOREIGN KEY ([ReciboId]) REFERENCES [Recibos] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''3e2c6abd-5118-451e-83b6-896778212ddd'', N''d3440a1d-ef6f-400e-8a93-e3abc4f9aba5'', N''User'', N''USER'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''9aa3982e-5463-4fdb-8bda-2ae643500be7'', N''067ae3d1-e247-4a68-9469-fd31c7932fbe'', N''Administrator'', N''ADMINISTRATOR'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_AspNetUsers_PuntoVentaId] ON [AspNetUsers] ([PuntoVentaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_FacturaNota_FormaPagoId] ON [FacturaNota] ([FormaPagoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_FacturaNota_NotaCreditoId] ON [FacturaNota] ([NotaCreditoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_FacturaRecibo_BancoId] ON [FacturaRecibo] ([BancoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_FacturaRecibo_FormaPagoId] ON [FacturaRecibo] ([FormaPagoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_FacturaRecibo_ReciboId] ON [FacturaRecibo] ([ReciboId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Facturas_EstadoId] ON [Facturas] ([EstadoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Facturas_ObraSocialId] ON [Facturas] ([ObraSocialId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Facturas_PuntoventaId] ON [Facturas] ([PuntoventaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Gestiones_ApplicationUserId] ON [Gestiones] ([ApplicationUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Gestiones_ContactoId] ON [Gestiones] ([ContactoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Gestiones_ObraSocialId] ON [Gestiones] ([ObraSocialId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Gestiones_RespuestaId] ON [Gestiones] ([RespuestaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_ObrasSociales_TipoPrestadorId] ON [ObrasSociales] ([TipoPrestadorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE UNIQUE INDEX [IX_PuntosVenta_Numero] ON [PuntosVenta] ([Numero]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    CREATE INDEX [IX_Recibos_PuntoVentaId] ON [Recibos] ([PuntoVentaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211203193701_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20211203193701_initial', N'5.0.12');
END;
GO

COMMIT;
GO

