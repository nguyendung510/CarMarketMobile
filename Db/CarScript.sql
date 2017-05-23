USE [master]
GO
/****** Object:  Database [CARWEB]    Script Date: 5/16/2017 2:05:50 PM ******/
CREATE DATABASE [CARWEB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CARWEB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CARWEB.mdf' , SIZE = 5376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CARWEB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CARWEB_log.LDF' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CARWEB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CARWEB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CARWEB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CARWEB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CARWEB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CARWEB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CARWEB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CARWEB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CARWEB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CARWEB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CARWEB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CARWEB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CARWEB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CARWEB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CARWEB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CARWEB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CARWEB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CARWEB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CARWEB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CARWEB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CARWEB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CARWEB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CARWEB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CARWEB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CARWEB] SET RECOVERY FULL 
GO
ALTER DATABASE [CARWEB] SET  MULTI_USER 
GO
ALTER DATABASE [CARWEB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CARWEB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CARWEB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CARWEB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CARWEB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CARWEB]
GO
/****** Object:  User [IIS APPPOOL\xegiadinhviet]    Script Date: 5/16/2017 2:05:51 PM ******/
CREATE USER [IIS APPPOOL\xegiadinhviet] FOR LOGIN [IIS APPPOOL\xegiadinhviet] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\xegiadinhviet]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\xegiadinhviet]
GO
/****** Object:  UserDefinedFunction [dbo].[strSplit]    Script Date: 5/16/2017 2:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function  [dbo].[strSplit] ( @string nvarchar( 4000), @splitter char( 1) )

returns @res table ( id int primary key, rank int, val nvarchar( 4000) )

as

begin

     if substring ( @string, len ( @string), 1)<>@splitter

          set @string= @string+@splitter

     declare @start int, @word nvarchar(4000), @charindex int, @i int

     set @i=1

     set @start=1

     set @charindex= charindex( @splitter, @string, @start)

     while (@charindex <> 0)begin

          set @word= substring( @string, @start, @charindex - @start)

          set @start= @charindex +1

          set @charindex= charindex( @splitter, @string, @start)

          insert into @res  values ( @start, @i, @word)

          set @i=@i+1

     end

     return

end





GO
/****** Object:  Table [dbo].[CarForBuy]    Script Date: 5/16/2017 2:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarForBuy](
	[CarId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Year] [int] NULL,
	[ProvinceId] [varchar](10) NULL,
	[TypeId] [varchar](10) NULL,
	[WheelDriveId] [varchar](10) NULL,
	[FuelId] [varchar](10) NULL,
	[Code] [varchar](20) NULL,
	[Title] [nvarchar](100) NULL,
	[IsImport] [bit] NULL,
	[IsNew] [bit] NULL,
	[Km] [int] NULL,
	[PriceFromVN] [money] NULL,
	[PriceToVN] [money] NULL,
	[ExteriorColorId] [varchar](7) NULL,
	[InteriorColorId] [varchar](7) NULL,
	[GateNo] [smallint] NULL,
	[SeatNo] [smallint] NULL,
	[Description] [nvarchar](max) NULL,
	[GearBox] [smallint] NULL,
	[FuelSystem] [nvarchar](20) NULL,
	[FuelConsumption] [smallint] NULL,
	[CreatedDate] [smalldatetime] NULL,
	[ModifiedDate] [smalldatetime] NULL,
	[ExpiredDate] [smalldatetime] NULL,
	[Firm] [varchar](20) NULL,
	[Model] [varchar](20) NULL,
	[Status] [tinyint] NULL,
	[CountVisit] [int] NULL,
 CONSTRAINT [PK_CarForBuy] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarForSale]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarForSale](
	[CarId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Year] [int] NULL,
	[ProvinceId] [varchar](10) NULL,
	[TypeId] [varchar](10) NULL,
	[WheelDriveId] [varchar](10) NULL,
	[FuelId] [varchar](10) NULL,
	[Code] [varchar](20) NULL,
	[Title] [nvarchar](100) NULL,
	[IsImport] [bit] NULL,
	[IsNew] [bit] NULL,
	[Km] [int] NULL,
	[CurrencyVN] [money] NULL,
	[CurrencyUSD] [money] NULL,
	[ExteriorColorId] [varchar](7) NULL,
	[InteriorColorId] [varchar](7) NULL,
	[GateNo] [smallint] NULL,
	[SeatNo] [smallint] NULL,
	[Description] [nvarchar](max) NULL,
	[GearBox] [smallint] NULL,
	[FuelSystem] [nvarchar](20) NULL,
	[CreatedDate] [smalldatetime] NULL,
	[ModifiedDate] [smalldatetime] NULL,
	[ExpiredDate] [smalldatetime] NULL,
	[Firm] [varchar](20) NULL,
	[Model] [varchar](20) NULL,
	[FuelConsumption] [smallint] NULL,
	[Status] [tinyint] NULL,
	[CountVisit] [int] NULL,
 CONSTRAINT [PK_CarForSale] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarVisisted]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarVisisted](
	[DeviceId] [varchar](65) NOT NULL,
	[CarId] [int] NOT NULL,
 CONSTRAINT [PK_CarVisisted] PRIMARY KEY CLUSTERED 
(
	[DeviceId] ASC,
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Class]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [varchar](2) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NULL,
	[Message] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExteriorColor]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExteriorColor](
	[ExteriorColorId] [varchar](7) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExteriorColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Firm]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Firm](
	[FirmId] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[FirmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fuel]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fuel](
	[FuelId] [varchar](10) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[FuelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InteriorColor]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InteriorColor](
	[InteriorColorId] [varchar](7) NOT NULL,
	[Name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[InteriorColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Model]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Model](
	[ModelID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirmID] [smallint] NULL,
	[Name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Province]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceId] [varchar](10) NOT NULL,
	[Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[TypeId] [varchar](10) NOT NULL,
	[Name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](50) NULL,
	[Roles] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Tel] [varchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[ProvinceId] [varchar](10) NULL,
	[CreatedDate] [smalldatetime] NULL,
	[ModifiedDade] [smalldatetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WheelDrive]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WheelDrive](
	[WheelDriveId] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[WheelDriveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [NonClusteredIndex-20161230-141643]    Script Date: 5/16/2017 2:05:52 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161230-141643] ON [dbo].[CarForSale]
(
	[ExpiredDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20161230-142036]    Script Date: 5/16/2017 2:05:52 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161230-142036] ON [dbo].[CarForSale]
(
	[Firm] ASC,
	[Model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161230-142227]    Script Date: 5/16/2017 2:05:52 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161230-142227] ON [dbo].[CarForSale]
(
	[IsNew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161230-142257]    Script Date: 5/16/2017 2:05:52 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161230-142257] ON [dbo].[CarForSale]
(
	[IsImport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD FOREIGN KEY([FirmID])
REFERENCES [dbo].[Firm] ([FirmId])
GO
/****** Object:  StoredProcedure [dbo].[car_approve]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[car_approve] 
	 @CarId INT	 ,
	 @UserId INT,	 
	 @IsBuy BIT,
	 @Result  BIT = 0 OUTPUT
AS
BEGIN

	SET NOCOUNT ON;
	
	IF(@UserId <> 7) RETURN 0

	IF(@IsBuy = 1)
	BEGIN
		UPDATE CarForBuy
		SET [Status] = 1
		WHERE CarId = @CarId

		set @Result = 1
	END
	ELSE
	BEGIN
		UPDATE CarForSale
		SET [Status] = 1
		WHERE CarId = @CarId

		set @Result = 1
	END

	IF @@ERROR <> 0
		set @Result = -1
	
	Return @Result
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Buying]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Buying]	

	 @UserId int,
	 @Firm varchar(20),
	 @Model varchar(20),	 

	 @TypeId varchar(10), --Dòng xe:* 	 
	 @ProvinceId varchar(10),

	 @ExteriorColorId varchar(7),
	 @InteriorColorId varchar(7),

	 @FuelId varchar(10), --- Nhiên liệu
	 @WheelDriveId varchar(10),   --Dẫn động: ,	 

	 @Year int,   -- Năm sản xuất/đời:* 	 
	 @Code varchar(20) = '',
	 @Title nvarchar(100) = '',
	 @IsImport bit, ----Xuất xứ:* 
	 @IsNew bit,--1: New, 0: Old	 
	 @Km int = 0,

	 @PriceFromVN money  =0,	 
	 @PriceToVN money  =0,	 
	 
	 @GateNo smallint = 0,
	 @SeatNo smallint = 0,
	 @Description nvarchar(max) ='',
	 @GearBox smallint = 0,
	 
	 @FuelSystem nvarchar(20) ='',
	 @FuelConsumption nvarchar(20) ='',
	 
	 @CreatedDate smalldatetime,

	 @CarBuyId		INT = 0 OUTPUT
	
AS
BEGIN

	INSERT INTO [dbo].[CarForBuy]
           ([UserId]
		   ,[Firm]
           ,[Model]
           ,[Year]
           ,[ProvinceId]
           ,[TypeId]
           ,[WheelDriveId]
           ,[FuelId]
           ,[Code]
           ,[Title]
           ,[IsImport]
           ,[IsNew]
           ,[Km]
           ,[PriceFromVN]
		   ,[PriceToVN]           
           ,[ExteriorColorId]
           ,[InteriorColorId]
           ,[GateNo]
           ,[SeatNo]
           ,[Description]
           ,[GearBox]
           ,[FuelSystem]
           ,[FuelConsumption]
           ,[CreatedDate]           
           ,[ExpiredDate])
     VALUES(
           @UserId
		   ,@Firm
		   ,@Model
		   ,@Year
		   ,@ProvinceId
		   ,@TypeId
		   ,@WheelDriveId
		   ,@FuelId
		   ,'code'
		   ,@Title
		   ,@IsImport
		   ,@ISNew
		   ,@Km
		   ,@PriceFromVN
		   ,@PriceToVN		   
		   ,@ExteriorColorId
		   ,@InteriorColorId
		   ,@GateNo
		   ,@SeatNo
		   ,@Description
		   ,@GearBox
		   ,@FuelSystem
		   ,@FuelConsumption
		   ,@CreatedDate
		   ,DATEADD(day,30,@CreatedDate) )

	IF @@ERROR <> 0
		SET @CarBuyId = -1
	ELSE
		SET @CarBuyId = SCOPE_IDENTITY()
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Buying_Edit]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Car_Buying_Edit]

	 @UserId int,
	 @CarId int,
	 @Firm varchar(20),
	 @Model varchar(20),	 

	 @TypeId varchar(10), --Dòng xe:* 	 
	 @ProvinceId varchar(10),

	 @ExteriorColorId varchar(7),
	 @InteriorColorId varchar(7),

	 @FuelId varchar(10), --- Nhiên liệu
	 @WheelDriveId varchar(10),   --Dẫn động: ,	 

	 @Year int,   -- Năm sản xuất/đời:* 	 
	 @Code varchar(20) = '',
	 @Title nvarchar(100) = '',
	 @IsImport bit, ----Xuất xứ:* 
	 @IsNew bit,--1: New, 0: Old	 
	 @Km int = 0,
	 @PriceFromVN money  =0,	 
	 @PriceToVN money  =0,	 
	 
	 @GateNo smallint = 0,
	 @SeatNo smallint = 0,
	 @Description nvarchar(max) ='',
	 @GearBox smallint = 0,
	 
	 @FuelSystem nvarchar(20) ='',
	 @FuelConsumption nvarchar(20) ='',
	 
	 @ModifiedDate smalldatetime,

	 @Error Bit OUTPUT
	
AS
BEGIN

	UPDATE [dbo].[CarForBuy]
    SET 
	  Code = 'M' + cast(@CarId as varchar) + @Model
      ,[Year] = @Year
      ,[ProvinceId] = @ProvinceId
      ,[TypeId] = @TypeId
      ,[WheelDriveId] = @WheelDriveId
      ,[FuelId] = @FuelId      
      ,[Title] = @Title
      ,[IsImport] = @IsImport
      ,[IsNew] = @IsNew
      ,[Km] = @Km
      ,[PriceFromVN]  = @PriceFromVN
	  ,[PriceToVN] = @PriceToVN
      ,[ExteriorColorId] = @ExteriorColorId
      ,[InteriorColorId] = @InteriorColorId
      ,[GateNo] = @GateNo
      ,[SeatNo] = @SeatNo
      ,[Description] = @Description
      ,[GearBox] = @GearBox
      ,[FuelSystem] = @FuelSystem      
      ,[ModifiedDate] = @ModifiedDate
      ,[ExpiredDate] = DATEADD(day,30,@ModifiedDate)
      ,[Firm] = @Firm
      ,[Model] = @Model
      ,[FuelConsumption] = @FuelConsumption
	  ,[Status] = 0
	 WHERE CarId = @CarId and UserId = @UserId

	 SET @Error = @@ERROR

END

GO
/****** Object:  StoredProcedure [dbo].[Car_Buying_Insert]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Buying_Insert]	

	 @UserId int,
	 @Firm varchar(20),
	 @Model varchar(20),	 

	 @TypeId varchar(10), --Dòng xe:* 	 
	 @ProvinceId varchar(10),

	 @ExteriorColorId varchar(7),
	 @InteriorColorId varchar(7),

	 @FuelId varchar(10), --- Nhiên liệu
	 @WheelDriveId varchar(10),   --Dẫn động: ,	 

	 @Year int,   -- Năm sản xuất/đời:* 	 
	 @Code varchar(20) = '',
	 @Title nvarchar(100) = '',
	 @IsImport bit, ----Xuất xứ:* 
	 @IsNew bit,--1: New, 0: Old	 
	 @Km int = 0,

	 @PriceFromVN money  =0,	 
	 @PriceToVN money  =0,	 
	 
	 @GateNo smallint = 0,
	 @SeatNo smallint = 0,
	 @Description nvarchar(max) ='',
	 @GearBox smallint = 0,
	 
	 @FuelSystem nvarchar(20) ='',
	 @FuelConsumption nvarchar(20) ='',
	 
	 @CreatedDate smalldatetime,

	 @CarId		INT = 0 OUTPUT
	
AS
BEGIN

	INSERT INTO [dbo].[CarForBuy]
           ([UserId]
		   ,[Firm]
           ,[Model]
           ,[Year]
           ,[ProvinceId]
           ,[TypeId]
           ,[WheelDriveId]
           ,[FuelId]
           ,[Code]
           ,[Title]
           ,[IsImport]
           ,[IsNew]
           ,[Km]
           ,[PriceFromVN]
		   ,[PriceToVN]           
           ,[ExteriorColorId]
           ,[InteriorColorId]
           ,[GateNo]
           ,[SeatNo]
           ,[Description]
           ,[GearBox]
           ,[FuelSystem]
           ,[FuelConsumption]
           ,[CreatedDate]           
           ,[ExpiredDate]
		   ,[Status])
     VALUES(
           @UserId
		   ,@Firm
		   ,@Model
		   ,@Year
		   ,@ProvinceId
		   ,@TypeId
		   ,@WheelDriveId
		   ,@FuelId
		   ,'code'
		   ,@Title
		   ,@IsImport
		   ,@ISNew
		   ,@Km
		   ,@PriceFromVN
		   ,@PriceToVN		   
		   ,@ExteriorColorId
		   ,@InteriorColorId
		   ,@GateNo
		   ,@SeatNo
		   ,@Description
		   ,@GearBox
		   ,@FuelSystem
		   ,@FuelConsumption
		   ,@CreatedDate
		   ,DATEADD(day,30,@CreatedDate)
		   ,0 )

	IF @@ERROR <> 0
		SET @CarId = -1
	ELSE
		SET @CarId = SCOPE_IDENTITY()

	IF (@CarId > 0 )
	BEGIN
		UPDATE [dbo].[CarForBuy]
		SET Code = 'M' + cast(@CarId as varchar) + @Model
		WHERE CarId = @CarId
	END

	IF @@ERROR <> 0
		SET @CarId = -1
END

GO
/****** Object:  StoredProcedure [dbo].[car_disapprove]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [delete_car] 6
CREATE PROCEDURE [dbo].[car_disapprove] 
	 @CarId INT	 ,
	 @UserId INT,	 
	 @IsBuy BIT,
	 @Result  BIT = 0 OUTPUT
AS
BEGIN

	SET NOCOUNT ON;
	
	IF(@UserId <> 7) RETURN 0

	IF(@IsBuy = 1)
	BEGIN
		UPDATE CarForBuy
		SET [Status] = 3
		WHERE CarId = @CarId

		set @Result = 1
	END
	ELSE
	BEGIN
		UPDATE CarForSale
		SET [Status] = 3
		WHERE CarId = @CarId

		set @Result = 1
	END

	IF @@ERROR <> 0
		set @Result = -1
	
	Return @Result
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Inserting]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Car_Inserting]	

	 @UserId int,
	 @Firm varchar(20),
	 @Model varchar(20),	 

	 @TypeId varchar(10), --Dòng xe:* 	 
	 @ProvinceId varchar(10),

	 @ExteriorColorId varchar(7),
	 @InteriorColorId varchar(7),

	 @FuelId varchar(10), --- Nhiên liệu
	 @WheelDriveId varchar(10),   --Dẫn động: ,	 

	 @Year int,   -- Năm sản xuất/đời:* 	 
	 @Code varchar(20) = '',
	 @Title nvarchar(100) = '',
	 @IsImport bit, ----Xuất xứ:* 
	 @IsNew bit,--1: New, 0: Old	 
	 @Km int = 0,
	 @CurrencyVN money  =0,	 
	 
	 @GateNo smallint = 0,
	 @SeatNo smallint = 0,
	 @Description nvarchar(max) ='',
	 @GearBox smallint = 0,
	 
	 @FuelSystem nvarchar(20) ='',
	 @FuelConsumption nvarchar(20) ='',
	 
	 @CreatedDate smalldatetime,

	 @CarId		INT = 0 OUTPUT
	
AS
BEGIN

	INSERT INTO [dbo].[CarForSale]
           ([UserId]
		   ,[Firm]
           ,[Model]
           ,[Year]
           ,[ProvinceId]
           ,[TypeId]
           ,[WheelDriveId]
           ,[FuelId]
           ,[Code]
           ,[Title]
           ,[IsImport]
           ,[IsNew]
           ,[Km]
           ,[CurrencyVN]
           ,[CurrencyUSD]
           ,[ExteriorColorId]
           ,[InteriorColorId]
           ,[GateNo]
           ,[SeatNo]
           ,[Description]
           ,[GearBox]
           ,[FuelSystem]
           ,[FuelConsumption]
           ,[CreatedDate]           
           ,[ExpiredDate]
		   ,[Status])
     VALUES(
           @UserId
		   ,@Firm
		   ,@Model
		   ,@Year
		   ,@ProvinceId
		   ,@TypeId
		   ,@WheelDriveId
		   ,@FuelId
		   ,'code'
		   ,@Title
		   ,@IsImport
		   ,@ISNew
		   ,@Km
		   ,@CurrencyVN
		   ,0
		   ,@ExteriorColorId
		   ,@InteriorColorId
		   ,@GateNo
		   ,@SeatNo
		   ,@Description
		   ,@GearBox
		   ,@FuelSystem
		   ,@FuelConsumption
		   ,@CreatedDate
		   ,DATEADD(day,30,@CreatedDate)
		   ,0 )

	IF @@ERROR <> 0
		SET @CarId = -1
	ELSE
		SET @CarId = SCOPE_IDENTITY()

	IF (@CarId > 0 )
	BEGIN
		UPDATE [dbo].[CarForSale]
		SET Code = 'B' + cast(@CarId as varchar) + @Model
		WHERE CarId = @CarId
	END

	IF @@ERROR <> 0
		SET @CarId = -1
END

GO
/****** Object:  StoredProcedure [dbo].[car_saled]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [car_saled] 6
CREATE PROCEDURE [dbo].[car_saled]		 
	 @CarId INT	 ,
	 @UserId INT,
	 @Result  BIT = 0 OUTPUT
AS
BEGIN

	SET NOCOUNT ON;
	
	IF(Exists (Select top 1 1 from [dbo].[CarForSale]
				Where CarId = @CarId and UserId = @UserId
				))
	BEGIN
		UPDATE [dbo].[CarForSale]
		SET [Status] = 2
		Where CarId = @CarId and UserId = @UserId

		set @Result = 1
	END

	IF @@ERROR <> 0
		set @Result = -1
	
	Return @Result
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Searching]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Searching]	
	 @UserId int = 0,
	 @FirmName varchar(100) ='',	 
	 @Models varchar(1000) ='',
	 @IsGearBox smallint = -1, --0: auto, 1: composte auto & manual, >=4: manual, -1: All
	 @IsNew smallint = -1,  -- 0: Old, 1: New, -1: All
	 @IsImport smallint  = -1, -- 0 : Domestic, 1: Import : -1 : All
	 @FromPrice money = 0, -- in VNĐ
	 @ToPrice money = 0,
	 @Year int = 0,
	 @Province varchar(10)='0',	 	 
	 @ExteriorColor varchar(7) = nULL,
	 @InteriorColor varchar(7) = null,
	 @GateNo smallint = 0,
	 @SeatNo smallint = 0,	 	 
     @CurrentPageIndex int = 0,
     @ItemsPerPage int = 100
AS

/*

exec [Car_Searching] '', ''
*/
BEGIN

	SET NOCOUNT ON;

	If(@UserId > 0)
	BEGIN
		SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel, u.Email ContactEmail
		from [dbo].[CarForSale] c with(nolock)		
		inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
		inner join [User] u with(nolock) on u.UserId = c.UserId
		inner join InteriorColor inter on c.InteriorColorId = inter.InteriorColorId
		inner join ExteriorColor ext on c.ExteriorColorId = ext.ExteriorColorId
		Where u.UserId = @UserId
		and (c.Status = 1) and ExpiredDate >= GETDATE()
		order by c.CarId desc
	END
	ELSE
	BEGIN
		DECLARE @SelectedModels AS TABLE (Model varchar(20))		
		INSERT INTO @SelectedModels (Model)
		SELECT CAST(VAL as varchar(20))  AS SuperId
		FROM dbo.strSplit(@Models,',')

		SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel, u.Email ContactEmail
		from [dbo].[CarForSale] c with(nolock)		
		inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
		inner join [User] u with(nolock) on u.UserId = c.UserId
		inner join InteriorColor inter on c.InteriorColorId = inter.InteriorColorId
		inner join ExteriorColor ext on c.ExteriorColorId = ext.ExteriorColorId

		Where (@FirmName = '' or @FirmName  = 'All' or @FirmName is NULL or c.[Firm] = @FirmName)
			and (@Models = '' or @Models = 'All' or @Models is NULL or c.Model in (Select Model From @SelectedModels))
			and (@IsGearBox = -1 or c.GearBox = @IsGearBox)
			and (@IsNew = -1 or c.IsNew =@IsNew )
			and (@IsImport = -1 OR c.IsImport = @IsImport)
			and (@FromPrice = 0 or @ToPrice = 0 or c.CurrencyVN between @FromPrice and @ToPrice)		
			and (@Year = 0 or c.[Year] = @Year)
			and (@Province = '0' or c.ProvinceId = @Province)		
			and (@ExteriorColor is null or c.ExteriorColorId = @ExteriorColor)
			and (@InteriorColor is null or c.InteriorColorId = @InteriorColor)
			and (@GateNo = 0 or c.GateNo = @GateNo)
			and (@SeatNo = 0 or c.SeatNo = @SeatNo)
			and (c.Status = 1) and ExpiredDate >= GETDATE()
						
		order by c.CarId desc
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Searching_By_Text]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Searching_By_Text]	
	 @Text varchar(100),	 	 
     @currentPageIndex int = 0,
     @ItemsPerPage int = 20
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel, u.Email ContactEmail
	from [dbo].[CarForSale] c with(nolock)		
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u with(nolock) on u.UserId = c.UserId
	inner join [Fuel] f with(nolock) on f.FuelId = c.FuelId
	inner join [WheelDrive] w with(nolock) on w.WheelDriveId = c.WheelDriveId
	Where (c.Status = 1  and ExpiredDate >= GETDATE() ) and 
	(c.Title like '%' + @Text + '%'
	or c.Description like '%' + @Text + '%'
	or c.Firm like '%' + @Text + '%'
	or c.Model like '%' + @Text + '%'
	or p.Name like '%' + @Text + '%'
	or c.TypeId like '%' + @Text + '%'
	or c.FuelSystem like '%' + @Text + '%'			
	or f.Name like '%' + @Text + '%'
	or w.Name like '%' + @Text + '%')
	order by c.CarId desc
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Searching_Firm_Model]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Searching_Firm_Model]	
	 @FirmName varchar(100),	 
	 @Model varchar(300),	
     @currentPageIndex int = 0,
     @ItemsPerPage int = 20
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)		
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u with(nolock) on u.UserId = c.UserId
	Where (@FirmName is NULL or @FirmName = '' or c.Firm = @FirmName)
		 and (@Model is NULL or @Model = '' or c.Model =  @Model )
		 and (c.Status = 1 and ExpiredDate >= GETDATE() )
	order by c.CarId desc
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Searching_Firm_Model_Province]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Searching_Firm_Model_Province]	
	 @FirmName varchar(100),	 
	 @Model varchar(300),	
	 @Province varchar(30),
     @currentPageIndex int = 0,
     @ItemsPerPage int = 20
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)		
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u with(nolock) on u.UserId = c.UserId
	Where (@FirmName is NULL or @FirmName = '' or c.Firm = @FirmName)
		 and (@Model is NULL or @Model = '' or c.Model =  @Model )
		 and (@Province is NULL or @Province = '' or p.Name =  @Province )
		 and (c.Status = 1 and ExpiredDate >= GETDATE() )
	order by c.CarId desc
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Searching_For_You]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Searching_For_You]		
     @currentPageIndex int = 0,
     @ItemsPerPage int = 20
