# Create an alert policy
resource "newrelic_alert_policy" "alert" {
  name = "Manish-policy1"
   incident_preference = "PER_POLICY"

}
