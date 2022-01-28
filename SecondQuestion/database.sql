Create Database carrental
use carrental

=== Users ====
CREATE TABLE [dbo].[tblUser] (
    [UserId]   INT          IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (50) NULL,
    [Email]    VARCHAR (50) NULL,
    [Password] VARCHAR (50) NULL,
    [RoleType] INT          NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);




=== Categories ====
CREATE TABLE [dbo].[tblCategories] (
    [CatId] INT          IDENTITY (1, 1) NOT NULL,
    [Name]  VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([CatId] ASC)
);




=== Products ====
CREATE TABLE [dbo].[tblProducts] (
    [ProID]       INT            IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)   NULL,
	[carnumber]   varchar(50)    null,
    [Description] VARCHAR (50)   NULL,
    [Unit]        INT            NULL,
    [Image]       VARCHAR (1000) NULL,
    [CatId]       INT            NULL,
    PRIMARY KEY CLUSTERED ([ProID] ASC),
    CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY ([CatId]) REFERENCES [dbo].[tblCategories] ([CatId])
);


=== Order ====
CREATE TABLE [dbo].[tblOrder] (
    [OrderId]   INT           IDENTITY (1, 1) NOT NULL,
    [ProID]     INT           NULL,
    [Contact]   VARCHAR (50)  NULL,
    [Address]   VARCHAR (100) NULL,
    [Unit]      INT           NULL,
    [Qty]       INT           NULL,
    [Total]     INT           NULL,
    [OrderDate] DATE          NULL,
    [InvoiceId] INT           NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC),
    FOREIGN KEY ([InvoiceId]) REFERENCES [dbo].[tblInvoice] ([InvoiceId]),
    CONSTRAINT [FK_tblOrder_tblProducts] FOREIGN KEY ([ProID]) REFERENCES [dbo].[tblProducts] ([ProID])
);



--=== Invoice ====
CREATE TABLE [dbo].[tblInvoice] (
    [InvoiceId]   INT          IDENTITY (1, 1) NOT NULL,
    [UserId]      INT          NULL,
    [Bill]        INT          NULL,
    [Payment]     VARCHAR (50) NULL,
    [InvoiceDate] DATE         NULL,
    [Status]    tinyint        NULL,
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[tblUser] ([UserId])
);




create view user_invoices as
select tblInvoice.InvoiceId,  tblUser.Name as 'Customer', 
 tblInvoice.Bill,tblInvoice.Payment, tblInvoice.InvoiceDate
 from tblInvoice
inner join tblUser on tblUser.UserId = tblInvoice.UserId
where tblInvoice.UserId = ''

/* get all product for admin  */
create view vw_getallproducts as
select tblProducts.ProID, tblProducts.Name, tblCategories.Name as 'Category', tblProducts.Description, tblProducts.Unit, tblProducts.Image
from tblProducts
inner join tblCategories on tblCategories.CatId = tblProducts.CatId



/* overall order's */
create view getallorders as 
select tblInvoice.InvoiceId,tblUser.UserId, tblUser.Name as 'user', tblInvoice.Bill,tblInvoice.Payment
, tblInvoice.InvoiceDate,tblInvoice.Status  from tblInvoice
inner join tblUser on tblUser.UserId = tblInvoice.UserId


/* user's order  */
create view getallorderusers as
select tblInvoice.InvoiceId,tblUser.UserId, tblUser.Name as 'user', tblInvoice.Bill,tblInvoice.Payment
, tblInvoice.InvoiceDate,tblInvoice.Status  from tblInvoice
inner join tblUser on tblUser.UserId = tblInvoice.UserId
where tblInvoice.Status = 1