output "Orbit_billing_view_ids" {
  value = module.Orbit_billing_view[*].view_id
}