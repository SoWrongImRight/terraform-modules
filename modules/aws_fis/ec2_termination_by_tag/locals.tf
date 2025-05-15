locals {
  valid_dashboard_arn = (
    var.report_dashboard_arn != null &&
    var.report_dashboard_arn != ""
  )
}
