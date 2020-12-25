

CREATE TABLE [TreatSubRelation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[SubId] [bigint] NOT NULL,
	[TableName] [nvarchar](30) NULL,
	[ExeOrder] [int] NOT NULL,
	[IndCode] [nvarchar](30) NULL,
 CONSTRAINT [PK_TreatSubRelation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主方案ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreatSubRelation', @level2type=N'COLUMN',@level2name=N'SchemeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子方案表内ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreatSubRelation', @level2type=N'COLUMN',@level2name=N'SubId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码 x-y-z 代表 疾病编码-主方案-子方案执行顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreatSubRelation', @level2type=N'COLUMN',@level2name=N'IndCode'
GO




CREATE TABLE [dbo].[TreatScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](50) NULL,
	[SchemeType] [int] NOT NULL,
	[SchemeDetail] [nvarchar](2000) NULL,
	[SchemeVersion] [nvarchar](20) NULL,
	[Report] [ntext] NULL,
	[Efficacy] [nvarchar](50) NULL,
	[SideEffect] [nvarchar](50) NULL,
	[PatientNum] [int] NOT NULL,
	[Duration] [nvarchar](50) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_TreatScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


-------------------------SUB


CREATE TABLE [dbo].[TargetedtherapySubScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](500) NULL,
	[DrugComponentName] [nvarchar](50) NULL,
	[DrugComponentId] [bigint] NOT NULL,
	[Dose] [nvarchar](500) NULL,
	[Cycle] [nvarchar](100) NULL,
	[Freq] [nvarchar](100) NULL,
	[TotalTime] [nvarchar](100) NULL,
	[SideEffect] [nvarchar](500) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Efficacylevel] [nvarchar](50) NULL,
	[PatientNum] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Days] [int] NOT NULL,
	[ActivitySubTypeId] [bigint] NOT NULL,
	[IsTargetDrug] [bit] NOT NULL,
	[TotalCycle] [int] NOT NULL,
 CONSTRAINT [PK_TargetedtherapySubScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



CREATE TABLE [dbo].[SurgerySubScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](50) NULL,
	[SurgeryName] [nvarchar](50) NULL,
	[SurgeryTime] [nvarchar](50) NULL,
	[HospitalTime] [nvarchar](50) NULL,
	[Complication] [nvarchar](500) NULL,
	[Cost] [nvarchar](50) NULL,
	[Efficacylevel] [nvarchar](50) NULL,
	[PatientNum] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Days] [int] NOT NULL,
	[ActivitySubTypeId] [bigint] NOT NULL,
 CONSTRAINT [PK_SurgerySubScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



CREATE TABLE [dbo].[RadiotherapySubScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](500) NULL,
	[RadioName] [nvarchar](500) NULL,
	[TotalDose] [nvarchar](50) NOT NULL,
	[SingleDose] [decimal](10, 2) NOT NULL,
	[RadiationDistance] [nvarchar](500) NULL,
	[UseEquipment] [nvarchar](500) NULL,
	[Radiotherapytechnology] [nvarchar](500) NULL,
	[SideEffect] [nvarchar](500) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Efficacylevel] [nvarchar](10) NULL,
	[PatientNum] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Days] [int] NOT NULL,
	[ActivitySubTypeId] [bigint] NOT NULL,
	[TotalCycle] [int] NOT NULL,
 CONSTRAINT [PK_RadiotherapySubScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)as node  ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



