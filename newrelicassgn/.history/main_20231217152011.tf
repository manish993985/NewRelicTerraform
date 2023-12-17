# Create an alert policy
resource "newrelic_alert_policy" "foo" {
  name = "Manish-policy"
  incident_preference = "PER_POLICY"

}

# Creating alert condition
resource "newrelic_nrql_alert_condition" "foo" {
  for_each = var.loop
  account_id                     = 4268462
  policy_id                      = newrelic_alert_policy.foo.id
  name                           = each.key
  description                    = each.value.description
  runbook_url                    = each.value.runbook_url
  
   
  nrql {
    # query = "SELECT average(duration) FROM Transaction where appName = 'Your App'"
    query = "SELECT average(`host.cpuPercent`) FROM Metric WHERE `entity.guid` IN ('NDI2ODQ2MnxJTkZSQXxOQXwxODYyMzk5NTMxMTcyNDk5MDE3') "
  }

  critical {
    operator              = each.value.operator
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.critical_threshold_duration
    threshold_occurrences = each.value.threshold_occurrences
  }

  warning {
    operator              = each.value.operator
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.warning_threshold_duration
    threshold_occurrences = each.value.threshold_occurrences
  }
}