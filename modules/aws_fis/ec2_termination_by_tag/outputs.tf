output "fis_experiment_template_id" {
  description = "ID of created FIS experiment template."
  value       = replace(aws_fis_experiment_template.terminate_instances.arn, "arn:aws:fis:[^:]+:[^:]+:experiment-template/", "")
}