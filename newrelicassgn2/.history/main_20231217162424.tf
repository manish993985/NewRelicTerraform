resource "newrelic_one_dashboard" "exampledashboard" {
  name        = "Manish Dashboard"
  permissions = "public_read_only"

  page {
    name = "New Relic Terraform Dashboard"

    widget_billboard {
      title  = "Requests per minute"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "SELECT average(cpuPercent) from SystemSample"
      }
    }

    widget_bar {
      title  = "Average transaction duration, by application"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = 4268462
        # query      = "SELECT average(diskUsedPercent) from StorageSample"
        query      = "SELECT average(diskFreePercent) FROM StorageSample FACET diskUsedBytes"
      }

    
    }

    widget_pie{
      title  = "Average transaction duration, by application"
      row    = 4
      column = 1
      width  = 6
      height = 3

      nrql_query {
        account_id = 4268462
        query      = "SELECT average(diskFreePercent) FROM StorageSample FACET diskUsedBytes"
      }
    }

  }
}