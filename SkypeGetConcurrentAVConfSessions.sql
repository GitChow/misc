-- create the function
create function dbo.getConcurrentAVConfSessions(@TimeFrom DATETIME2,@TimeEnd DATETIME2)
returns @ConcurrentSessionEvery1min TABLE (datatime DATETIME2,concurrentCount int )
as
begin
DECLARE @currentTimePoint DATETIME2;
SET @currentTimePoint = @TimeFrom;
while (@currentTimePoint < @TimeEnd)
	begin
		-- the check point is every 1 min
		set @currentTimePoint = DATEADD(MINUTE, 1, @currentTimePoint);

		-- get the concurrent amount of current check point "currentTimePoint "
		declare @concurrentAmountCurrentTime int
		set @concurrentAmountCurrentTime = (
			select count(*) from LcsCDR.dbo.ConferenceSessionDetails
			where UriTypeId = 4 
				and SessionIdTime < @currentTimePoint 
				and SessionEndTime > @currentTimePoint
		)
		
		-- insert the concurrent amount and the current time point into the table variable
		insert @ConcurrentSessionEvery1min (datatime,concurrentCount)
		values (@currentTimePoint,@concurrentAmountCurrentTime);
	end
return
end
go
