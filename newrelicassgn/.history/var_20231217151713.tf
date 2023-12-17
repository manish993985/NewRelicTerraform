variable "loop" {
    type = map(any)
    default = {
        Manishcondition1 : {
            description = "Created condition 1 for Manish-policy"
            runbook_url = "https://www.example.com"
            
            query = "SELECT average(`host.cpuPercent`) FROM Metric WHERE `entity.guid` IN ('NDI2ODQ2MnxJTkZSQXxOQXwxODYyMzk5NTMxMTcyNDk5MDE3') "
            operator              = "above"
            critical_threshold    = 90 
            warning_threshold     = 80
            critical_threshold_duration = 300 
            warning_threshold_duration  = 600
            threshold_occurrences = "ALL"

        },

        Manishcondition2:  {
            description = "Created condition 2 for Manish-policy"
            runbook_url = "https://www.example.com"
            query = "SELECT average(`host.cpuPercent`) FROM Metric WHERE `entity.guid` IN ('NDI2ODQ2MnxJTkZSQXxOQXwxODYyMzk5NTMxMTcyNDk5MDE3') "
            operator              = "above"
            threshold             = [90 , 80]
            threshold_duration    = [300, 600]
            threshold_occurrences = "ALL"


        }
    }
  
}