AS
-- exec Car_Searching_For_You 
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @UserIds VARCHAR(8000)

	SELECT @UserIds = COALESCE(@UserIds + ',' + CAST(UserId AS VARCHAR(20)), CAST(UserId AS VARCHAR(20)))
	FROM (
		SELECT UserId
		FROM [User] u
		) AS tmp

	SET @UserIds = @UserIds + ','

	
	CREATE TABLE  #ValidCars(
	CarId int,
	UserID int,
	IsNew bit,
	IsImport bit,
	[year] int,
	FirmName varchar(20), 
	Title nvarchar(100),
	[Description] nvarchar(max),
	Km int,
	GearBox smallint,
	CurrencyVN money,
	Province nvarchar(30),
	ContactName nvarchar(20), 
	ContactTel varchar(20))
	
	CREATE TABLE  #CarForYou(
	CarId int,
	UserID int,
	IsNew bit,
	IsImport bit,
	[year] int,
	FirmName varchar(20), 
	Title nvarchar(100),
	[Description] nvarchar(max),
	Km int,
	GearBox smallint,
	CurrencyVN money,
	Province nvarchar(30),
	ContactName nvarchar(20), 
	ContactTel varchar(20))

	INSERT INTO #ValidCars
	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel		
		from [dbo].[CarForSale] c with(nolock)	
		inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
		inner join [User] u with(nolock) on u.UserId = c.UserId	
		where c.Status = 1  and ExpiredDate >= GETDATE()		
		
	DECLARE 
	@userId INT
	,@pos INT
	,@len INT	

	set @pos = 0
	set @len = 0

	WHILE CHARINDEX(',', @UserIds, @pos+1)>0
	BEGIN
		set @len = CHARINDEX(',', @UserIds, @pos+1) - @pos
		set @userId = SUBSTRING(@UserIds, @pos, @len)
		
		INSERT INTO #CarForYou
		SELECT top 3 c.CarId, c.UserId, c.IsNew, c.IsImport, c.[year], c.FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, c.Province, c.ContactName, c.ContactTel		
		From #ValidCars c
		Where c.UserId = @userId			
		Order by c.CarId desc
				
		set @pos = CHARINDEX(',', @UserIds, @pos+@len) +1

		--WAITFOR DELAY '00:00:00:200'
	END

	Select * from #CarForYou order by CarId desc
	

	DROP TABLE #ValidCars
	
	DROP TABLE #CarForYou
	
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Searching_Like_Model]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec Car_Searching_Like_Model 'Vios',0,20
CREATE PROCEDURE [dbo].[Car_Searching_Like_Model]	
	 @Model varchar(20),	
     @currentPageIndex int = 0,
     @ItemsPerPage int = 20
