output "fis_experiment_template_id" {
  description = "ID of created FIS experiment template."
  value       = aws_fis_experiment_template.terminate_instances.id
}