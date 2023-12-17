# Create an alert policy
resource "newrelic_alert_policy" "foo" {
  name = "Manish-policy"
  incident_preference = "PER_POLICY"

}

# Creating alert condition
resource "newrelic_nrql_alert_condition" "foo" {
  account_id                     = 4268462
  policy_id                      = newrelic_alert_policy.foo.id
  name                           = "Manish-condition"
  description                    = "Alert when transactions are taking too long"
  runbook_url                    = "https://www.example.com"
  enabled                        = true
   
  nrql {
    # query = "SELECT average(duration) FROM Transaction where appName = 'Your App'"
    query = "SELECT average(`host.cpuPercent`) FROM Metric WHERE `entity.guid` IN ('NDI2ODQ2MnxJTkZSQXxOQXwxODYyMzk5NTMxMTcyNDk5MDE3') "
  }

  critical {
    operator              = "above"
    threshold             = 90
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 80
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}