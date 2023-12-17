# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}
 
# Configure the New Relic provider
provider "newrelic" {
  account_id = 4268462
  api_key = "NRAK-8JWW2U51GJP7Z9TG1ZO490WYAI8"   # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}