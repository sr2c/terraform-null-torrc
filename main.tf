locals {

  options = [
    var.bridge_distribution == null ? "" : "BridgeDistribution ${var.bridge_distribution}\n",
    var.bridge_relay == null ? "" : "BridgeRelay ${var.bridge_relay}\n",
    var.contact_info == null ? "" : "ContactInfo ${var.contact_info}\n",
    var.control_port == null ? "" : "ControlPort ${var.control_port}\n",
    var.ext_or_port == null ? "" : "ExtORPort ${var.ext_or_port}\n",
    var.nickname == null ? "" : "Nickname ${var.nickname}\n",
    var.or_port == null ? "" : "ORPort ${var.or_port}\n",
    var.server_transport_listen_addr == null ? "" : "ServerTransportListenAddr ${var.server_transport_listen_addr}\n",
    var.server_transport_plugin == null ? "" : "ServerTransportPlugin ${var.server_transport_plugin}\n"
  ]

  joined_options = join("", local.options)
}
