-- =============================================
--文件    :createAndUpdate.sql
--说明    :创建实体表和边表
--时间    :2020/10/21 09:03:12
--作者    :一直都没有暴富成功的小何
--版本    :1.0
-- =============================================
-- 肝癌  LiverCancerLayer
CREATE TABLE [LiverCancerLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [LayerColumnName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 甲状腺癌 ThyroidCancerLayer
CREATE TABLE [ThyroidCancerLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [LayerColumnName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 淋巴瘤  LymphomaCancerLayer
CREATE TABLE [LymphomaCancerLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [LayerColumnName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 口腔癌  MouthCancerLayer
CREATE TABLE [MouthCancerLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [LayerColumnName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 鼻咽癌  NasopharyngealCarcinomaLayer
CREATE TABLE [NasopharyngealCarcinomaLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [LayerColumnName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 胰腺癌 PancreaticCancerLayer
CREATE TABLE [PancreaticCancerLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [LayerColumnName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 肾癌 RenalCarcinomaLayer
CREATE TABLE [RenalCarcinomaLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [LayerColumnName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


--DiseaseLayer(最新表)
CREATE TABLE [DiseaseLayer](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [LayerName] [nvarchar](100) NULL,
        [DiseaseName] [nvarchar](25) NULL,
        [LayerColumnName] [nvarchar](25) NULL      
)AS NODE ON [PRIMARY] ;

-- 存在Stage 癌种的 Stage 节点表
-- 当前只有肝癌、口腔癌、鼻咽癌、肾癌

CREATE TABLE [DiseaseStage](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [StageName] [nvarchar](100) NULL,
        [DiseaseName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 存在Type 癌种的 Type 节点表
-- 当前只有胰腺癌、淋巴瘤

CREATE TABLE [DiseaseType](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [TypeName] [nvarchar](100) NULL,
        [DiseaseName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;

--MasterScheme
CREATE TABLE [dbo].[MasterScheme](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemeName] [nvarchar](100) NULL,
	[DiseaseName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- Disease节点表
-- 列名idDiseaseName数据类型bigint[nvarchar](25)
CREATE TABLE [Disease](
        [Id] [bigint] IDENTITY(1,1) NOT NULL,
        [DiseaseName] [nvarchar](25) NULL
)AS NODE ON [PRIMARY] ;


-- 边表
-- disease-stage

CREATE TABLE [EDGEDiseaseToStage](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];

-- disease-layer

CREATE TABLE [EDGEDiseaseToLayer](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];

-- disease-type

CREATE TABLE [EDGEDiseaseToType](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];

-- stage-layer

CREATE TABLE [EDGEStageToLayer](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];

-- type-layer

CREATE TABLE [EDGETypeToLayer](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];


-- layer-masterScheme

CREATE TABLE [EDGEStageOrLayerToMaster](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL,
				[DiseaseName] [nvarchar](100) NOT NULL,
				[SchemeId]  [bigint]  NOT NULL
)AS EDGE ON [PRIMARY];

-- masterScheme-subscheme

CREATE TABLE [EDGEMasterToSlave](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL,
        [ExeOrder] [nvarchar](100) NOT NULL,
        [MasterSchemeId] int NOT NULl,
        [SlaveSchemeId] int NOT NULl
)AS EDGE ON [PRIMARY];


--layer to layer
CREATE TABLE [EDGELayerToLayer](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL,
				[source_layer_name] [nvarchar](100) NOT NULL,
        [target_layer_name] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];

---price-----------------------------------
-- sub -drug   EDGEDrugRelate
CREATE TABLE [EDGEDrugRelate](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL,
				[ComponentName] [nvarchar](100) NOT NULL,
        [DrugName] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];


-- drug name  -EDGEDrugPrice   EDGEDrugPrice
CREATE TABLE [EDGEDrugPrice](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL,
				[drug_name] [nvarchar](100) NOT NULL,
        [price_name] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];


-- drug sub -identity  -EDGEDrugNameIdentity   EDGEDrugNameIdentity
CREATE TABLE [EDGEDrugNameIdentity](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL,
				[drug_name] [nvarchar](100) NOT NULL,
        [idname] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];

-- drug name  -identity   productPriceCompare
CREATE TABLE [EDGEDrugProductPrice](
        [source_node] [nvarchar](100) NOT NULL,
        [target_node] [nvarchar](100) NOT NULL,
				[drug_name] [nvarchar](100) NOT NULL,
        [name] [nvarchar](100) NOT NULL
)AS EDGE ON [PRIMARY];


--主方案和子方案的关联 TreatSubRelation
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
) ON [PRIMARY];
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主方案ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreatSubRelation', @level2type=N'COLUMN',@level2name=N'SchemeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子方案表内ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreatSubRelation', @level2type=N'COLUMN',@level2name=N'SubId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码 x-y-z 代表 疾病编码-主方案-子方案执行顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreatSubRelation', @level2type=N'COLUMN',@level2name=N'IndCode'
GO