AS
BEGIN

	SET NOCOUNT ON;

	SELECT top 100 c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u with(nolock) on u.UserId = c.UserId
	Where c.Model =  @Model and c.Status = 1 and ExpiredDate >= GETDATE()
	order by c.CarId desc

END


GO
/****** Object:  StoredProcedure [dbo].[Car_Searching_Like_toPrice_fromPrice]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Car_Searching_Like_toPrice_fromPrice 285,315,0,20
CREATE PROCEDURE [dbo].[Car_Searching_Like_toPrice_fromPrice]
	 @Price money ,
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 20
AS
BEGIN

	SET NOCOUNT ON;

	SELECT top 100 c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u with(nolock) on u.UserId = c.UserId
	Where  c.Status = 1 and c.CurrencyVN = @Price and ExpiredDate >= GETDATE()
	order by c.CarId desc
END


GO
/****** Object:  StoredProcedure [dbo].[Car_Visited]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Car_Visited]	

	 @DeviceId varchar(33),	 
	 @CarId	INT,
	 @CountVisit BIGINT OUTPUT
	
AS
BEGIN
	SELECT @CountVisit = ISNULL(CountVisit,0) FROM [dbo].[CarForSale]  WHERE CarId = @CarId

	IF NOT EXISTS (SELECT 1 FROM [dbo].[CarVisisted] WHERE [DeviceId] = @DeviceId and [CarId] = @CarId)
	BEGIN
		INSERT INTO [dbo].[CarVisisted]
           ([DeviceId]
           ,[CarId])
		 VALUES
           (@DeviceId
           ,@CarId)

		SET @CountVisit =  @CountVisit + 1

		UPDATE [dbo].[CarForSale]
		SET CountVisit = @CountVisit
		WHERE[CarId] = @CarId
	END
	
END

GO
/****** Object:  StoredProcedure [dbo].[Contact_Insert]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[Contact_Insert]

     @Name nvarchar(50),
     @Email varchar(50),
     @Phone varchar(20) = '',
     @Message nvarchar(MAX),
	 	 
	 @Id		INT = 0 OUTPUT
	
AS
BEGIN

	
INSERT INTO [dbo].[Contact]
           ([Name]
           ,[Email]
           ,[Phone]
           ,[Message])
     VALUES
           (@Name
           ,@Email
           ,@Phone
           ,@Message)

	IF @@ERROR <> 0
		SET @Id = -1
	ELSE
		SET @Id = SCOPE_IDENTITY()
END

GO
/****** Object:  StoredProcedure [dbo].[delete_car]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [delete_car] 6
CREATE PROCEDURE [dbo].[delete_car]		 
	 @CarId INT	 ,
	 @UserId INT,
	 @IsBuy BIT,
	 @Result  BIT = 0 OUTPUT
AS
BEGIN

	SET NOCOUNT ON;
	
	IF(@IsBuy = 1)
	BEGIN
		IF(Exists (Select top 1 1 from [dbo].[CarForBuy]
					Where CarId = @CarId and (UserId = @UserId or @UserId = 7)
					))
		BEGIN
			Delete [dbo].CarForBuy
			Where CarId = @CarId and (UserId = @UserId or @UserId = 7)			
			set @Result = 1
		END
	END
	ELSE
	BEGIN
		IF(Exists (Select top 1 1 from [dbo].[CarForSale]
					Where CarId = @CarId and (UserId = @UserId or @UserId = 7)
					))
		BEGIN
			Delete [dbo].[CarForSale]
			Where CarId = @CarId and (UserId = @UserId or @UserId = 7)			
			set @Result = 1
		END
	END
	IF @@ERROR <> 0
		set @Result = -1
	
	Return @Result
END

GO
/****** Object:  StoredProcedure [dbo].[edit_car]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[edit_car]

	 @UserId int,
	 @CarId int,
	 @Firm varchar(20),
	 @Model varchar(20),	 

	 @TypeId varchar(10), --Dòng xe:* 	 
	 @ProvinceId varchar(10),

	 @ExteriorColorId varchar(7),
	 @InteriorColorId varchar(7),

	 @FuelId varchar(10), --- Nhiên liệu
	 @WheelDriveId varchar(10),   --Dẫn động: ,	 

	 @Year int,   -- Năm sản xuất/đời:* 	 
	 @Code varchar(20) = '',
	 @Title nvarchar(100) = '',
	 @IsImport bit, ----Xuất xứ:* 
	 @IsNew bit,--1: New, 0: Old	 
	 @Km int = 0,
	 @CurrencyVN money  =0,	 
	 
	 @GateNo smallint = 0,
	 @SeatNo smallint = 0,
	 @Description nvarchar(max) ='',
	 @GearBox smallint = 0,
	 
	 @FuelSystem nvarchar(20) ='',
	 @FuelConsumption nvarchar(20) ='',
	 
	 @ModifiedDate smalldatetime,

	 @Error Bit OUTPUT
	
AS
BEGIN

	UPDATE [dbo].[CarForSale]
    SET 
	   Code = 'B' + cast(@CarId as varchar) + @Model
      ,[Year] = @Year
      ,[ProvinceId] = @ProvinceId
      ,[TypeId] = @TypeId
      ,[WheelDriveId] = @WheelDriveId
      ,[FuelId] = @FuelId      
      ,[Title] = @Title
      ,[IsImport] = @IsImport
      ,[IsNew] = @IsNew
      ,[Km] = @Km
      ,[CurrencyVN] = @CurrencyVN      
      ,[ExteriorColorId] = @ExteriorColorId
      ,[InteriorColorId] = @InteriorColorId
      ,[GateNo] = @GateNo
      ,[SeatNo] = @SeatNo
      ,[Description] = @Description
      ,[GearBox] = @GearBox
      ,[FuelSystem] = @FuelSystem      
      ,[ModifiedDate] = @ModifiedDate
      ,[ExpiredDate] = DATEADD(day,30,@ModifiedDate)
      ,[Firm] = @Firm
      ,[Model] = @Model
      ,[FuelConsumption] = @FuelConsumption
	  ,[Status] = 0
	 WHERE Carid = @CarId and (UserId = @UserId or @UserId = 7)

	 SET @Error = @@ERROR	 
END

GO
/****** Object:  StoredProcedure [dbo].[get_Car_Buy_Detail]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_Car_Buy_Detail]
	 @CarId int	 ,
	 @UserId int = 0
AS

/*

exec get_Car_Detail 23

*/ 
BEGIN

	SET NOCOUNT ON;
	
	Select distinct
		c.UserId,
		c.CarId,
		c.Firm,
		c.Model,
		Case c.IsNew when 1 then N'Mới' else N'Cũ' end as IsNew,
		Case c.IsImport when 1 then N'Nhập khẩu' else N'Trong nuớc' end as IsImport,
		c.Year as [Year],
		t.Name as [Type],		
		c.Title,
		c.Description,
		c.km,
		Case c.GearBox when 0 then N'Tự động' when 1 then N'Số hỗn hợp' else N'Số sàn (' + convert(nvarchar(2), c.GearBox) + N' số)' end as GearBox,		
		p.Name as Province,
		u.UserName ContactName,
		u.Tel ContactTel,		
		u.Address as [Address],
		c.SeatNo,
		c.GateNo,
		ex.Name as ExteriorColor,
		ic.Name as InteriorColor,
		c.FuelConsumption,
		Fuel.Name as Fuel,
		c.FuelSystem,
		w.Name as WheelDrive,
		c.Code,		
		Convert(varchar(10), c.CreatedDate,120)  as CreatedDate,
		ISNULL(c.CountVisit,0) as CountVisit
	from [dbo].[CarForBuy] c with(nolock)
	left join [Type] t with (nolock) on t.TypeId = c.TypeId		
	left join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	left join [User] u  with(nolock) on u.UserId = c.UserId
	left join ExteriorColor ex with (nolock) on ex.[ExteriorColorId] = c.ExteriorColorId
	left join InteriorColor ic with (nolock) on ic.InteriorColorId = c.InteriorColorId
	left join WheelDrive w with (nolock) on w.WheelDriveId = c.WheelDriveId
	left join Fuel with (nolock) on Fuel.FuelId = c.FuelId
	Where c.CarId = @CarId and 	(@UserId > 0  OR (	c.Status = 1 and ExpiredDate >= GETDATE()) )
	
