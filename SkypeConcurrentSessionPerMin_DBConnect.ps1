$dataSource = "server\db"
$user = "user"
$pwd = "pass"
$database = "lcscdr"

$startDate= "2016-06-01 00:00:00"
$endDate="2016-06-30 23:59:59"

$query = "
select SessionIdTime, SessionEndTime from LcsCDR.dbo.ConferenceSessionDetails
where LcsCDR.dbo.ConferenceSessionDetails.UriTypeId = 4
and 
    ((LcsCDR.dbo.ConferenceSessionDetails.SessionIdTime >= Convert(datetime, '$startDate') and LcsCDR.dbo.ConferenceSessionDetails.SessionIdTime <= Convert(datetime, '$endDate'))
    or 
    (LcsCDR.dbo.ConferenceSessionDetails.SessionEndTime >= Convert(datetime, '$startDate') and LcsCDR.dbo.ConferenceSessionDetails.SessionEndTime <= Convert(datetime, '$endDate')))
order by LcsCDR.dbo.ConferenceSessionDetails.SessionIdTime
"

$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connectionString = "Server=$dataSource;uid=$user; pwd=$pwd;Database=$database;Integrated Security=False;"

$connection.Open()
$command = $connection.CreateCommand()
$command.CommandText = $query

$result = $command.ExecuteReader()

$table = new-object "System.Data.DataTable"
$table.Load($result)
$connection.Close()

# do a loop, prepare the time stamps into an array
$result =  @()

$counter = 0
$startDateObj=Get-Date $startDate
$endDateObj=Get-Date $endDate
do {
    $currentTimeStamp = $startDateObj.AddMinutes($counter)
    $currentTimeStampCounter = 0
    
    foreach($record in $table){
        if($record.SessionIdTime -lt $currentTimeStamp -and $record.SessionEndTime -gt $currentTimeStamp){
            $currentTimeStampCounter++
        }
        if($record.SessionIdTime -gt $currentTimeStamp){
            break
        }
    }

    $currentTmeStampStr=$currentTimeStamp.ToString("yyyy-MM-dd hh:mm:ss")
    $result+= "$currentTmeStampStr,$currentTimeStampCounter"
    $counter++
}
while ($currentTmeStamp -lt $endDateObj)
