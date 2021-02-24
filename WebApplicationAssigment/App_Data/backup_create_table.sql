CREATE TABLE [dbo].[Art] (
    [id]          INT            NOT NULL,
    [artist_id]   INT            NOT NULL,
    [image]       NVARCHAR (MAX)  NOT NULL,
    [price]       DECIMAL (18)   NOT NULL,
    [date]        NVARCHAR (MAX) NOT NULL,
    [title]       NVARCHAR (MAX) NOT NULL,
    [description] NVARCHAR (MAX) NOT NULL,
    [category_id] INT            ,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[PublicBank] (
    [bank_account] nvarchar(10)  NOT NULL,
    [name] nvarchar(20)  NULL,
    [bank_username] nvarchar(20)  NULL,
    [amount] decimal(19,4)  NULL,
    [password] nvarchar(20)  NULL,
    PRIMARY KEY CLUSTERED ([bank_account] ASC)
);

CREATE TABLE [dbo].[Cards] (
    [card_number] nvarchar(16)  NOT NULL,
    [name] nvarchar(20)  NULL,
    [ccv] nvarchar(3)  NULL,
    [exp_date] datetime  NULL,
    [amount] decimal(19,4)  NULL,
    [password] nvarchar(20)  NULL,
    PRIMARY KEY CLUSTERED ([card_number] ASC)
);

CREATE TABLE [dbo].[PayPals] (
    [paypal_id] nvarchar(10)  NOT NULL,
    [email] nvarchar(30)  NULL,
    [name] nvarchar(20)  NULL,
    [amount] decimal(19,4)  NULL,
    [password] nvarchar(20)  NULL,
    PRIMARY KEY CLUSTERED ([paypal_id] ASC)
);

CREATE TABLE [dbo].[ChangePasswords] (
    [id] int  NOT NULL,
    [user_id] int  NULL,
    [temp_password] nvarchar(20)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Cart](
	[id] int NOT NULL,
	[user_id] int NULL,
	[relation] nvarchar(20) NULL,
	[remark] nvarchar(100) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[CartDetails](
	[cart_id] int NOT NULL,
	[art_id] int NULL,
	[availability] int NULL,
	[add_date] date NULL,
);

CREATE TABLE [dbo].[Category](
	[id] int NOT NULL,
	[name] nvarchar(50) NOT NULL,
	[description] nvarchar(100) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Payment](
	[id] int NOT NULL,
	[order_id] int NULL,
	[payment_method_id] int NULL,
	[tax_change] float NULL,
	[payment_date] date NULL,
	[payment_status] nvarchar(10) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[PaymentDetails](
	[id] int NOT NULL,
	[art_id] int NULL,
	[availability] bit NULL,
	[add_date] date NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Customer](
    [UserId] UNIQUEIDENTIFIER NOT NULL,
	[birthday_date] date,
	[membership] varchar(1),
	[picture] varbinary(max) NULL,
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]),
);

CREATE TABLE [dbo].[Artist](
    [UserId] UNIQUEIDENTIFIER NOT NULL,
	[birthday_date] date,
	[description] nvarchar(10) NULL,
	[signature] varbinary(max) NULL,
	[picture] varbinary(max) NULL,
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]),
);

CREATE TABLE [dbo].[Staff](
    [UserId] UNIQUEIDENTIFIER NOT NULL,
	[priority] int NOT NULL,
	[position_id] int NOT NULL,
	[picture] varbinary(max) NULL,
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]),
);