CREATE TABLE [dbo].[OtherSubScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](500) NULL,
	[DrugComponentName] [nvarchar](50) NULL,
	[DrugComponentId] [bigint] NOT NULL,
	[Dose] [nvarchar](500) NULL,
	[Cycle] [nvarchar](50) NULL,
	[Freq] [nvarchar](100) NULL,
	[TotalTime] [nvarchar](100) NULL,
	[SideEffect] [nvarchar](500) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Efficacylevel] [nvarchar](10) NULL,
	[PatientNum] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Days] [int] NOT NULL,
	[ActivitySubTypeId] [bigint] NOT NULL,
	[TotalCycle] [int] NOT NULL,
 CONSTRAINT [PK_OtherSubScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




CREATE TABLE [dbo].[EndocrinetherapySubScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](50) NULL,
	[DrugComponentName] [nvarchar](50) NULL,
	[DrugComponentId] [bigint] NOT NULL,
	[Dose] [nvarchar](500) NULL,
	[Cycle] [nvarchar](50) NULL,
	[Freq] [nvarchar](100) NULL,
	[TotalTime] [nvarchar](10) NULL,
	[SideEffect] [nvarchar](500) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Efficacylevel] [nvarchar](10) NULL,
	[PatientNum] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Days] [int] NOT NULL,
	[ActivitySubTypeId] [bigint] NOT NULL,
	[TotalCycle] [int] NULL,
 CONSTRAINT [PK_EndocrinetherapySubScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE TABLE [dbo].[ChemotherapySubScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](500) NULL,
	[DrugComponentName] [nvarchar](50) NULL,
	[DrugComponentId] [bigint] NOT NULL,
	[Dose] [nvarchar](500) NULL,
	[Cycle] [nvarchar](50) NULL,
	[Freq] [nvarchar](100) NULL,
	[TotalTime] [nvarchar](100) NULL,
	[SideEffect] [nvarchar](500) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Efficacylevel] [nvarchar](10) NULL,
	[PatientNum] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Days] [int] NOT NULL,
	[ActivitySubTypeId] [bigint] NOT NULL,
	[TotalCycle] [int] NOT NULL,
 CONSTRAINT [PK_ChemotherapySubScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


-----------------------Master


CREATE TABLE [dbo].[DiseaseSchemeRela](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[DiseaseName] [nvarchar](50) NULL,
	[DiseaseStage] [nvarchar](50) NULL,
	[Diseaselayer] [nvarchar](50) NULL,
	[SchemeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiseaseSchemeRela] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)as node ON [PRIMARY]
GO








CREATE TABLE [dbo].[DiseaseSchemeRela_pancreas](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[DiseaseName] [nvarchar](50) NULL,
	[DiseaseType] [nvarchar](50) NULL,
	[Diseaselayer1] [nvarchar](50) NULL,
	[Diseaselayer2] [nvarchar](50) NULL,
	[Diseaselayer3] [nvarchar](50) NULL,
	[SchemeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiseaseSchemeRela_pancreas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY]
GO




CREATE TABLE [dbo].[DiseaseSchemeRela_mouth](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[DiseaseName] [nvarchar](50) NULL,
	[DiseaseStage] [nvarchar](50) NULL,
	[Diseaselayer] [nvarchar](50) NULL,
	[Diseaselayer2] [nvarchar](50) NULL,
	[SchemeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiseaseSchemeRela_mouth] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY]
GO



CREATE TABLE [dbo].[DiseaseSchemeRela_nasopharynx](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[DiseaseName] [nvarchar](50) NULL,
	[DiseaseStage] [nvarchar](50) NULL,
	[Diseaselayer] [nvarchar](50) NULL,
	[Diseaselayer2] [nvarchar](50) NULL,
	[SchemeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiseaseSchemeRela_nasopharynx] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE  ON [PRIMARY]
GO


CREATE TABLE [dbo].[DiseaseSchemeRela_renal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[DiseaseName] [nvarchar](100) NULL,
	[DiseaseStage] [nvarchar](100) NULL,
	[Diseaselayer] [nvarchar](100) NULL,
	[Diseaselayer2] [nvarchar](100) NULL,
	[Diseaselayer3] [nvarchar](100) NULL,
	[Diseaselayer4] [nvarchar](100) NULL,
	[Diseaselayer5] [nvarchar](100) NULL,
	[SchemeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiseaseSchemeRela_renal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY]
GO



CREATE TABLE [dbo].[DiseaseSchemeRela_goiter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[DiseaseName] [nvarchar](500) NULL,
	[Diseaselayer1] [nvarchar](500) NULL,
	[Diseaselayer2] [nvarchar](500) NULL,
	[Diseaselayer3] [nvarchar](500) NULL,
	[Diseaselayer4] [nvarchar](500) NULL,
	[SchemeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiseaseSchemeRela_goiter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY]
GO



CREATE TABLE [dbo].[DiseaseSchemeRela_lymph](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeId] [bigint] NOT NULL,
	[DiseaseName] [nvarchar](50) NULL,
	[DiseaseType] [nvarchar](50) NULL,
	[Diseaselayer1] [nvarchar](50) NULL,
	[Diseaselayer2] [nvarchar](50) NULL,
	[Diseaselayer3] [nvarchar](50) NULL,
	[Diseaselayer4] [nvarchar](50) NULL,
	[Diseaselayer5] [nvarchar](50) NULL,
	[SchemeName] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiseaseSchemeRela_lymph] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)AS NODE ON [PRIMARY]
GO

CREATE TABLE [dbo].[DiseaseSchemeRela_rectum] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [SchemeId] bigint  NOT NULL,
  [DiseaseName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer1] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer2] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer3] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer4] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer5] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer6] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [SchemeName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)AS NODE ON [PRIMARY]
GO

CREATE TABLE [dbo].[DiseaseSchemeRela_melanoma] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [SchemeId] bigint  NOT NULL,
  [DiseaseName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [DiseaseType] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer1] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer2] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer3] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer4] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [SchemeName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)AS NODE ON [PRIMARY]
GO


CREATE TABLE [dbo].[DiseaseSchemeRela_colon] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [SchemeId] bigint  NOT NULL,
  [DiseaseName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer1] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer2] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer3] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer4] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer5] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [SchemeName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)AS NODE ON [PRIMARY]
GO

CREATE TABLE [dbo].[DiseaseSchemeRela_gastric] (
  [Id] bigint  IDENTITY(1,1) NOT NULL,
  [SchemeId] bigint  NOT NULL,
  [DiseaseName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer1] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer2] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer3] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer4] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Diseaselayer5] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [SchemeName] nvarchar(500) COLLATE Chinese_PRC_CI_AS  NULL
)AS NODE ON [PRIMARY]
GO