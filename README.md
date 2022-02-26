# terraform-null-torrc

Renders a configuration file for tor.

## Example

```
module "torrc" {
  source = "sr2c/torrc/null"
  namespace = "<yourorg>"
  name = "bridge"
}
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bridge_distribution"></a> [bridge\_distribution](#input\_bridge\_distribution) | n/a | `any` | `null` | no |
| <a name="input_bridge_relay"></a> [bridge\_relay](#input\_bridge\_relay) | n/a | `any` | `null` | no |
| <a name="input_contact_info"></a> [contact\_info](#input\_contact\_info) | n/a | `any` | `null` | no |
| <a name="input_control_port"></a> [control\_port](#input\_control\_port) | n/a | `any` | `null` | no |
| <a name="input_ext_or_port"></a> [ext\_or\_port](#input\_ext\_or\_port) | n/a | `any` | `null` | no |
| <a name="input_nickname"></a> [nickname](#input\_nickname) | n/a | `any` | `null` | no |
| <a name="input_or_port"></a> [or\_port](#input\_or\_port) | n/a | `any` | `null` | no |
| <a name="input_server_transport_listen_addr"></a> [server\_transport\_listen\_addr](#input\_server\_transport\_listen\_addr) | n/a | `any` | `null` | no |
| <a name="input_server_transport_plugin"></a> [server\_transport\_plugin](#input\_server\_transport\_plugin) | n/a | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rendered"></a> [rendered](#output\_rendered) | n/a |