END

GO
/****** Object:  StoredProcedure [dbo].[get_Car_Buy_Edit_Info]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_Car_Buy_Edit_Info]
	 @CarId int	 ,
	 @UserId int
AS

/*

exec get_Car_Edit_Info 2

*/ 
BEGIN

	SET NOCOUNT ON;
	
	Select distinct
		c.UserId,
		c.CarId,
		c.Firm,
		c.Model,
		c.IsNew,
		c.IsImport,
		c.Year as [Year],
		c.TypeId,		
		c.Title,
		c.Description,
		c.km,
		c.GearBox,
		c.PriceFromVN,
		c.PriceToVN,
		c.ProvinceId,
		u.UserName ContactName,		
		u.Tel ContactTel,
		u.Address as [Address],
		c.SeatNo,
		c.GateNo,
		c.ExteriorColorId,		
		c.[InteriorColorId],
		c.FuelConsumption,
		c.FuelId,
		c.FuelSystem,
		c.[WheelDriveId],
		Convert(varchar(10), c.CreatedDate,120)  as CreatedDate
	from [dbo].[CarForBuy] c with(nolock)		
	inner join [User] u  with(nolock) on u.UserId = c.UserId		
	Where c.CarId = @CarId and (u.UserId = @UserId or @UserId = 7)
	
