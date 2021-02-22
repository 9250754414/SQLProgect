
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/22/2021 15:25:47
-- Generated from EDMX file: C:\Users\Asus\source\repos\SQLprogect\SQLprogect\Market.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CategoryProduct_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoryProduct] DROP CONSTRAINT [FK_CategoryProduct_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoryProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CategoryProduct] DROP CONSTRAINT [FK_CategoryProduct_Product];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ProductSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO
IF OBJECT_ID(N'[dbo].[CategoryProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategoryProduct];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ProductSet'
CREATE TABLE [dbo].[ProductSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategoryProduct'
CREATE TABLE [dbo].[CategoryProduct] (
    [Category_Id] int  NOT NULL,
    [Product_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [PK_ProductSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Category_Id], [Product_Id] in table 'CategoryProduct'
ALTER TABLE [dbo].[CategoryProduct]
ADD CONSTRAINT [PK_CategoryProduct]
    PRIMARY KEY CLUSTERED ([Category_Id], [Product_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_Id] in table 'CategoryProduct'
ALTER TABLE [dbo].[CategoryProduct]
ADD CONSTRAINT [FK_CategoryProduct_Category]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Product_Id] in table 'CategoryProduct'
ALTER TABLE [dbo].[CategoryProduct]
ADD CONSTRAINT [FK_CategoryProduct_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[ProductSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryProduct_Product'
CREATE INDEX [IX_FK_CategoryProduct_Product]
ON [dbo].[CategoryProduct]
    ([Product_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------