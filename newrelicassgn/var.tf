variable "loop" {
    type = map(any)
    default = {
        Manishcondition1 : {
            description = "Creating condition 1 for Manish-policy"
            runbook_url = "https://www.example.com"
            
            query = "SELECT average(`host.cpuPercent`) FROM Metric WHERE `entity.guid` IN ('NDI2ODQ2MnxJTkZSQXxOQXwxODYyMzk5NTMxMTcyNDk5MDE3') "
            operator              = "above"
            critical_threshold    = 98 
            warning_threshold     = 89
            critical_threshold_duration = 300 
            warning_threshold_duration  = 600
            threshold_occurrences = "ALL"

        },

        Manishcondition2:  {
            description = "Creating condition 2 for Manish-policy"
            runbook_url = "https://www.example.com"
            query = " SELECT average(diskUsedPercent) from StorageSample "
            operator              = "above"
            critical_threshold    = 50 
            warning_threshold     = 34
            critical_threshold_duration = 300 
            warning_threshold_duration  = 600
            threshold_occurrences = "ALL"


        }
    }
  
}