END

GO
/****** Object:  StoredProcedure [dbo].[get_Car_Detail]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_Car_Detail]
	 @CarId int	 ,
	 @UserId int = 0
AS

/*

exec get_Car_Detail 23

*/ 
BEGIN

	SET NOCOUNT ON;
	
	Select distinct
		c.UserId,
		c.CarId,
		c.Firm,
		c.Model,
		Case c.IsNew when 1 then N'Mới' else N'Cũ' end as IsNew,
		Case c.IsImport when 1 then N'Nhập khẩu' else N'Trong nuớc' end as IsImport,
		c.Year as [Year],
		t.Name as [Type],		
		c.Title,
		c.Description,
		c.km,
		Case c.GearBox when 0 then N'Tự động' when 1 then N'Số hỗn hợp' else N'Số sàn (' + convert(nvarchar(2), c.GearBox) + N' số)' end as GearBox,
		c.CurrencyVN,
		p.Name as Province,
		u.UserName ContactName,
		u.Tel ContactTel,		
		u.Address as [Address],
		c.SeatNo,
		c.GateNo,
		ex.Name as ExteriorColor,
		ic.Name as InteriorColor,
		c.FuelConsumption,
		Fuel.Name as Fuel,
		c.FuelSystem,
		w.Name as WheelDrive,
		c.Code,
		Convert(varchar(10), c.CreatedDate,120)  as CreatedDate,
		ISNULL(c.CountVisit * 7 + c.CountVisit,0) as CountVisit
	from [dbo].[CarForSale] c with(nolock)
	inner join [Type] t with (nolock) on t.TypeId = c.TypeId		
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = c.UserId
	inner join ExteriorColor ex with (nolock) on ex.[ExteriorColorId] = c.ExteriorColorId
	inner join InteriorColor ic with (nolock) on ic.InteriorColorId = c.InteriorColorId
	inner join WheelDrive w with (nolock) on w.WheelDriveId = c.WheelDriveId
	inner join Fuel with (nolock) on Fuel.FuelId = c.FuelId
	Where c.CarId = @CarId and 	(@UserId > 0  OR (	c.Status = 1 and ExpiredDate >= GETDATE()) )
	
