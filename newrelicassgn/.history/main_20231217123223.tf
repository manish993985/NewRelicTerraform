# Create an alert policy
resource "newrelic_alert_policy" "alert" {
    count=3
  name = "Manish-policy1 ${count.index}"
   incident_preference = "PER_POLICY"

}
