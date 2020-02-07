/****** Object:  Schema [Ingestion]    Script Date: 12/12/2019 5:51:57 PM ******/
CREATE SCHEMA [Ingestion]
GO
/****** Object:  Table [Ingestion].[job_error_log]    Script Date: 12/12/2019 5:52:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ingestion].[job_error_log](
	[job_id] [varchar](10) NOT NULL,
	[cycle_date] [date] NOT NULL,
	[batch_id] [int] NOT NULL,
	[source_system_id] [int] NOT NULL,
	[source_system_name] [varchar](40) NOT NULL,
	[obj_name] [varchar](100) NOT NULL,
	[error_id] [varchar](20) NOT NULL,
	[process_layer] [varchar](40) NULL,
	[error_description] [varchar](1000) NULL,
	[batch_type] [varchar](20) NOT NULL,
	[BATCH_SEQUENCE_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC,
	[cycle_date] ASC,
	[batch_id] ASC,
	[source_system_id] ASC,
	[obj_name] ASC,
	[error_id] ASC,
	[batch_type] ASC,
	[BATCH_SEQUENCE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO

ALTER TABLE [Ingestion].[job_error_log] ADD  DEFAULT ((1)) FOR [BATCH_SEQUENCE_ID]
GO

/****** Object:  Table [Ingestion].[batch_tracking]    Script Date: 12/12/2019 5:41:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ingestion].[batch_tracking](
	[cycle_date] [date] NOT NULL,
	[batch_id] [int] NOT NULL,
	[source_system_id] [varchar](10) NOT NULL,
	[source_system_name] [varchar](40) NOT NULL,
	[batch_start_time] [datetime] NULL,
	[batch_end_time] [datetime] NULL,
	[status] [varchar](20) NULL,
	[batch_type] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cycle_date] ASC,
	[batch_id] ASC,
	[source_system_id] ASC,
	[batch_type] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO


/****** Object:  Table [Ingestion].[control_inventory]    Script Date: 12/12/2019 5:41:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ingestion].[control_inventory](
	[CONTROL_MEASURES_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SOURCE_SYSTEM_ID] [int] NOT NULL,
	[CYCLE_DATE] [date] NOT NULL,
	[BATCH_TYPE] [varchar](20) NOT NULL,
	[BATCH_ID] [int] NOT NULL,
	[CONTROL_TYPE] [varchar](50) NOT NULL,
	[MEASURE_CATEGORY] [varchar](50) NOT NULL,
	[MEASURE_GROUP] [varchar](1000) NULL,
	[MEASURE_TYPE] [varchar](50) NOT NULL,
	[MEASURE_SRC_TGT_ADJ_NAME] [varchar](100) NOT NULL,
	[MEASURE_NOTE] [varchar](100) NOT NULL,
	[MEASURE_SRC_TGT_ADJ_INDICATOR] [char](1) NOT NULL,
	[MEASURE_FIELD_NAME] [varchar](50) NULL,
	[MEASURE_VALUE] [varchar](256) NULL,
	[CURRENT_INDICATOR] [char](1) NOT NULL,
	[CREATED_DATE] [datetime] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[UPDATED_DATE] [datetime] NULL,
	[UPDATED_BY] [varchar](50) NULL,
	[BATCH_SEQUENCE_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CONTROL_MEASURES_ID] ASC,
	[SOURCE_SYSTEM_ID] ASC,
	[CYCLE_DATE] ASC,
	[BATCH_ID] ASC,
	[BATCH_SEQUENCE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO

ALTER TABLE [Ingestion].[control_inventory] ADD  DEFAULT (getdate()) FOR [CREATED_DATE]
GO

ALTER TABLE [Ingestion].[control_inventory] ADD  DEFAULT (user_name()) FOR [CREATED_BY]
GO

ALTER TABLE [Ingestion].[control_inventory] ADD  DEFAULT ((1)) FOR [BATCH_SEQUENCE_ID]
GO
/****** Object:  Table [Ingestion].[control_results]    Script Date: 12/12/2019 5:42:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ingestion].[control_results](
	[CONTROL_RESULTS_ID] [int] IDENTITY(1,1) NOT NULL,
	[SOURCE_SYSTEM_ID] [int] NOT NULL,
	[CYCLE_DATE] [date] NOT NULL,
	[BATCH_TYPE] [varchar](20) NOT NULL,
	[BATCH_ID] [int] NOT NULL,
	[MEASURE_CATEGORY] [varchar](50) NOT NULL,
	[MEASURE_GROUP] [varchar](100) NOT NULL,
	[MEASURE_TYPE] [varchar](50) NOT NULL,
	[CONTROL_RESULT_SUCCESS] [varchar](1) NOT NULL,
	[SRC_CONTROL_MEASURES_ID] [int] NULL,
	[TGT_CONTROL_MEASURES_ID] [int] NULL,
	[SRC_VALUE] [varchar](256) NULL,
	[TGT_VALUE] [varchar](256) NULL,
	[CONTROL_RESULT_DESCRIPTION] [varchar](100) NULL,
	[CURRENT_INDICATOR] [char](1) NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[CREATED_BY] [varchar](50) NOT NULL,
	[UPDATED_DATE] [datetime] NOT NULL,
	[UPDATED_BY] [varchar](50) NOT NULL,
	[BATCH_SEQUENCE_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CONTROL_RESULTS_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO

ALTER TABLE [Ingestion].[control_results] ADD  DEFAULT (getdate()) FOR [CREATED_DATE]
GO

ALTER TABLE [Ingestion].[control_results] ADD  DEFAULT (user_name()) FOR [CREATED_BY]
GO

ALTER TABLE [Ingestion].[control_results] ADD  DEFAULT ((1)) FOR [BATCH_SEQUENCE_ID]
GO

/****** Object:  Table [Ingestion].[dq_error_log]    Script Date: 12/12/2019 5:42:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ingestion].[dq_error_log](
	[source_system_id] [int] NOT NULL,
	[source_system_name] [varchar](40) NOT NULL,
	[obj_name] [varchar](100) NOT NULL,
	[cycle_date] [date] NOT NULL,
	[batch_id] [varchar](5) NOT NULL,
	[error_record_seq] [varchar](20) NOT NULL,
	[process_layer] [varchar](40) NULL,
	[error_file_location] [varchar](500) NULL,
	[error_description] [varchar](1000) NULL,
	[BATCH_SEQUENCE_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[source_system_id] ASC,
	[obj_name] ASC,
	[cycle_date] ASC,
	[batch_id] ASC,
	[error_record_seq] ASC,
	[BATCH_SEQUENCE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO

ALTER TABLE [Ingestion].[dq_error_log] ADD  DEFAULT ((1)) FOR [BATCH_SEQUENCE_ID]
GO

/****** Object:  Table [Ingestion].[job_run_stats]    Script Date: 12/12/2019 5:43:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ingestion].[job_run_stats](
	[job_id] [varchar](10) NOT NULL,
	[cycle_date] [date] NOT NULL,
	[batch_id] [int] NOT NULL,
	[source_system_id] [int] NOT NULL,
	[source_system_name] [varchar](40) NULL,
	[obj_name] [varchar](100) NOT NULL,
	[source_object_name] [varchar](100) NULL,
	[target_object_name] [varchar](100) NULL,
	[source_layer] [varchar](40) NULL,
	[target_layer] [varchar](40) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[process_duration] [int] NULL,
	[load_status] [varchar](40) NULL,
	[batch_type] [varchar](20) NOT NULL,
	[BATCH_SEQUENCE_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC,
	[cycle_date] ASC,
	[batch_id] ASC,
	[source_system_id] ASC,
	[obj_name] ASC,
	[batch_type] ASC,
	[BATCH_SEQUENCE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO

ALTER TABLE [Ingestion].[job_run_stats] ADD  DEFAULT ((1)) FOR [BATCH_SEQUENCE_ID]
GO

/****** Object:  Table [Ingestion].[tamonthend]    Script Date: 12/12/2019 5:44:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ingestion].[tamonthend](
	[YEAR] [int] NOT NULL,
	[MONTH] [varchar](100) NOT NULL,
	[MONTH_END_DATE] [date] NOT NULL
)
GO

/****** Object:  StoredProcedure [Ingestion].[USP_InsertBatchTracking]    Script Date: 12/12/2019 5:46:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [Ingestion].[USP_InsertBatchTracking]   
@cycle_date date,  
@batch_id int,  
@source_system_name varchar(40),  
@source_system_id int,  
@batch_start_time datetime,  
@batch_end_time datetime,  
@status varchar(20),  
@batch_type varchar(40),  
@action varchar(20)  
AS  
BEGIN  
DECLARE @validatequery varchar(10);
SET @validatequery=(select distinct LOAD_STATUS from [ingestion].[job_run_stats] where load_status='FAILED' and source_system_name=@source_system_name and cycle_date=@cycle_date and BATCH_ID=@batch_id
and   batch_type=@batch_type     )
IF @validatequery='FAILED'
	update ingestion.batch_tracking set  
	batch_end_time=@batch_end_time,status=@status,batch_id=@batch_id  
	where cycle_date=FORMAT(@cycle_date, 'yyyy-MM-dd')  and batch_id=@batch_id and source_system_id=@source_system_id  and   batch_type=@batch_type  
ELSE
	IF @action='Initiate'  
	insert into ingestion.batch_tracking (cycle_date,batch_id,source_system_id,source_system_name,batch_start_time,batch_end_time,status,batch_type) values(FORMAT(@cycle_date, 'yyyy-MM-dd'),@batch_id,@source_system_id,@source_system_name,@batch_start_time,@batch_end_time,@status,@batch_type)  
	else   
	update ingestion.batch_tracking set  
	batch_end_time=@batch_end_time,status=@status  
	where cycle_date=FORMAT(@cycle_date, 'yyyy-MM-dd')  and batch_id=@batch_id and source_system_id=@source_system_id  
END;
GO

/****** Object:  StoredProcedure [Ingestion].[USP_InsertJobErrorLog]    Script Date: 12/12/2019 5:46:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [Ingestion].[USP_InsertJobErrorLog] @job_id bigint,@cycle_date date,@error_id varchar(20),@obj_name varchar(100),@process_layer varchar(40),@error_description varchar(1000),@source_system_name varchar(40),@source_system_id varchar(10), @batch_type varchar(40), @batch_id int, @batch_sequence_id int
AS
BEGIN
DECLARE @counter int
SET @counter = (select count(*) from ingestion.job_error_log where cycle_date=FORMAT(@cycle_date, 'yyyy-MM-dd') and batch_id=@batch_id and batch_sequence_id=@batch_sequence_id and source_system_id=@source_system_id and obj_name=@obj_name and job_id=@job_id)
IF @counter=0
insert into ingestion.job_error_log (job_id,cycle_date,batch_id,batch_sequence_id,source_system_id,source_system_name,obj_name,error_id,process_layer,error_description,batch_type) values(@job_id,FORMAT(@cycle_date, 'yyyy-MM-dd'),@batch_id,@batch_sequence_id,@source_system_id,@source_system_name,@obj_name,@error_id,@process_layer,@error_description,@batch_type)
END;
GO


/****** Object:  StoredProcedure [Ingestion].[USP_InsertJobRunStats]    Script Date: 12/12/2019 5:47:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [Ingestion].[USP_InsertJobRunStats]
 @old_job_id bigint,@new_job_id bigint,@batch_id int,@batch_sequence_id int,
 @cycle_date date,@obj_name varchar(40),
 @source_system_name varchar(40),
 @source_system_id int,
 @source_object_name varchar(100),
 @target_object_name varchar(100),
 @source_layer varchar(40),
 @target_layer varchar(40),
 @start_time datetime,
 @end_time datetime,@load_status varchar(40),@process_duration int,@action varchar(40),@batch_type varchar(40)
AS
BEGIN
--select @batch_id=max(batch_id) from ingestion.batch_run_stats_test where cycle_date=FORMAT(@cycle_date, 'yyyy-MM-dd') and
--source_system_name=@source_system_name
IF @action='Initiate' --Just inserts a new record in the table
begin
insert into ingestion.job_run_stats (job_id ,cycle_date ,batch_id , batch_sequence_id ,source_system_id ,source_system_name ,obj_name ,source_object_name ,target_object_name ,source_layer ,target_layer ,start_time ,end_time ,process_duration,load_status,batch_type) 
values (@new_job_id, FORMAT(@cycle_date, 'yyyy-MM-dd'), @batch_id,@batch_sequence_id, @source_system_id, @source_system_name, @obj_name, @source_object_name, @target_object_name, @source_layer, @target_layer, @start_time, @end_time, @process_duration, @load_status,@batch_type)
end
else IF @action='Update' --Updates the status of an existing record of the table
update ingestion.job_run_stats set
end_time=@end_time,load_status=@load_status,process_duration=@process_duration
where obj_name=@obj_name and job_id=@old_job_id and batch_id=@batch_id and batch_sequence_id=@batch_sequence_id and cycle_date=FORMAT(@cycle_date, 'yyyy-MM-dd') and source_system_id=@source_system_id and   batch_type=@batch_type  
else IF @action='Update and Initiate' -- Updates and existing record and then inserts a new record for the next layer
BEGIN
update ingestion.job_run_stats set
end_time=@end_time,load_status=@load_status,process_duration=@process_duration
where obj_name=@obj_name and job_id=@old_job_id and batch_id=@batch_id and batch_sequence_id=@batch_sequence_id and cycle_date=FORMAT(@cycle_date, 'yyyy-MM-dd') and source_system_id=@source_system_id and   batch_type=@batch_type  
insert into ingestion.job_run_stats (job_id ,cycle_date ,batch_id , batch_sequence_id ,source_system_id ,source_system_name ,obj_name ,source_object_name ,target_object_name ,source_layer ,target_layer ,start_time ,end_time ,process_duration,load_status,batch_type) 
values (@new_job_id, FORMAT(@cycle_date, 'yyyy-MM-dd'), @batch_id ,@batch_sequence_id, @source_system_id, @source_system_name, @obj_name, @source_object_name, @target_object_name, @source_layer, @target_layer, @start_time, NULL, NULL, 'IN-PROGRESS',@batch_type)
END
END;
GO

/****** Object:  StoredProcedure [Ingestion].[USP_InsertMonthEnd]    Script Date: 12/12/2019 5:48:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [Ingestion].[USP_InsertMonthEnd] @month_end_date date
AS
BEGIN
insert into ingestion.tamonthend VALUES (YEAR(@month_end_date),MONTH(@month_end_date),@month_end_date);
END;
GO

/****** Object:  StoredProcedure [Ingestion].[USP_UpdateCurrentIndicator]    Script Date: 12/12/2019 5:48:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [Ingestion].[USP_UpdateCurrentIndicator]   
@cycle_date date,  
@batch_id int,  
@batch_sequence_id int,
@source_system_name varchar(40),  
@source_system_id int,  
@batch_type varchar(40)
AS  
BEGIN  

update [Ingestion].[control_inventory] set current_indicator='N' where source_system_id=@source_system_id and cycle_date=@cycle_date
and batch_type=@batch_type and batch_id=@batch_id and 
batch_sequence_id in
(select distinct batch_sequence_id from [Ingestion].[control_inventory] where batch_sequence_id < @batch_sequence_id
and source_system_id=@source_system_id and cycle_date=@cycle_date
and batch_type=@batch_type and batch_id=@batch_id)

update [Ingestion].[control_Results]  set current_indicator='N' where source_system_id=@source_system_id and cycle_date=@cycle_date
and batch_type=@batch_type and batch_id=@batch_id and 
batch_sequence_id in
(select distinct batch_sequence_id from [Ingestion].[control_Results] where batch_sequence_id < @batch_sequence_id
and source_system_id=@source_system_id and cycle_date=@cycle_date
and batch_type=@batch_type and batch_id=@batch_id)

END;


GO

/****** Object:  StoredProcedure [Ingestion].[USP_UpdateIngestionHandoffConfig]    Script Date: 12/12/2019 5:49:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [Ingestion].[USP_UpdateIngestionHandoffConfig] @source_system_name varchar(40), @cycle_date varchar(20)
AS
BEGIN
UPDATE [preingestion].[ingestion_handoff] SET blob_file_name=source_file_name, 
blob_file_location=concat('landing/',@source_system_name,'/',object_name,'/',convert(nvarchar(20),convert(datetime, @cycle_date, 126) ,23 )), 
 delta_table_name = (case when OBJECT_PROCESSING_TYPE='FULL' then 'NA' 
 else concat(@source_system_name,'.',object_name) end)
,
adls_path=concat('curated/',@source_system_name), 
updated_date=GETDATE(), updated_by='ADF Ingestion Pipeline'
where source_system_name=@source_system_name and cycle_date=@cycle_date and current_indicator='Y' and (ingestion_object_status is NULL or ingestion_object_status='FAILED')
END;

GO

/****** Object:  StoredProcedure [Ingestion].[USP_UpdateIngestionHandoffStatus]    Script Date: 12/12/2019 5:49:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [Ingestion].[USP_UpdateIngestionHandoffStatus] @source_system_id int,@source_system_name varchar(40),@cycle_date date,@batch_id int, @batch_sequence_id int ,@batch_type varchar(40) 
AS  
BEGIN  
update preingestion.ingestion_handoff set ingestion_object_status='SUCCESS',handoff_status='SUCCESS'  
where source_system_id=@source_system_id and cycle_date=@cycle_date and current_indicator='Y' and
 object_name not in ( select distinct obj_name from ingestion.job_run_stats where cycle_date=@cycle_date and batch_id
=@batch_id and source_system_name=@source_system_name and load_status='FAILED' and batch_sequence_id=@batch_sequence_id and  batch_type=@batch_type   )  ;
update preingestion.ingestion_handoff set ingestion_object_status='FAILED',handoff_status='FAILED'  
where source_system_id=@source_system_id and cycle_date=@cycle_date and current_indicator='Y' and  batch_type=@batch_type  and object_name in ( select distinct obj_name from ingestion.job_run_stats where cycle_date=@cycle_date and batch_id=@batch_id and source_system_name=@source_system_name and load_status='FAILED' and batch_sequence_id=@batch_sequence_id and  batch_type=@batch_type ) ; 
update ingestion.control_inventory set current_indicator='N' where source_system_id=@source_system_id and cycle_date=@cycle_date and batch_id=@batch_id and current_indicator='Y' and  batch_type=@batch_type  and batch_sequence_id=(batch_sequence_id-1) and measure_group in ( select measure_group from ingestion.control_inventory where source_system_id=@source_system_id and cycle_date=@cycle_date and batch_id=@batch_id and batch_sequence_id=@batch_sequence_id and current_indicator='Y' and  batch_type=@batch_type );
update ingestion.control_results set current_indicator='N' where source_system_id=@source_system_id and cycle_date=@cycle_date and batch_id=@batch_id and current_indicator='Y' and  batch_type=@batch_type  and batch_sequence_id=(batch_sequence_id-1) and measure_group in ( select measure_group from ingestion.control_results where source_system_id=@source_system_id and cycle_date=@cycle_date and batch_id=@batch_id and batch_sequence_id=@batch_sequence_id and current_indicator='Y' and  batch_type=@batch_type );
END;

GO







