# Create an alert policy
resource "newrelic_alert_policy" "alert" {
    count=3
  name = "Manish-policy${count.index+1}"
   incident_preference = "PER_POLICY"

}