END

GO
/****** Object:  StoredProcedure [dbo].[get_Car_Edit_Info]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_Car_Edit_Info]
	 @CarId int	 ,
	 @UserId int
AS

/*

exec get_Car_Edit_Info 2

*/ 
BEGIN

	SET NOCOUNT ON;
	
	Select distinct
		c.UserId,		
		c.CarId,
		c.Firm,
		c.Model,
		c.IsNew,
		c.IsImport,
		c.Year as [Year],
		c.TypeId,		
		c.Title,
		c.Description,
		c.km,
		c.GearBox,
		c.CurrencyVN,
		c.ProvinceId,
		u.UserName ContactName,
		u.Tel ContactTel,		
		u.Address as [Address],
		c.SeatNo,
		c.GateNo,
		c.ExteriorColorId,		
		c.[InteriorColorId],
		c.FuelConsumption,
		c.FuelId,
		c.FuelSystem,
		c.[WheelDriveId],
		Convert(varchar(10), c.CreatedDate,120)  as CreatedDate
	from [dbo].[CarForSale] c with(nolock)		
	inner join [User] u  with(nolock) on u.UserId = c.UserId		
	Where c.CarId = @CarId and (u.UserId = @UserId or @UserId = 7)
	
END

GO
/****** Object:  StoredProcedure [dbo].[get_Import_Domestic_Cars]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec get_NewCar '76','4',0,0,0,0
CREATE PROCEDURE [dbo].[get_Import_Domestic_Cars]		 
	 @IsImport bit,	 
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 100
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = c.UserId
	Where c.IsImport =@IsImport and c.Status = 1 and ExpiredDate >= GETDATE()
	order by c.CreatedDate desc
END

GO
/****** Object:  StoredProcedure [dbo].[get_New_Import_Cars]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec get_NewCar '76','4',0,0,0,0
CREATE PROCEDURE [dbo].[get_New_Import_Cars]		 
	 @IsNew smallint = 0,
	 @IsImport smallint  = 0,  -- 0: All
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 100
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = c.UserId
	Where (c.IsNew =@IsNew )
		and (IsImport = @IsImport)
		and c.Status = 1 and ExpiredDate >= GETDATE()
	order by c.CarId desc
	
END

GO
/****** Object:  StoredProcedure [dbo].[get_New_OLD_Cars]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec get_NewCar '76','4',0,0,0,0
CREATE PROCEDURE [dbo].[get_New_OLD_Cars]		 
	 @IsNew bit,	 
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 100
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = c.UserId
	Where (c.IsNew =@IsNew )	and c.Status = 1		 and ExpiredDate >= GETDATE()
	order by c.CarId desc
END

GO
/****** Object:  StoredProcedure [dbo].[get_Similar_Model_Cars]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec get_NewCar '76','4',0,0,0,0
CREATE PROCEDURE [dbo].[get_Similar_Model_Cars]
	 @CarId int,
	 @Model varchar(20),
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 100
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = c.UserId
	Where (c.Model = @Model and c.CarId <> @CarId and c.Status = 1 and ExpiredDate >= GETDATE())
	order by c.CarId desc
END

GO
/****** Object:  StoredProcedure [dbo].[get_Similar_Price_Cars]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec get_NewCar '76','4',0,0,0,0
CREATE PROCEDURE [dbo].[get_Similar_Price_Cars]
	 @CarId int,
	 @Price varchar(20),
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 100
AS
BEGIN

	SET NOCOUNT ON;

	SELECT c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.CurrencyVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = c.UserId
	Where (c.CurrencyVN between @Price - @Price/10 and @Price + @Price/10)
		and (c.CarId <> @CarId)
		and c.Status = 1 
		and c.ExpiredDate >= GETDATE()
	order by c.CarId desc
END

GO
/****** Object:  StoredProcedure [dbo].[get_YourCars]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec get_YourCars 1012

CREATE PROCEDURE [dbo].[get_YourCars]
	 @UserId int,	 
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 100
AS
BEGIN

	SET NOCOUNT ON;

	IF(@UserId = 7)--admin
	BEGIN
		Select * From (
			SELECT distinct c.CarId, u.UserId, u.UserName, u.Email, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, 0 as IsBuy, c.Status, FORMAT(ISNULL(c.ModifiedDate, c.CreatedDate), 'dd/MM/yyyy')  as ModifiedDate, c.CountVisit
			from [dbo].[CarForSale] c with(nolock)	
			inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
			left join [User] u  with(nolock) on u.UserId = c.UserId
			Where ExpiredDate >= GETDATE()
			
			--UNION

			--SELECT distinct b.CarId, u.UserId, u.UserName, u.Email, b.IsNew, b.IsImport, b.[year], b.Firm as FirmName, b.Title, 1 as IsBuy, b.Status, FORMAT(ISNULL(b.ModifiedDate, b.CreatedDate), 'dd/MM/yyyy') as ModifiedDate , b.CountVisit
			--from [dbo].[CarForBuy] b with(nolock)	
			--left join Province p with(nolock) on p.ProvinceId = b.ProvinceId
			--left join [User] u  with(nolock) on u.UserId = b.UserId
			--Where ExpiredDate >= GETDATE()

		) as t
		order by CarId desc
		
		

	END
	ELSE
	BEGIN
		Select * From (
			SELECT distinct c.CarId, u.UserId, u.UserName, u.Email,  c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, 0 as IsBuy, c.Status, FORMAT(ISNULL(c.ModifiedDate, c.CreatedDate), 'dd/MM/yyyy')  as ModifiedDate, c.CountVisit
			from [dbo].[CarForSale] c with(nolock)	
			inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
			inner join [User] u  with(nolock) on u.UserId = c.UserId
			Where c.UserId = @UserId and ExpiredDate >= GETDATE()			
			
			--UNION

			--SELECT distinct b.CarId, u.UserId, u.UserName, u.Email, b.IsNew, b.IsImport, b.[year], b.Firm as FirmName, b.Title, 1 as IsBuy, b.Status, FORMAT(ISNULL(b.ModifiedDate, b.CreatedDate), 'dd/MM/yyyy') as ModifiedDate , b.CountVisit
			--from [dbo].[CarForBuy] b with(nolock)	
			--left join Province p with(nolock) on p.ProvinceId = b.ProvinceId
			--inner join [User] u  with(nolock) on u.UserId = b.UserId
			--Where b.UserId = @UserId and ExpiredDate >= GETDATE()
		) as t
		order by CarId desc
	END
END

GO
/****** Object:  StoredProcedure [dbo].[get_YourCarsExpired]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[get_YourCarsExpired]
	 @UserId int,	 
	 @currentPageIndex int = 0,
     @ItemsPerPage int = 100
AS

--  exec [get_YourCarsExpired] 1

BEGIN

	SET NOCOUNT ON;

	SELECT distinct c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, 0 as IsBuy, 4 as [Status], FORMAT(ISNULL(c.ModifiedDate, c.CreatedDate), 'dd/MM/yyyy')  as ModifiedDate, c.CountVisit
	from [dbo].[CarForSale] c with(nolock)	
	inner join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = c.UserId
	Where (c.UserId = @UserId or @UserId = 7) and ExpiredDate < GETDATE()

	UNION

	SELECT distinct b.CarId, u.UserId, b.IsNew, b.IsImport, b.[year], b.Firm as FirmName, b.Title, 1 as IsBuy, 4 as [Status], FORMAT(ISNULL(b.ModifiedDate, b.CreatedDate), 'dd/MM/yyyy') as ModifiedDate , b.CountVisit
	from [dbo].[CarForBuy] b with(nolock)	
	left join Province p with(nolock) on p.ProvinceId = b.ProvinceId
	inner join [User] u  with(nolock) on u.UserId = b.UserId
	Where (b.UserId = @UserId or @UserId = 7) and ExpiredDate < GETDATE()
	
END


GO
/****** Object:  StoredProcedure [dbo].[SearchingCarForBuy]    Script Date: 5/16/2017 2:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchingCarForBuy]		
     @CurrentPageIndex int = 0,
     @ItemsPerPage int = 100
AS

/*

exec [Car_Searching] '', ''
*/
BEGIN

	SET NOCOUNT ON;	

	SELECT distinct c.CarId, u.UserId, c.IsNew, c.IsImport, c.[year], c.Firm as FirmName, c.Title, c.[Description], c.Km, c.GearBox, c.PriceFromVN, c.PriceToVN, p.Name as Province, u.UserName ContactName, u.Tel ContactTel
	from [dbo].[CarForBuy] c with(nolock)		
	left join Province p with(nolock) on p.ProvinceId = c.ProvinceId
	inner join [User] u with(nolock) on u.UserId = c.UserId
	left join InteriorColor inter on c.InteriorColorId = inter.InteriorColorId
	left join ExteriorColor ext on c.ExteriorColorId = ext.ExteriorColorId

	Where (c.Status = 1) and ExpiredDate >= GETDATE()
	order by c.CarId desc
END

GO
USE [master]
GO
ALTER DATABASE [CARWEB] SET  READ_WRITE 
GO
