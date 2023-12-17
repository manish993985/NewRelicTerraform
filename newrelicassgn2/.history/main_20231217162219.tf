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
        query      = "SELECT average(diskUsedPercent) from StorageSample"
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

#       # Must be another dashboard GUID
#       filter_current_dashboard = true

#       # color customization
#       colors {
#         color = "#722727"
#         series_overrides {
#           color = "#722322"
#           series_name = "Node"
#         }
#         series_overrides {
#           color = "#236f70"
#           series_name = "Java"
#         }
#       }
#     }

#     widget_line {
#       title  = "Average transaction duration and the request per minute, by application"
#       row    = 4
#       column = 7
#       width  = 6
#       height = 3

#       nrql_query {
#         account_id = 12345
#         query      = "FROM Transaction select max(duration) as 'max duration' where httpResponseCode = '504' timeseries since 5 minutes ago"
#       }

#       nrql_query {
#         query = "FROM Transaction SELECT rate(count(*), 1 minute)"
#       }
#       legend_enabled = true
#       ignore_time_range = false
#       y_axis_left_zero = true
#       y_axis_left_min = 0
#       y_axis_left_max = 1

#       units {
#         unit = "ms"
#         series_overrides {
#           unit = "ms"
#           series_name = "max duration"
#         }
#       }


#     }
  }
}