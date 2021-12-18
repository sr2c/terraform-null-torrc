variable "accel_dir" {
  default = null
  description = "Specify this option if using dynamic hardware acceleration and the engine implementation library resides somewhere other than the OpenSSL default. Can not be changed while tor is running."
}

variable "accel_name" {
  default = null
  description = "When using OpenSSL hardware crypto acceleration attempt to load the dynamic engine of this name. This must be used for any dynamic hardware engine. Names can be verified with the openssl engine command. Can not be changed while tor is running. + + If the engine name is prefixed with a \"!\", then Tor will exit if the engine cannot be loaded."
}

variable "alternate_dir_authority" {
  default = null
  description = "These options behave as DirAuthority, but they replace fewer of the default directory authorities. Using AlternateDirAuthority replaces the default Tor directory authorities, but leaves the default bridge authorities in place.  Similarly, AlternateBridgeAuthority replaces the default bridge authority, but leaves the directory authorities alone."
}

variable "avoid_disk_writes" {
  default = null
  description = "If non-zero, try to write to disk less frequently than we would otherwise. This is useful when running on flash memory or other media that support only a limited number of writes. (Default: 0)"
}

variable "bandwidth_burst" {
  default = null
  description = "Limit the maximum token bucket size (also known as the burst) to the given number of bytes in each direction. (Default: 1 GByte)"
}

variable "bandwidth_rate" {
  default = null
  description = "A token bucket limits the average incoming bandwidth usage on this node to the specified number of bytes per second, and the average outgoing bandwidth usage to that same value.  If you want to run a relay in the public network, this needs to be _at the very least_ 75 KBytes for a relay (that is, 600 kbits) or 50 KBytes for a bridge (400 kbits) -- but of course, more is better; we recommend at least 250 KBytes (2 mbits) if possible.  (Default: 1 GByte) + + Note that this option, and other bandwidth-limiting options, apply to TCP data only: They do not count TCP headers or DNS traffic. + + Tor uses powers of two, not powers of ten, so 1 GByte is 1024*1024*1024 bytes as opposed to 1 billion bytes. + + With this option, and in other options that take arguments in bytes, KBytes, and so on, other formats are also supported. Notably, \"KBytes\" can also be written as \"kilobytes\" or \"kb\"; \"MBytes\" can be written as \"megabytes\" or \"MB\"; \"kbits\" can be written as \"kilobits\"; and so forth. Case doesn't matter. Tor also accepts \"byte\" and \"bit\" in the singular. The prefixes \"tera\" and \"T\" are also recognized. If no units are given, we default to bytes. To avoid confusion, we recommend writing \"bytes\" or \"bits\" explicitly, since it's easy to forget that \"B\" means bytes, not bits."
}

variable "cache_directory" {
  default = null
  description = "Store cached directory data in DIR. Can not be changed while tor is running. (Default: uses the value of DataDirectory.)"
}

variable "cache_directory_group_readable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read the CacheDirectory. If the option is set to 1, make the CacheDirectory readable by the default GID. If the option is \"auto\", then we use the setting for DataDirectoryGroupReadable when the CacheDirectory is the same as the DataDirectory, and 0 otherwise. (Default: auto)"
}

variable "circuit_priority_halflife" {
  default = null
  description = "If this value is set, we override the default algorithm for choosing which circuit's cell to deliver or relay next. It is delivered first to the circuit that has the lowest weighted cell count, where cells are weighted exponentially according to this value (in seconds). If the value is -1, it is taken from the consensus if possible else it will fallback to the default value of 30. Minimum: 1, Maximum: 2147483647. This can be defined as a float value. This is an advanced option; you generally shouldn't have to mess with it. (Default: -1)"
}

variable "client_transport_plugin" {
  default = null
  description = ""
}

variable "conn_limit" {
  default = null
  description = "The minimum number of file descriptors that must be available to the Tor process before it will start. Tor will ask the OS for as many file descriptors as the OS will allow (you can find this by \"ulimit -H -n\"). If this number is less than ConnLimit, then Tor will refuse to start. + + Tor relays need thousands of sockets, to connect to every other relay. If you are running a private bridge, you can reduce the number of sockets that Tor uses. For example, to limit Tor to 500 sockets, run \"ulimit -n 500\" in a shell. Then start tor in the same shell, with **ConnLimit 500**. You may also need to set **DisableOOSCheck 0**. + + Unless you have severely limited sockets, you probably don't need to adjust **ConnLimit** itself. It has no effect on Windows, since that platform lacks getrlimit(). (Default: 1000)"
}

variable "constrained_sockets" {
  default = null
  description = "If set, Tor will tell the kernel to attempt to shrink the buffers for all sockets to the size specified in **ConstrainedSockSize**. This is useful for virtual servers and other environments where system level TCP buffers may be limited. If you're on a virtual server, and you encounter the \"Error creating network socket: No buffer space available\" message, you are likely experiencing this problem. + + The preferred solution is to have the admin increase the buffer pool for the host itself via /proc/sys/net/ipv4/tcp_mem or equivalent facility; this configuration option is a second-resort. + + The DirPort option should also not be used if TCP buffers are scarce. The cached directory requests consume additional sockets which exacerbates the problem. + + You should **not** enable this feature unless you encounter the \"no buffer space available\" issue. Reducing the TCP buffers affects window size for the TCP stream and will reduce throughput in proportion to round trip time on long paths. (Default: 0)"
}

variable "constrained_sock_size" {
  default = null
  description = "When **ConstrainedSockets** is enabled the receive and transmit buffers for all sockets will be set to this limit. Must be a value between 2048 and 262144, in 1024 byte increments. Default of 8192 is recommended."
}

variable "control_port" {
  default = null
  description = "If set, Tor will accept connections on this port and allow those connections to control the Tor process using the Tor Control Protocol (described in control-spec.txt in https://spec.torproject.org[torspec]). Note: unless you also specify one or more of **HashedControlPassword** or **CookieAuthentication**, setting this option will cause Tor to allow any process on the local host to control it. (Setting both authentication methods means either method is sufficient to authenticate to Tor.) This option is required for many Tor controllers; most use the value of 9051. If a unix domain socket is used, you may quote the path using standard C escape sequences. You can specify this directive multiple times, to bind to multiple address/port pairs. Set it to \"auto\" to have Tor pick a port for you. (Default: 0) + + Recognized flags are: **GroupWritable**;; Unix domain sockets only: makes the socket get created as group-writable. **WorldWritable**;; Unix domain sockets only: makes the socket get created as world-writable. **RelaxDirModeCheck**;; Unix domain sockets only: Do not insist that the directory that holds the socket be read-restricted."
}

variable "control_port_file_group_readable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read the control port file. If the option is set to 1, make the control port file readable by the default GID. (Default: 0)"
}

variable "control_port_write_to_file" {
  default = null
  description = "If set, Tor writes the address and port of any control port it opens to this address.  Usable by controllers to learn the actual control port when ControlPort is set to \"auto\"."
}

variable "control_socket" {
  default = null
  description = "Like ControlPort, but listens on a Unix domain socket, rather than a TCP socket. '0' disables ControlSocket. (Unix and Unix-like systems only.) (Default: 0)"
}

variable "control_sockets_group_writable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read and write unix sockets (e.g. ControlSocket). If the option is set to 1, make the control socket readable and writable by the default GID. (Default: 0)"
}

variable "cookie_authentication" {
  default = null
  description = "If this option is set to 1, allow connections on the control port when the connecting process knows the contents of a file named \"control_auth_cookie\", which Tor will create in its data directory. This authentication method should only be used on systems with good filesystem security. (Default: 0)"
}

variable "cookie_auth_file" {
  default = null
  description = "If set, this option overrides the default location and file name for Tor's cookie file. (See <<CookieAuthentication,CookieAuthentication>>.)"
}

variable "cookie_auth_file_group_readable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read the cookie file. If the option is set to 1, make the cookie file readable by the default GID. [Making the file readable by other groups is not yet implemented; let us know if you need this for some reason.] (Default: 0)"
}

variable "count_private_bandwidth" {
  default = null
  description = "If this option is set, then Tor's rate-limiting applies not only to remote connections, but also to connections to private addresses like 127.0.0.1 or 10.0.0.1.  This is mostly useful for debugging rate-limiting.  (Default: 0)"
}

variable "data_directory" {
  default = null
  description = "Store working data in DIR. Can not be changed while tor is running. (Default: ~/.tor if your home directory is not /; otherwise, @LOCALSTATEDIR@/lib/tor.  On Windows, the default is your ApplicationData folder.)"
}

variable "data_directory_group_readable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read the DataDirectory. If the option is set to 1, make the DataDirectory readable by the default GID. (Default: 0)"
}

variable "dir_authority" {
  default = null
  description = "Use a nonstandard authoritative directory server at the provided address and port, with the specified key fingerprint. This option can be repeated many times, for multiple authoritative directory servers. Flags are separated by spaces, and determine what kind of an authority this directory is. By default, an authority is not authoritative for any directory style or version unless an appropriate flag is given. + + Tor will use this authority as a bridge authoritative directory if the \"bridge\" flag is set. If a flag \"orport=**orport**\" is given, Tor will use the given port when opening encrypted tunnels to the dirserver. If a flag \"weight=**num**\" is given, then the directory server is chosen randomly with probability proportional to that weight (default 1.0). If a flag \"v3ident=**fp**\" is given, the dirserver is a v3 directory authority whose v3 long-term signing key has the fingerprint **fp**. Lastly, if an \"ipv6=**[**__ipv6address__**]**:__orport__\" flag is present, then the directory authority is listening for IPv6 connections on the indicated IPv6 address and OR Port. + + Tor will contact the authority at __ipv4address__ to download directory documents. Clients always use the ORPort. Relays usually use the DirPort, but will use the ORPort in some circumstances. If an IPv6 ORPort is supplied, clients will also download directory documents at the IPv6 ORPort, if they are configured to use IPv6. + + If no **DirAuthority** line is given, Tor will use the default directory authorities. NOTE: this option is intended for setting up a private Tor network with its own directory authorities. If you use it, you will be distinguishable from other users, because you won't believe the same authorities they do."
}

variable "dir_authority_fallback_rate" {
  default = null
  description = "When configured to use both directory authorities and fallback directories, the directory authorities also work as fallbacks. They are chosen with their regular weights, multiplied by this number, which should be 1.0 or less. The default is less than 1, to reduce load on authorities. (Default: 0.1)"
}

variable "disable_all_swap" {
  default = null
  description = "If set to 1, Tor will attempt to lock all current and future memory pages, so that memory cannot be paged out. Windows, OS X and Solaris are currently not supported. We believe that this feature works on modern Gnu/Linux distributions, and that it should work on *BSD systems (untested). This option requires that you start your Tor as root, and you should use the **User** option to properly reduce Tor's privileges. Can not be changed while tor is running. (Default: 0)"
}

variable "disable_debugger_attachment" {
  default = null
  description = "If set to 1, Tor will attempt to prevent basic debugging attachment attempts by other processes. This may also keep Tor from generating core files if it crashes. It has no impact for users who wish to attach if they have CAP_SYS_PTRACE or if they are root.  We believe that this feature works on modern Gnu/Linux distributions, and that it may also work on *BSD systems (untested).  Some modern Gnu/Linux systems such as Ubuntu have the kernel.yama.ptrace_scope sysctl and by default enable it as an attempt to limit the PTRACE scope for all user processes by default. This feature will attempt to limit the PTRACE scope for Tor specifically - it will not attempt to alter the system wide ptrace scope as it may not even exist. If you wish to attach to Tor with a debugger such as gdb or strace you will want to set this to 0 for the duration of your debugging. Normal users should leave it on. Disabling this option while Tor is running is prohibited. (Default: 1)"
}

variable "disable_network" {
  default = null
  description = "When this option is set, we don't listen for or accept any connections other than controller connections, and we close (and don't reattempt) any outbound connections.  Controllers sometimes use this option to avoid using the network until Tor is fully configured.  Tor will make still certain network-related calls (like DNS lookups) as a part of its configuration process, even if DisableNetwork is set. (Default: 0)"
}

variable "extend_by_ed25519_id" {
  default = null
  description = "If this option is set to 1, we always try to include a relay's Ed25519 ID when telling the preceding relay in a circuit to extend to it. If this option is set to 0, we never include Ed25519 IDs when extending circuits.  If the option is set to \"auto\", we obey a parameter in the consensus document. (Default: auto)"
}

variable "ext_or_port" {
  default = null
  description = "Open this port to listen for Extended ORPort connections from your pluggable transports. + (Default: **DataDirectory**/extended_orport_auth_cookie)"
}

variable "ext_or_port_cookie_auth_file" {
  default = null
  description = "If set, this option overrides the default location and file name for the Extended ORPort's cookie file -- the cookie file is needed for pluggable transports to communicate through the Extended ORPort."
}

variable "ext_or_port_cookie_auth_file_group_readable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read the Extended OR Port cookie file. If the option is set to 1, make the cookie file readable by the default GID. [Making the file readable by other groups is not yet implemented; let us know if you need this for some reason.] (Default: 0)"
}

variable "fallback_dir" {
  default = null
  description = "When tor is unable to connect to any directory cache for directory info (usually because it doesn't know about any yet) it tries a hard-coded directory. Relays try one directory authority at a time. Clients try multiple directory authorities and FallbackDirs, to avoid hangs on startup if a hard-coded directory is down. Clients wait for a few seconds between each attempt, and retry FallbackDirs more often than directory authorities, to reduce the load on the directory authorities.  + + FallbackDirs should be stable relays with stable IP addresses, ports, and identity keys. They must have a DirPort. + + By default, the directory authorities are also FallbackDirs. Specifying a FallbackDir replaces Tor's default hard-coded FallbackDirs (if any). (See <<DirAuthority,DirAuthority>> for an explanation of each flag.)"
}

variable "fetch_dir_info_early" {
  default = null
  description = "If set to 1, Tor will always fetch directory information like other directory caches, even if you don't meet the normal criteria for fetching early. Normal users should leave it off. (Default: 0)"
}

variable "fetch_dir_info_extra_early" {
  default = null
  description = "If set to 1, Tor will fetch directory information before other directory caches. It will attempt to download directory information closer to the start of the consensus period. Normal users should leave it off. (Default: 0)"
}

variable "fetch_hid_serv_descriptors" {
  default = null
  description = "If set to 0, Tor will never fetch any hidden service descriptors from the rendezvous directories. This option is only useful if you're using a Tor controller that handles hidden service fetches for you. (Default: 1)"
}

variable "fetch_server_descriptors" {
  default = null
  description = "If set to 0, Tor will never fetch any network status summaries or server descriptors from the directory servers. This option is only useful if you're using a Tor controller that handles directory fetches for you. (Default: 1)"
}

variable "fetch_useless_descriptors" {
  default = null
  description = "If set to 1, Tor will fetch every consensus flavor, and all server descriptors and authority certificates referenced by those consensuses, except for extra info descriptors. When this option is 1, Tor will also keep fetching descriptors, even when idle. If set to 0, Tor will avoid fetching useless descriptors: flavors that it is not using to build circuits, and authority certificates it does not trust. When Tor hasn't built any application circuits, it will go idle, and stop fetching descriptors. This option is useful if you're using a tor client with an external parser that uses a full consensus. This option fetches all documents except extrainfo descriptors, **DirCache** fetches and serves all documents except extrainfo descriptors, **DownloadExtraInfo*** fetches extrainfo documents, and serves them if **DirCache** is on, and **UseMicrodescriptors** changes the flavor of consensuses and descriptors that is fetched and used for building circuits. (Default: 0)"
}

variable "hardware_accel" {
  default = null
  description = "If non-zero, try to use built-in (static) crypto hardware acceleration when available. Can not be changed while tor is running. (Default: 0)"
}

variable "hashed_control_password" {
  default = null
  description = "Allow connections on the control port if they present the password whose one-way hash is __hashed_password__. You can compute the hash of a password by running \"tor --hash-password __password__\". You can provide several acceptable passwords by using more than one HashedControlPassword line."
}

variable "h_ttpproxy" {
  default = null
  description = "Tor will make all its directory requests through this host:port (or host:80 if port is not specified), rather than connecting directly to any directory servers. (DEPRECATED: As of 0.3.1.0-alpha you should use HTTPSProxy.)"
}

variable "h_ttpproxy_authenticator" {
  default = null
  description = "If defined, Tor will use this username:password for Basic HTTP proxy authentication, as in RFC 2617. This is currently the only form of HTTP proxy authentication that Tor supports; feel free to submit a patch if you want it to support others. (DEPRECATED: As of 0.3.1.0-alpha you should use HTTPSProxyAuthenticator.)"
}

variable "h_ttpsproxy" {
  default = null
  description = "Tor will make all its OR (SSL) connections through this host:port (or host:443 if port is not specified), via HTTP CONNECT rather than connecting directly to servers. You may want to set **FascistFirewall** to restrict the set of ports you might try to connect to, if your HTTPS proxy only allows connecting to certain ports."
}

variable "h_ttpsproxy_authenticator" {
  default = null
  description = "If defined, Tor will use this username:password for Basic HTTPS proxy authentication, as in RFC 2617. This is currently the only form of HTTPS proxy authentication that Tor supports; feel free to submit a patch if you want it to support others."
}

variable "keepalive_period" {
  default = null
  description = "To keep firewalls from expiring connections, send a padding keepalive cell every NUM seconds on open connections that are in use. (Default: 5 minutes)"
}

variable "keep_bind_capabilities" {
  default = null
  description = "On Linux, when we are started as root and we switch our identity using the **User** option, the **KeepBindCapabilities** option tells us whether to try to retain our ability to bind to low ports.  If this value is 1, we try to keep the capability; if it is 0 we do not; and if it is **auto**, we keep the capability only if we are configured to listen on a low port. Can not be changed while tor is running. (Default: auto.)"
}

variable "log" {
  default = null
  description = "Send all messages between __minSeverity__ and __maxSeverity__ to the standard output stream, the standard error stream, or to the system log. (The \"syslog\" value is only supported on Unix.) Recognized severity levels are debug, info, notice, warn, and err. We advise using \"notice\" in most cases, since anything more verbose may provide sensitive information to an attacker who obtains the logs. If only one severity level is given, all messages of that level or higher will be sent to the listed destination. + + Some low-level logs may be sent from signal handlers, so their destination logs must be signal-safe. These low-level logs include backtraces, logging function errors, and errors in code called by logging functions. Signal-safe logs are always sent to stderr or stdout. They are also sent to a limited number of log files that are configured to log messages at error severity from the bug or general domains. They are never sent as syslogs, control port log events, or to any API-based log destinations."
}

variable "log2" {
  default = null
  description = "As above, but send log messages to the listed filename. The \"Log\" option may appear more than once in a configuration file. Messages are sent to all the logs that match their severity level."
}

variable "log3" {
  default = null
  description = ""
}

variable "log4" {
  default = null
  description = "As above, but select messages by range of log severity __and__ by a set of \"logging domains\".  Each logging domain corresponds to an area of functionality inside Tor.  You can specify any number of severity ranges for a single log statement, each of them prefixed by a comma-separated list of logging domains.  You can prefix a domain with $$~$$ to indicate negation, and use * to indicate \"all domains\".  If you specify a severity range without a list of domains, it matches all domains. + + This is an advanced feature which is most useful for debugging one or two of Tor's subsystems at a time. + + The currently recognized domains are: general, crypto, net, config, fs, protocol, mm, http, app, control, circ, rend, bug, dir, dirserv, or, edge, acct, hist, handshake, heartbeat, channel, sched, guard, consdiff, dos, process, pt, btrack, and mesg. Domain names are case-insensitive. + + For example, \"`Log [handshake]debug [~net,~mm]info notice stdout`\" sends to stdout: all handshake messages of any severity, all info-and-higher messages from domains other than networking and memory management, and all messages of severity notice or higher."
}

variable "log_message_domains" {
  default = null
  description = "If 1, Tor includes message domains with each log message.  Every log message currently has at least one domain; most currently have exactly one.  This doesn't affect controller log messages. (Default: 0)"
}

variable "log_time_granularity" {
  default = null
  description = "Set the resolution of timestamps in Tor's logs to NUM milliseconds. NUM must be positive and either a divisor or a multiple of 1 second. Note that this option only controls the granularity written by Tor to a file or console log.  Tor does not (for example) \"batch up\" log messages to affect times logged by a controller, times attached to syslog messages, or the mtime fields on log files.  (Default: 1 second)"
}

variable "max_advertised_bandwidth" {
  default = null
  description = "If set, we will not advertise more than this amount of bandwidth for our BandwidthRate. Server operators who want to reduce the number of clients who ask to build circuits through them (since this is proportional to advertised bandwidth rate) can thus reduce the CPU demands on their server without impacting network performance."
}

variable "max_unparseable_desc_size_to_log" {
  default = null
  description = "Unparseable descriptors (e.g. for votes, consensuses, routers) are logged in separate files by hash, up to the specified size in total.  Note that only files logged during the lifetime of this Tor process count toward the total; this is intended to be used to debug problems without opening live servers to resource exhaustion attacks. (Default: 10 MBytes)"
}

variable "metrics_port" {
  default = null
  description = "WARNING: Before enabling this, it is important to understand that exposing tor metrics publicly is dangerous to the Tor network users. Please take extra precaution and care when opening this port. Set a very strict access policy with MetricsPortPolicy and consider using your operating systems firewall features for defense in depth. + We recommend, for the prometheus __format__, that the only address that can access this port should be the Prometheus server itself. Remember that the connection is unencrypted (HTTP) hence consider using a tool like stunnel to secure the link from this port to the server. + If set, open this port to listen for an HTTP GET request to \"/metrics\". Upon a request, the collected metrics in the the tor instance are formatted for the given format and then sent back. If this is set, MetricsPortPolicy must be defined else every request will be rejected. + Supported format is \"prometheus\" which is also the default if not set. The Prometheus data model can be found here: https://prometheus.io/docs/concepts/data_model/ + The tor metrics are constantly collected and they solely consists of counters. Thus, asking for those metrics is very lightweight on the tor process. (Default: None) + As an example, here only 5.6.7.8 will be allowed to connect:"
}

variable "metrics_port_policy" {
  default = null
  description = "Set an entrance policy for the **MetricsPort**, to limit who can access it. The policies have the same form as exit policies below, except that port specifiers are ignored. For multiple entries, this line can be used multiple times. It is a reject all by default policy.  (Default: None) + Please, keep in mind here that if the server collecting metrics on the MetricsPort is behind a NAT, then everything behind it can access it. This is similar for the case of allowing localhost, every users on the server will be able to access it. Again, strongly consider using a tool like stunnel to secure the link or to strengthen access control."
}

variable "no_exec" {
  default = null
  description = "If this option is set to 1, then Tor will never launch another executable, regardless of the settings of ClientTransportPlugin or ServerTransportPlugin.  Once this option has been set to 1, it cannot be set back to 0 without restarting Tor. (Default: 0)"
}

variable "outbound_bind_address" {
  default = null
  description = "Make all outbound connections originate from the IP address specified. This is only useful when you have multiple network interfaces, and you want all of Tor's outgoing connections to use a single one. This option may be used twice, once with an IPv4 address and once with an IPv6 address. IPv6 addresses should be wrapped in square brackets. This setting will be ignored for connections to the loopback addresses (127.0.0.0/8 and ::1), and is not used for DNS requests as well."
}

variable "outbound_bind_address_exit" {
  default = null
  description = "Make all outbound exit connections originate from the IP address specified. This option overrides **OutboundBindAddress** for the same IP version. This option may be used twice, once with an IPv4 address and once with an IPv6 address. IPv6 addresses should be wrapped in square brackets. This setting will be ignored for connections to the loopback addresses (127.0.0.0/8 and ::1)."
}

variable "outbound_bind_address_or" {
  default = null
  description = "Make all outbound non-exit (relay and other) connections originate from the IP address specified. This option overrides **OutboundBindAddress** for the same IP version. This option may be used twice, once with an IPv4 address and once with an IPv6 address. IPv6 addresses should be wrapped in square brackets. This setting will be ignored for connections to the loopback addresses (127.0.0.0/8 and ::1)."
}

variable "owning_controller_process" {
  default = null
  description = "Make Tor instance periodically check for presence of a controller process with given PID and terminate itself if this process is no longer alive. Polling interval is 15 seconds."
}

variable "per_conn_bwburst" {
  default = null
  description = "If this option is set manually, or via the \"perconnbwburst\" consensus field, Tor will use it for separate rate limiting for each connection from a non-relay. (Default: 0)"
}

variable "per_conn_bwrate" {
  default = null
  description = "If this option is set manually, or via the \"perconnbwrate\" consensus field, Tor will use it for separate rate limiting for each connection from a non-relay. (Default: 0)"
}

variable "outbound_bind_address_pt" {
  default = null
  description = "Request that pluggable transports makes all outbound connections originate from the IP address specified. Because outgoing connections are handled by the pluggable transport itself, it is not possible for Tor to enforce whether the pluggable transport honors this option. This option overrides **OutboundBindAddress** for the same IP version. This option may be used twice, once with an IPv4 address and once with an IPv6 address. IPv6 addresses should be wrapped in square brackets. This setting will be ignored for connections to the loopback addresses (127.0.0.0/8 and ::1)."
}

variable "pid_file" {
  default = null
  description = "On startup, write our PID to FILE. On clean shutdown, remove FILE. Can not be changed while tor is running."
}

variable "protocol_warnings" {
  default = null
  description = "If 1, Tor will log with severity 'warn' various cases of other parties not following the Tor specification. Otherwise, they are logged with severity 'info'. (Default: 0)"
}

variable "relay_bandwidth_burst" {
  default = null
  description = "If not 0, limit the maximum token bucket size (also known as the burst) for _relayed traffic_ to the given number of bytes in each direction. They do not include directory fetches by the relay (from authority or other relays), because that is considered \"client\" activity. (Default: 0)"
}

variable "relay_bandwidth_rate" {
  default = null
  description = "If not 0, a separate token bucket limits the average incoming bandwidth usage for _relayed traffic_ on this node to the specified number of bytes per second, and the average outgoing bandwidth usage to that same value. Relayed traffic currently is calculated to include answers to directory requests, but that may change in future versions. They do not include directory fetches by the relay (from authority or other relays), because that is considered \"client\" activity.  (Default: 0)"
}

variable "rephist_track_time" {
  default = null
  description = "Tells an authority, or other node tracking node reliability and history, that fine-grained information about nodes can be discarded when it hasn't changed for a given amount of time.  (Default: 24 hours)"
}

variable "run_as_daemon" {
  default = null
  description = "If 1, Tor forks and daemonizes to the background. This option has no effect on Windows; instead you should use the --service command-line option. Can not be changed while tor is running. (Default: 0)"
}

variable "safe_logging" {
  default = null
  description = "Tor can scrub potentially sensitive strings from log messages (e.g. addresses) by replacing them with the string [scrubbed]. This way logs can still be useful, but they don't leave behind personally identifying information about what sites a user might have visited. + + If this option is set to 0, Tor will not perform any scrubbing, if it is set to 1, all potentially sensitive strings are replaced. If it is set to relay, all log messages generated when acting as a relay are sanitized, but all messages generated when acting as a client are not. Note: Tor may not heed this option when logging at log levels below Notice. (Default: 1)"
}

variable "sandbox" {
  default = null
  description = "If set to 1, Tor will run securely through the use of a syscall sandbox. Otherwise the sandbox will be disabled. The option only works on Linux-based operating systems, and only when Tor has been built with the libseccomp library.  Note that this option may be incompatible with some versions of libc, and some kernel versions.  This option can not be changed while tor is running. + + When the **Sandbox** is 1, the following options can not be changed when tor is running: **Address**, **ConnLimit**, **CookieAuthFile**, **DirPortFrontPage**, **ExtORPortCookieAuthFile**, **Logs**, **ServerDNSResolvConfFile**, **ClientOnionAuthDir** (and any files in it won't reload on HUP signal). + + Launching new Onion Services through the control port is not supported with current syscall sandboxing implementation. + + Tor must remain in client or server mode (some changes to **ClientOnly** and **ORPort** are not allowed). Currently, if **Sandbox** is 1, **ControlPort** command \"GETINFO address\" will not work. + + When using %include in the tor configuration files, reloading the tor configuration is not supported after adding new configuration files or directories. + + (Default: 0)"
}

variable "schedulers" {
  default = null
  description = "Specify the scheduler type that tor should use. The scheduler is responsible for moving data around within a Tor process. This is an ordered list by priority which means that the first value will be tried first and if unavailable, the second one is tried and so on. It is possible to change these values at runtime. This option mostly effects relays, and most operators should leave it set to its default value. (Default: KIST,KISTLite,Vanilla) + + The possible scheduler types are: + **KIST**: Kernel-Informed Socket Transport. Tor will use TCP information from the kernel to make informed decisions regarding how much data to send and when to send it. KIST also handles traffic in batches (see <<KISTSchedRunInterval,KISTSchedRunInterval>>) in order to improve traffic prioritization decisions. As implemented, KIST will only work on Linux kernel version 2.6.39 or higher. + + **KISTLite**: Same as KIST but without kernel support. Tor will use all the same mechanics as with KIST, including the batching, but its decisions regarding how much data to send will not be as good. KISTLite will work on all kernels and operating systems, and the majority of the benefits of KIST are still realized with KISTLite. + + **Vanilla**: The scheduler that Tor used before KIST was implemented. It sends as much data as possible, as soon as possible. Vanilla will work on all kernels and operating systems."
}

variable "k_istsched_run_interval" {
  default = null
  description = "If KIST or KISTLite is used in the Schedulers option, this controls at which interval the scheduler tick is. If the value is 0 msec, the value is taken from the consensus if possible else it will fallback to the default 10 msec. Maximum possible value is 100 msec. (Default: 0 msec)"
}

variable "k_istsock_buf_size_factor" {
  default = null
  description = "If KIST is used in Schedulers, this is a multiplier of the per-socket limit calculation of the KIST algorithm. (Default: 1.0)"
}

variable "socks4_proxy" {
  default = null
  description = "Tor will make all OR connections through the SOCKS 4 proxy at host:port (or host:1080 if port is not specified)."
}

variable "socks5_proxy" {
  default = null
  description = "Tor will make all OR connections through the SOCKS 5 proxy at host:port (or host:1080 if port is not specified)."
}

variable "socks5_proxy_username" {
  default = null
  description = ""
}

variable "socks5_proxy_password" {
  default = null
  description = "If defined, authenticate to the SOCKS 5 server using username and password in accordance to RFC 1929. Both username and password must be between 1 and 255 characters."
}

variable "syslog_identity_tag" {
  default = null
  description = "When logging to syslog, adds a tag to the syslog identity such that log entries are marked with \"Tor-__tag__\". Can not be changed while tor is running. (Default: none)"
}

variable "t_cpproxy" {
  default = null
  description = "Tor will use the given protocol to make all its OR (SSL) connections through a TCP proxy on host:port, rather than connecting directly to servers. You may want to set **FascistFirewall** to restrict the set of ports you might try to connect to, if your proxy only allows connecting to certain ports. There is no equivalent option for directory connections, because all Tor client versions that support this option download directory documents via OR connections. +"
}

variable "truncate_log_file" {
  default = null
  description = "If 1, Tor will overwrite logs at startup and in response to a HUP signal, instead of appending to them. (Default: 0)"
}

variable "unix_socks_group_writable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read and write unix sockets (e.g. SocksPort unix:). If the option is set to 1, make the Unix socket readable and writable by the default GID. (Default: 0)"
}

variable "use_default_fallback_dirs" {
  default = null
  description = "Use Tor's default hard-coded FallbackDirs (if any). (When a FallbackDir line is present, it replaces the hard-coded FallbackDirs, regardless of the value of UseDefaultFallbackDirs.) (Default: 1)"
}

variable "user" {
  default = null
  description = "On startup, setuid to this user and setgid to their primary group. Can not be changed while tor is running."
}

variable "allow_non_rfc953_hostnames" {
  default = null
  description = "When this option is disabled, Tor blocks hostnames containing illegal characters (like @ and :) rather than sending them to an exit node to be resolved. This helps trap accidental attempts to resolve URLs and so on. (Default: 0)"
}

variable "automap_hosts_on_resolve" {
  default = null
  description = "When this option is enabled, and we get a request to resolve an address that ends with one of the suffixes in **AutomapHostsSuffixes**, we map an unused virtual address to that address, and return the new virtual address. This is handy for making \".onion\" addresses work with applications that resolve an address and then connect to it. (Default: 0)"
}

variable "automap_hosts_suffixes" {
  default = null
  description = "A comma-separated list of suffixes to use with **AutomapHostsOnResolve**. The \".\" suffix is equivalent to \"all addresses.\" (Default: .exit,.onion)."
}

variable "bridge" {
  default = null
  description = "When set along with UseBridges, instructs Tor to use the relay at \"IP:ORPort\" as a \"bridge\" relaying into the Tor network. If \"fingerprint\" is provided (using the same format as for DirAuthority), we will verify that the relay running at that location has the right fingerprint. We also use fingerprint to look up the bridge descriptor at the bridge authority, if it's provided and if UpdateBridgesFromAuthority is set too.  + + If \"transport\" is provided, it must match a ClientTransportPlugin line. We then use that pluggable transport's proxy to transfer data to the bridge, rather than connecting to the bridge directly. Some transports use a transport-specific method to work out the remote address to connect to. These transports typically ignore the \"IP:ORPort\" specified in the bridge line.  + + Tor passes any \"key=val\" settings to the pluggable transport proxy as per-connection arguments when connecting to the bridge.  Consult the documentation of the pluggable transport for details of what arguments it supports."
}

variable "circuit_padding" {
  default = null
  description = "If set to 0, Tor will not pad client circuits with additional cover traffic. Only clients may set this option. This option should be offered via the UI to mobile users for use where bandwidth may be expensive. If set to 1, padding will be negotiated as per the consensus and relay support (unlike ConnectionPadding, CircuitPadding cannot be force-enabled). (Default: 1)"
}

variable "reduced_circuit_padding" {
  default = null
  description = "If set to 1, Tor will only use circuit padding algorithms that have low overhead. Only clients may set this option. This option should be offered via the UI to mobile users for use where bandwidth may be expensive. (Default: 0)"
}

variable "client_bootstrap_consensus_authority_download_initial_delay" {
  default = null
  description = "Initial delay in seconds for when clients should download consensuses from authorities if they are bootstrapping (that is, they don't have a usable, reasonably live consensus). Only used by clients fetching from a list of fallback directory mirrors. This schedule is advanced by (potentially concurrent) connection attempts, unlike other schedules, which are advanced by connection failures. (Default: 6)"
}

variable "client_bootstrap_consensus_authority_only_download_initial_delay" {
  default = null
  description = "Initial delay in seconds for when clients should download consensuses from authorities if they are bootstrapping (that is, they don't have a usable, reasonably live consensus). Only used by clients which don't have or won't fetch from a list of fallback directory mirrors. This schedule is advanced by (potentially concurrent) connection attempts, unlike other schedules, which are advanced by connection failures. (Default: 0)"
}

variable "client_bootstrap_consensus_fallback_download_initial_delay" {
  default = null
  description = "Initial delay in seconds for when clients should download consensuses from fallback directory mirrors if they are bootstrapping (that is, they don't have a usable, reasonably live consensus). Only used by clients fetching from a list of fallback directory mirrors. This schedule is advanced by (potentially concurrent) connection attempts, unlike other schedules, which are advanced by connection failures. (Default: 0)"
}

variable "client_bootstrap_consensus_max_in_progress_tries" {
  default = null
  description = "Try this many simultaneous connections to download a consensus before waiting for one to complete, timeout, or error out. (Default: 3)"
}

variable "client_dnsreject_internal_addresses" {
  default = null
  description = "If true, Tor does not believe any anonymously retrieved DNS answer that tells it that an address resolves to an internal address (like 127.0.0.1 or 192.168.0.1). This option prevents certain browser-based attacks; it is not allowed to be set on the default network. (Default: 1)"
}

variable "client_onion_auth_dir" {
  default = null
  description = "Path to the directory containing v3 hidden service authorization files. Each file is for a single onion address, and the files MUST have the suffix \".auth_private\" (i.e. \"bob_onion.auth_private\"). The content format MUST be: + <onion-address>:descriptor:x25519:<base32-encoded-privkey> + The <onion-address> MUST NOT have the \".onion\" suffix. The <base32-encoded-privkey> is the base32 representation of the raw key bytes only (32 bytes for x25519). See Appendix G in the rend-spec-v3.txt file of https://spec.torproject.org/[torspec] for more information."
}

variable "client_only" {
  default = null
  description = "If set to 1, Tor will not run as a relay or serve directory requests, even if the ORPort, ExtORPort, or DirPort options are set. (This config option is mostly unnecessary: we added it back when we were considering having Tor clients auto-promote themselves to being relays if they were stable and fast enough. The current behavior is simply that Tor is a client unless ORPort, ExtORPort, or DirPort are configured.) (Default: 0)"
}

variable "client_prefer_ipv6_dir_port" {
  default = null
  description = "If this option is set to 1, Tor prefers a directory port with an IPv6 address over one with IPv4, for direct connections, if a given directory server has both. (Tor also prefers an IPv6 DirPort if IPv4Client is set to 0.) If this option is set to auto, clients prefer IPv4. Other things may influence the choice. This option breaks a tie to the favor of IPv6. (Default: auto)  (DEPRECATED: This option has had no effect for some time.)"
}

variable "client_prefer_ipv6_orport" {
  default = null
  description = "If this option is set to 1, Tor prefers an OR port with an IPv6 address over one with IPv4 if a given entry node has both. (Tor also prefers an IPv6 ORPort if IPv4Client is set to 0.) If this option is set to auto, Tor bridge clients prefer the configured bridge address, and other clients prefer IPv4. Other things may influence the choice. This option breaks a tie to the favor of IPv6. (Default: auto)"
}

variable "client_reject_internal_addresses" {
  default = null
  description = "If true, Tor does not try to fulfill requests to connect to an internal address (like 127.0.0.1 or 192.168.0.1) __unless an exit node is specifically requested__ (for example, via a .exit hostname, or a controller request).  If true, multicast DNS hostnames for machines on the local network (of the form *.local) are also rejected.  (Default: 1)"
}

variable "client_use_ipv4" {
  default = null
  description = "If this option is set to 0, Tor will avoid connecting to directory servers and entry nodes over IPv4. Note that clients with an IPv4 address in a **Bridge**, proxy, or pluggable transport line will try connecting over IPv4 even if **ClientUseIPv4** is set to 0. (Default: 1)"
}

variable "client_use_ipv6" {
  default = null
  description = "If this option is set to 1, Tor might connect to directory servers or entry nodes over IPv6. For IPv6 only hosts, you need to also set **ClientUseIPv4** to 0 to disable IPv4. Note that clients configured with an IPv6 address in a **Bridge**, proxy, or pluggable transportline will try connecting over IPv6 even if **ClientUseIPv6** is set to 0. (Default: 0)"
}

variable "connection_padding" {
  default = null
  description = "This option governs Tor's use of padding to defend against some forms of traffic analysis. If it is set to 'auto', Tor will send padding only if both the client and the relay support it. If it is set to 0, Tor will not send any padding cells. If it is set to 1, Tor will still send padding for client connections regardless of relay support. Only clients may set this option. This option should be offered via the UI to mobile users for use where bandwidth may be expensive. (Default: auto)"
}

variable "reduced_connection_padding" {
  default = null
  description = "If set to 1, Tor will not not hold OR connections open for very long, and will send less padding on these connections. Only clients may set this option. This option should be offered via the UI to mobile users for use where bandwidth may be expensive. (Default: 0)"
}

variable "d_nsport" {
  default = null
  description = "If non-zero, open this port to listen for UDP DNS requests, and resolve them anonymously.  This port only handles A, AAAA, and PTR requests---it doesn't handle arbitrary DNS request types. Set the port to \"auto\" to have Tor pick a port for you. This directive can be specified multiple times to bind to multiple addresses/ports. See <<SocksPort,SocksPort>> for an explanation of isolation flags. (Default: 0)"
}

variable "download_extra_info" {
  default = null
  description = "If true, Tor downloads and caches \"extra-info\" documents. These documents contain information about servers other than the information in their regular server descriptors. Tor does not use this information for anything itself; to save bandwidth, leave this option turned off. (Default: 0)"
}

variable "enforce_distinct_subnets" {
  default = null
  description = "If 1, Tor will not put two servers whose IP addresses are \"too close\" on the same circuit. Currently, two addresses are \"too close\" if they lie in the same /16 range. (Default: 1)"
}

variable "fascist_firewall" {
  default = null
  description = "If 1, Tor will only create outgoing connections to ORs running on ports that your firewall allows (defaults to 80 and 443; see <<FirewallPorts,FirewallPorts>>). This will allow you to run Tor as a client behind a firewall with restrictive policies, but will not allow you to run as a server behind such a firewall. If you prefer more fine-grained control, use ReachableAddresses instead."
}

variable "firewall_ports" {
  default = null
  description = "A list of ports that your firewall allows you to connect to. Only used when **FascistFirewall** is set. This option is deprecated; use ReachableAddresses instead. (Default: 80, 443)"
}

variable "h_ttptunnel_port" {
  default = null
  description = "Open this port to listen for proxy connections using the \"HTTP CONNECT\" protocol instead of SOCKS. Set this to 0 if you don't want to allow \"HTTP CONNECT\" connections. Set the port to \"auto\" to have Tor pick a port for you. This directive can be specified multiple times to bind to multiple addresses/ports. If multiple entries of this option are present in your configuration file, Tor will perform stream isolation between listeners by default. See <<SocksPort,SocksPort>> for an explanation of isolation flags. (Default: 0)"
}

variable "long_lived_ports" {
  default = null
  description = "A list of ports for services that tend to have long-running connections (e.g. chat and interactive shells). Circuits for streams that use these ports will contain only high-uptime nodes, to reduce the chance that a node will go down before the stream is finished. Note that the list is also honored for circuits (both client and service side) involving hidden services whose virtual port is in this list. (Default: 21, 22, 706, 1863, 5050, 5190, 5222, 5223, 6523, 6667, 6697, 8300)"
}

variable "map_address" {
  default = null
  description = "When a request for address arrives to Tor, it will transform to newaddress before processing it. For example, if you always want connections to www.example.com to exit via __torserver__ (where __torserver__ is the fingerprint of the server), use \"MapAddress www.example.com www.example.com.torserver.exit\". If the value is prefixed with a \"*.\", matches an entire domain. For example, if you always want connections to example.com and any if its subdomains to exit via __torserver__ (where __torserver__ is the fingerprint of the server), use \"MapAddress *.example.com *.example.com.torserver.exit\". (Note the leading \"*.\" in each part of the directive.) You can also redirect all subdomains of a domain to a single address. For example, \"MapAddress *.example.com www.example.com\". If the specified exit is not available, or the exit can not connect to the site, Tor will fail any connections to the mapped address.+ + NOTES:"
}

variable "max_circuit_dirtiness" {
  default = null
  description = "Feel free to reuse a circuit that was first used at most NUM seconds ago, but never attach a new stream to a circuit that is too old.  For hidden services, this applies to the __last__ time a circuit was used, not the first. Circuits with streams constructed with SOCKS authentication via SocksPorts that have **KeepAliveIsolateSOCKSAuth** also remain alive for MaxCircuitDirtiness seconds after carrying the last such stream. (Default: 10 minutes)"
}

variable "max_client_circuits_pending" {
  default = null
  description = "Do not allow more than NUM circuits to be pending at a time for handling client streams. A circuit is pending if we have begun constructing it, but it has not yet been completely constructed.  (Default: 32)"
}

variable "n_atdport" {
  default = null
  description = "Open this port to listen for connections from old versions of ipfw (as included in old versions of FreeBSD, etc) using the NATD protocol. Use 0 if you don't want to allow NATD connections.  Set the port to \"auto\" to have Tor pick a port for you. This directive can be specified multiple times to bind to multiple addresses/ports.  If multiple entries of this option are present in your configuration file, Tor will perform stream isolation between listeners by default. See <<SocksPort,SocksPort>> for an explanation of isolation flags. + + This option is only for people who cannot use TransPort. (Default: 0)"
}

variable "new_circuit_period" {
  default = null
  description = "Every NUM seconds consider whether to build a new circuit. (Default: 30 seconds)"
}

variable "path_bias_circ_threshold" {
  default = null
  description = ""
}

variable "path_bias_drop_guards" {
  default = null
  description = ""
}

variable "path_bias_extreme_rate" {
  default = null
  description = ""
}

variable "path_bias_notice_rate" {
  default = null
  description = ""
}

variable "path_bias_warn_rate" {
  default = null
  description = ""
}

variable "path_bias_scale_threshold" {
  default = null
  description = "These options override the default behavior of Tor's (**currently experimental**) path bias detection algorithm. To try to find broken or misbehaving guard nodes, Tor looks for nodes where more than a certain fraction of circuits through that guard fail to get built. + + The PathBiasCircThreshold option controls how many circuits we need to build through a guard before we make these checks.  The PathBiasNoticeRate, PathBiasWarnRate and PathBiasExtremeRate options control what fraction of circuits must succeed through a guard so we won't write log messages. If less than PathBiasExtremeRate circuits succeed *and* PathBiasDropGuards is set to 1, we disable use of that guard. + + When we have seen more than PathBiasScaleThreshold circuits through a guard, we scale our observations by 0.5 (governed by the consensus) so that new observations don't get swamped by old ones. + + By default, or if a negative value is provided for one of these options, Tor uses reasonable defaults from the networkstatus consensus document. If no defaults are available there, these options default to 150, .70, .50, .30, 0, and 300 respectively."
}

variable "path_bias_use_threshold" {
  default = null
  description = ""
}

variable "path_bias_notice_use_rate" {
  default = null
  description = ""
}

variable "path_bias_extreme_use_rate" {
  default = null
  description = ""
}

variable "path_bias_scale_use_threshold" {
  default = null
  description = "Similar to the above options, these options override the default behavior of Tor's (**currently experimental**) path use bias detection algorithm. + + Where as the path bias parameters govern thresholds for successfully building circuits, these four path use bias parameters govern thresholds only for circuit usage. Circuits which receive no stream usage are not counted by this detection algorithm. A used circuit is considered successful if it is capable of carrying streams or otherwise receiving well-formed responses to RELAY cells. + + By default, or if a negative value is provided for one of these options, Tor uses reasonable defaults from the networkstatus consensus document. If no defaults are available there, these options default to 20, .80, .60, and 100, respectively."
}

variable "paths_needed_to_build_circuits" {
  default = null
  description = "Tor clients don't build circuits for user traffic until they know about enough of the network so that they could potentially construct enough of the possible paths through the network. If this option is set to a fraction between 0.25 and 0.95, Tor won't build circuits until it has enough descriptors or microdescriptors to construct that fraction of possible paths. Note that setting this option too low can make your Tor client less anonymous, and setting it too high can prevent your Tor client from bootstrapping.  If this option is negative, Tor will use a default value chosen by the directory authorities. If the directory authorities do not choose a value, Tor will default to 0.6. (Default: -1)"
}

variable "reachable_addresses" {
  default = null
  description = "A comma-separated list of IP addresses and ports that your firewall allows you to connect to. The format is as for the addresses in ExitPolicy, except that \"accept\" is understood unless \"reject\" is explicitly provided. For example, 'ReachableAddresses 99.0.0.0/8, reject 18.0.0.0/8:80, accept *:80' means that your firewall allows connections to everything inside net 99, rejects port 80 connections to net 18, and accepts connections to port 80 otherwise. (Default: 'accept *:*'.)"
}

variable "reachable_dir_addresses" {
  default = null
  description = "Like **ReachableAddresses**, a list of addresses and ports. Tor will obey these restrictions when fetching directory information, using standard HTTP GET requests. If not set explicitly then the value of **ReachableAddresses** is used. If **HTTPProxy** is set then these connections will go through that proxy.   (DEPRECATED: This option has had no effect for some time.)"
}

variable "reachable_oraddresses" {
  default = null
  description = "Like **ReachableAddresses**, a list of addresses and ports. Tor will obey these restrictions when connecting to Onion Routers, using TLS/SSL. If not set explicitly then the value of **ReachableAddresses** is used. If **HTTPSProxy** is set then these connections will go through that proxy. + + The separation between **ReachableORAddresses** and **ReachableDirAddresses** is only interesting when you are connecting through proxies (see <<HTTPProxy,HTTPProxy>> and <<HTTPSProxy,HTTPSProxy>>). Most proxies limit TLS connections (which Tor uses to connect to Onion Routers) to port 443, and some limit HTTP GET requests (which Tor uses for fetching directory information) to port 80."
}

variable "safe_socks" {
  default = null
  description = "When this option is enabled, Tor will reject application connections that use unsafe variants of the socks protocol -- ones that only provide an IP address, meaning the application is doing a DNS resolve first. Specifically, these are socks4 and socks5 when not doing remote DNS. (Default: 0)"
}

variable "test_socks" {
  default = null
  description = "When this option is enabled, Tor will make a notice-level log entry for each connection to the Socks port indicating whether the request used a safe socks protocol or an unsafe one (see <<SafeSocks,SafeSocks>>). This helps to determine whether an application using Tor is possibly leaking DNS requests. (Default: 0)"
}

variable "warn_plaintext_ports" {
  default = null
  description = "Tells Tor to issue a warnings whenever the user tries to make an anonymous connection to one of these ports. This option is designed to alert users to services that risk sending passwords in the clear. (Default: 23,109,110,143)"
}

variable "reject_plaintext_ports" {
  default = null
  description = "Like WarnPlaintextPorts, but instead of warning about risky port uses, Tor will instead refuse to make the connection. (Default: None)"
}

variable "socks_policy" {
  default = null
  description = "Set an entrance policy for this server, to limit who can connect to the SocksPort and DNSPort ports. The policies have the same form as exit policies below, except that port specifiers are ignored. Any address not matched by some entry in the policy is accepted."
}

variable "socks_port" {
  default = null
  description = "Open this port to listen for connections from SOCKS-speaking applications. Set this to 0 if you don't want to allow application connections via SOCKS. Set it to \"auto\" to have Tor pick a port for you. This directive can be specified multiple times to bind to multiple addresses/ports. If a unix domain socket is used, you may quote the path using standard C escape sequences. Most flags are off by default, except where specified. Flags that are on by default can be disabled by putting \"No\" before the flag name. (Default: 9050) + + NOTE: Although this option allows you to specify an IP address other than localhost, you should do so only with extreme caution. The SOCKS protocol is unencrypted and (as we use it) unauthenticated, so exposing it in this way could leak your information to anybody watching your network, and allow anybody to use your computer as an open proxy. + + If multiple entries of this option are present in your configuration file, Tor will perform stream isolation between listeners by default. The _isolation flags_ arguments give Tor rules for which streams received on this SocksPort are allowed to share circuits with one another.  Recognized isolation flags are: **IsolateClientAddr**;; Don't share circuits with streams from a different client address.  (On by default and strongly recommended when supported; you can disable it with **NoIsolateClientAddr**. Unsupported and force-disabled when using Unix domain sockets.) **IsolateSOCKSAuth**;; Don't share circuits with streams for which different SOCKS authentication was provided. (For HTTPTunnelPort connections, this option looks at the Proxy-Authorization and X-Tor-Stream-Isolation headers. On by default; you can disable it with **NoIsolateSOCKSAuth**.) **IsolateClientProtocol**;; Don't share circuits with streams using a different protocol. (SOCKS 4, SOCKS 5, HTTPTunnelPort connections, TransPort connections, NATDPort connections, and DNSPort requests are all considered to be different protocols.) **IsolateDestPort**;; Don't share circuits with streams targeting a different destination port. **IsolateDestAddr**;; Don't share circuits with streams targeting a different destination address. **KeepAliveIsolateSOCKSAuth**;; If **IsolateSOCKSAuth** is enabled, keep alive circuits while they have at least one stream with SOCKS authentication active. After such a circuit is idle for more than MaxCircuitDirtiness seconds, it can be closed. **SessionGroup=**__INT__;; If no other isolation rules would prevent it, allow streams on this port to share circuits with streams from every other port with the same session group.  (By default, streams received on different SocksPorts, TransPorts, etc are always isolated from one another. This option overrides that behavior.)"
}

variable "other_socks_port_flags" {
  default = null
  description = "Other recognized __flags__ for a SocksPort are: **NoIPv4Traffic**;; Tell exits to not connect to IPv4 addresses in response to SOCKS requests on this connection. **IPv6Traffic**;; Tell exits to allow IPv6 addresses in response to SOCKS requests on this connection, so long as SOCKS5 is in use.  (SOCKS4 can't handle IPv6.) **PreferIPv6**;; Tells exits that, if a host has both an IPv4 and an IPv6 address, we would prefer to connect to it via IPv6. (IPv4 is the default.) **NoDNSRequest**;; Do not ask exits to resolve DNS addresses in SOCKS5 requests. Tor will connect to IPv4 addresses, IPv6 addresses (if IPv6Traffic is set) and .onion addresses. **NoOnionTraffic**;; Do not connect to .onion addresses in SOCKS5 requests. **OnionTrafficOnly**;; Tell the tor client to only connect to .onion addresses in response to SOCKS5 requests on this connection. This is equivalent to NoDNSRequest, NoIPv4Traffic, NoIPv6Traffic. The corresponding NoOnionTrafficOnly flag is not supported. **CacheIPv4DNS**;; Tells the client to remember IPv4 DNS answers we receive from exit nodes via this connection. **CacheIPv6DNS**;; Tells the client to remember IPv6 DNS answers we receive from exit nodes via this connection. **GroupWritable**;; Unix domain sockets only: makes the socket get created as group-writable. **WorldWritable**;; Unix domain sockets only: makes the socket get created as world-writable. **CacheDNS**;; Tells the client to remember all DNS answers we receive from exit nodes via this connection. **UseIPv4Cache**;; Tells the client to use any cached IPv4 DNS answers we have when making requests via this connection. (NOTE: This option, or UseIPv6Cache or UseDNSCache, can harm your anonymity, and probably won't help performance as much as you might expect. Use with care!) **UseIPv6Cache**;; Tells the client to use any cached IPv6 DNS answers we have when making requests via this connection. **UseDNSCache**;; Tells the client to use any cached DNS answers we have when making requests via this connection. **NoPreferIPv6Automap**;; When serving a hostname lookup request on this port that should get automapped (according to AutomapHostsOnResolve), if we could return either an IPv4 or an IPv6 answer, prefer an IPv4 answer. (Tor prefers IPv6 by default.) **PreferSOCKSNoAuth**;; Ordinarily, when an application offers both \"username/password authentication\" and \"no authentication\" to Tor via SOCKS5, Tor selects username/password authentication so that IsolateSOCKSAuth can work.  This can confuse some applications, if they offer a username/password combination then get confused when asked for one. You can disable this behavior, so that Tor will select \"No authentication\" when IsolateSOCKSAuth is disabled, or when this option is set. **ExtendedErrors**;; Return extended error code in the SOCKS reply. So far, the possible errors are:"
}

variable "socks_port_flags_misc" {
  default = null
  description = "Flags are processed left to right. If flags conflict, the last flag on the line is used, and all earlier flags are ignored. No error is issued for conflicting flags."
}

variable "token_bucket_refill_interval" {
  default = null
  description = "Set the refill delay interval of Tor's token bucket to NUM milliseconds. NUM must be between 1 and 1000, inclusive.  When Tor is out of bandwidth, on a connection or globally, it will wait up to this long before it tries to use that connection again. Note that bandwidth limits are still expressed in bytes per second: this option only affects the frequency with which Tor checks to see whether previously exhausted connections may read again. Can not be changed while tor is running. (Default: 100 msec)"
}

variable "track_host_exits" {
  default = null
  description = "For each value in the comma separated list, Tor will track recent connections to hosts that match this value and attempt to reuse the same exit node for each. If the value is prepended with a '.', it is treated as matching an entire domain. If one of the values is just a '.', it means match everything. This option is useful if you frequently connect to sites that will expire all your authentication cookies (i.e. log you out) if your IP address changes. Note that this option does have the disadvantage of making it more clear that a given history is associated with a single user. However, most people who would wish to observe this will observe it through cookies or other protocol-specific means anyhow."
}

variable "track_host_exits_expire" {
  default = null
  description = "Since exit servers go up and down, it is desirable to expire the association between host and exit server after NUM seconds. The default is 1800 seconds (30 minutes)."
}

variable "trans_port" {
  default = null
  description = "Open this port to listen for transparent proxy connections.  Set this to 0 if you don't want to allow transparent proxy connections.  Set the port to \"auto\" to have Tor pick a port for you. This directive can be specified multiple times to bind to multiple addresses/ports. If multiple entries of this option are present in your configuration file, Tor will perform stream isolation between listeners by default.  See <<SocksPort,SocksPort>> for an explanation of isolation flags. + + TransPort requires OS support for transparent proxies, such as BSDs' pf or Linux's IPTables. If you're planning to use Tor as a transparent proxy for a network, you'll want to examine and change VirtualAddrNetwork from the default setting. (Default: 0)"
}

variable "trans_proxy_type" {
  default = null
  description = "TransProxyType may only be enabled when there is transparent proxy listener enabled. + + Set this to \"TPROXY\" if you wish to be able to use the TPROXY Linux module to transparently proxy connections that are configured using the TransPort option. Detailed information on how to configure the TPROXY feature can be found in the Linux kernel source tree in the file Documentation/networking/tproxy.txt. + + Set this option to \"ipfw\" to use the FreeBSD ipfw interface. + + On *BSD operating systems when using pf, set this to \"pf-divert\" to take advantage of +divert-to+ rules, which do not modify the packets like +rdr-to+ rules do. Detailed information on how to configure pf to use +divert-to+ rules can be found in the pf.conf(5) manual page. On OpenBSD, +divert-to+ is available to use on versions greater than or equal to OpenBSD 4.4. + + Set this to \"default\", or leave it unconfigured, to use regular IPTables on Linux, or to use pf +rdr-to+ rules on *BSD systems. + + (Default: \"default\")"
}

variable "update_bridges_from_authority" {
  default = null
  description = "When set (along with UseBridges), Tor will try to fetch bridge descriptors from the configured bridge authorities when feasible. It will fall back to a direct request if the authority responds with a 404. (Default: 0)"
}

variable "use_bridges" {
  default = null
  description = "When set, Tor will fetch descriptors for each bridge listed in the \"Bridge\" config lines, and use these relays as both entry guards and directory guards. (Default: 0)"
}

variable "use_entry_guards" {
  default = null
  description = "If this option is set to 1, we pick a few long-term entry servers, and try to stick with them. This is desirable because constantly changing servers increases the odds that an adversary who owns some servers will observe a fraction of your paths. Entry Guards can not be used by Directory Authorities or Single Onion Services. In these cases, this option is ignored. (Default: 1)"
}

variable "use_guard_fraction" {
  default = null
  description = "This option specifies whether clients should use the guardfraction information found in the consensus during path selection. If it's set to 'auto', clients will do what the UseGuardFraction consensus parameter tells them to do. (Default: auto)"
}

variable "guard_lifetime" {
  default = null
  description = "If UseEntryGuards is set, minimum time to keep a guard on our guard list before  picking a new one.  If less than one day, we use defaults from the consensus directory.  (Default: 0)"
}

variable "num_directory_guards" {
  default = null
  description = "If UseEntryGuards is set to 1, we try to make sure we have at least NUM routers to use as directory guards. If this option is set to 0, use the value from the guard-n-primary-dir-guards-to-use consensus parameter, and default to 3 if the consensus parameter isn't set.  (Default: 0)"
}

variable "num_entry_guards" {
  default = null
  description = "If UseEntryGuards is set to 1, we will try to pick a total of NUM routers as long-term entries for our circuits. If NUM is 0, we try to learn the number from the guard-n-primary-guards-to-use consensus parameter, and default to 1 if the consensus parameter isn't set. (Default: 0)"
}

variable "num_primary_guards" {
  default = null
  description = "If UseEntryGuards is set to 1, we will try to pick NUM routers for our primary guard list, which is the set of routers we strongly prefer when connecting to the Tor network. If NUM is 0, we try to learn the number from the guard-n-primary-guards consensus parameter, and default to 3 if the consensus parameter isn't set. (Default: 0)"
}

variable "vanguards_lite_enabled" {
  default = null
  description = "This option specifies whether clients should use the vanguards-lite subsystem to protect against guard discovery attacks. If it's set to 'auto', clients will do what the vanguards-lite-enabled consensus parameter tells them to do, and will default to enable the subsystem if the consensus parameter isn't set. (Default: auto)"
}

variable "use_microdescriptors" {
  default = null
  description = "Microdescriptors are a smaller version of the information that Tor needs in order to build its circuits.  Using microdescriptors makes Tor clients download less directory information, thus saving bandwidth.  Directory caches need to fetch regular descriptors and microdescriptors, so this option doesn't save any bandwidth for them.  For legacy reasons, auto is accepted, but it has the same effect as 1. (Default: auto)"
}

variable "virtual_addr_network_ipv4" {
  default = null
  description = ""
}

variable "virtual_addr_network_ipv6" {
  default = null
  description = "When Tor needs to assign a virtual (unused) address because of a MAPADDRESS command from the controller or the AutomapHostsOnResolve feature, Tor picks an unassigned address from this range. (Defaults: 127.192.0.0/10 and [FE80::]/10 respectively.) + + When providing proxy server service to a network of computers using a tool like dns-proxy-tor, change the IPv4 network to \"10.192.0.0/10\" or \"172.16.0.0/12\" and change the IPv6 network to \"[FC00::]/7\". The default **VirtualAddrNetwork** address ranges on a properly configured machine will route to the loopback or link-local interface. The maximum number of bits for the network prefix is set to 104 for IPv6 and 16 for IPv4. However, a larger network (that is, one with a smaller prefix length) is preferable, since it reduces the chances for an attacker to guess the used IP. For local use, no change to the default VirtualAddrNetwork setting is needed."
}

variable "circuits_available_timeout" {
  default = null
  description = "Tor will attempt to keep at least one open, unused circuit available for this amount of time. This option governs how long idle circuits are kept open, as well as the amount of time Tor will keep a circuit open to each of the recently used ports. This way when the Tor client is entirely idle, it can expire all of its circuits, and then expire its TLS connections. Note that the actual timeout value is uniformly randomized from the specified value to twice that amount. (Default: 30 minutes; Max: 24 hours)"
}

variable "learn_circuit_build_timeout" {
  default = null
  description = "If 0, CircuitBuildTimeout adaptive learning is disabled. (Default: 1)"
}

variable "circuit_build_timeout" {
  default = null
  description = "Try for at most NUM seconds when building circuits. If the circuit isn't open in that time, give up on it. If LearnCircuitBuildTimeout is 1, this value serves as the initial value to use before a timeout is learned. If LearnCircuitBuildTimeout is 0, this value is the only value used. (Default: 60 seconds)"
}

variable "circuit_stream_timeout" {
  default = null
  description = "If non-zero, this option overrides our internal timeout schedule for how many seconds until we detach a stream from a circuit and try a new circuit. If your network is particularly slow, you might want to set this to a number like 60. (Default: 0)"
}

variable "socks_timeout" {
  default = null
  description = "Let a socks connection wait NUM seconds handshaking, and NUM seconds unattached waiting for an appropriate circuit, before we fail it. (Default: 2 minutes)"
}

variable "dormant_canceled_by_startup" {
  default = null
  description = "By default, Tor starts in active mode if it was active the last time it was shut down, and in dormant mode if it was dormant.  But if this option is true, Tor treats every startup event as user activity, and Tor will never start in Dormant mode, even if it has been unused for a long time on previous runs. (Default: 0) + Note: Packagers and application developers should change the value of this option only with great caution: it has the potential to create spurious traffic on the network.  This option should only be used if Tor is started by an affirmative user activity (like clicking on an application or running a command), and not if Tor is launched for some other reason (for example, by a startup process, or by an application that launches itself on every login.)"
}

variable "dormant_client_timeout" {
  default = null
  description = "If Tor spends this much time without any client activity, enter a dormant state where automatic circuits are not built, and directory information is not fetched. Does not affect servers or onion services. Must be at least 10 minutes. (Default: 24 hours)"
}

variable "dormant_on_first_startup" {
  default = null
  description = "If true, then the first time Tor starts up with a fresh DataDirectory, it starts in dormant mode, and takes no actions until the user has made a request.  (This mode is recommended if installing a Tor client for a user who might not actually use it.)  If false, Tor bootstraps the first time it is started, whether it sees a user request or not. + After the first time Tor starts, it begins in dormant mode if it was dormant before, and not otherwise. (Default: 0)"
}

variable "dormant_timeout_disabled_by_idle_streams" {
  default = null
  description = "If true, then any open client stream (even one not reading or writing) counts as client activity for the purpose of DormantClientTimeout. If false, then only network activity counts. (Default: 1)"
}

variable "dormant_timeout_enabled" {
  default = null
  description = "If false, then no amount of time without activity is sufficient to make Tor go dormant.  Setting this option to zero is only recommended for special-purpose applications that need to use the Tor binary for something other than sending or receiving Tor traffic. (Default: 1)"
}

variable "entry_nodes" {
  default = null
  description = "A list of identity fingerprints and country codes of nodes to use for the first hop in your normal circuits. Normal circuits include all circuits except for direct connections to directory servers.  The Bridge option overrides this option; if you have configured bridges and UseBridges is 1, the Bridges are used as your entry nodes. + + This option can appear multiple times: the values from multiple lines are spliced together. + + The ExcludeNodes option overrides this option: any node listed in both EntryNodes and ExcludeNodes is treated as excluded. See <<ExcludeNodes,ExcludeNodes>> for more information on how to specify nodes."
}

variable "exclude_nodes" {
  default = null
  description = "A list of identity fingerprints, country codes, and address patterns of nodes to avoid when building a circuit. Country codes are 2-letter ISO3166 codes, and must be wrapped in braces; fingerprints may be preceded by a dollar sign. (Example: ExcludeNodes ABCD1234CDEF5678ABCD1234CDEF5678ABCD1234, {cc}, 255.254.0.0/8) + + This option can appear multiple times: the values from multiple lines are spliced together. + + By default, this option is treated as a preference that Tor is allowed to override in order to keep working. For example, if you try to connect to a hidden service, but you have excluded all of the hidden service's introduction points, Tor will connect to one of them anyway.  If you do not want this behavior, set the StrictNodes option (documented below).  + + Note also that if you are a relay, this (and the other node selection options below) only affects your own circuits that Tor builds for you. Clients can still build circuits through you to any node.  Controllers can tell Tor to build circuits through any node. + + Country codes are case-insensitive. The code \"{??}\" refers to nodes whose country can't be identified. No country code, including {??}, works if no GeoIPFile can be loaded. See also the <<GeoIPExcludeUnknown,GeoIPExcludeUnknown>> option below."
}

variable "exit_nodes" {
  default = null
  description = "A list of identity fingerprints, country codes, and address patterns of nodes to use as exit node---that is, a node that delivers traffic for you *outside* the Tor network.  See <<ExcludeNodes,ExcludeNodes>> for more information on how to specify nodes. + + This option can appear multiple times: the values from multiple lines are spliced together. + + Note that if you list too few nodes here, or if you exclude too many exit nodes with ExcludeExitNodes, you can degrade functionality.  For example, if none of the exits you list allows traffic on port 80 or 443, you won't be able to browse the web. + + Note also that not every circuit is used to deliver traffic *outside* of the Tor network.  It is normal to see non-exit circuits (such as those used to connect to hidden services, those that do directory fetches, those used for relay reachability self-tests, and so on) that end at a non-exit node.  To keep a node from being used entirely, see <<ExcludeNodes,ExcludeNodes>> and <<StrictNodes,StrictNodes>>. + + The ExcludeNodes option overrides this option: any node listed in both ExitNodes and ExcludeNodes is treated as excluded. + + The .exit address notation, if enabled via MapAddress, overrides this option."
}

variable "geo_ipexclude_unknown" {
  default = null
  description = "If this option is set to 'auto', then whenever any country code is set in ExcludeNodes or ExcludeExitNodes, all nodes with unknown country ({??} and possibly {A1}) are treated as excluded as well. If this option is set to '1', then all unknown countries are treated as excluded in ExcludeNodes and ExcludeExitNodes.  This option has no effect when a GeoIP file isn't configured or can't be found.  (Default: auto)"
}

variable "h_slayer2_nodes" {
  default = null
  description = "A list of identity fingerprints, nicknames, country codes, and address patterns of nodes that are allowed to be used as the second hop in all client or service-side Onion Service circuits. This option mitigates attacks where the adversary runs middle nodes and induces your client or service to create many circuits, in order to discover your primary guard node. (Default: Any node in the network may be used in the second hop.) + (Example: HSLayer2Nodes ABCD1234CDEF5678ABCD1234CDEF5678ABCD1234, {cc}, 255.254.0.0/8) + + This option can appear multiple times: the values from multiple lines are spliced together. + + When this is set, the resulting hidden service paths will look like: + C - G - L2 - M - Rend + C - G - L2 - M - HSDir + C - G - L2 - M - Intro + S - G - L2 - M - Rend + S - G - L2 - M - HSDir + S - G - L2 - M - Intro + + where C is this client, S is the service, G is the Guard node, L2 is a node from this option, and M is a random middle node. Rend, HSDir, and Intro point selection is not affected by this option. + This option may be combined with HSLayer3Nodes to create paths of the form: + C - G - L2 - L3 - Rend + C - G - L2 - L3 - M - HSDir + C - G - L2 - L3 - M - Intro + S - G - L2 - L3 - M - Rend + S - G - L2 - L3 - HSDir + S - G - L2 - L3 - Intro + + ExcludeNodes have higher priority than HSLayer2Nodes, which means that nodes specified in ExcludeNodes will not be picked. + When either this option or HSLayer3Nodes are set, the /16 subnet and node family restrictions are removed for hidden service circuits. Additionally, we allow the guard node to be present as the Rend, HSDir, and IP node, and as the hop before it. This is done to prevent the adversary from inferring information about our guard, layer2, and layer3 node choices at later points in the path. + This option is meant to be managed by a Tor controller such as https://github.com/mikeperry-tor/vanguards that selects and updates this set of nodes for you. Hence it does not do load balancing if fewer than 20 nodes are selected, and if no nodes in HSLayer2Nodes are currently available for use, Tor will not work. Please use extreme care if you are setting this option manually."
}

variable "h_slayer3_nodes" {
  default = null
  description = "A list of identity fingerprints, nicknames, country codes, and address patterns of nodes that are allowed to be used as the third hop in all client and service-side Onion Service circuits. This option mitigates attacks where the adversary runs middle nodes and induces your client or service to create many circuits, in order to discover your primary or Layer2 guard nodes. (Default: Any node in the network may be used in the third hop.) + (Example: HSLayer3Nodes ABCD1234CDEF5678ABCD1234CDEF5678ABCD1234, {cc}, 255.254.0.0/8) + + This option can appear multiple times: the values from multiple lines are spliced together. + + When this is set by itself, the resulting hidden service paths will look like: + C - G - M - L3 - Rend + C - G - M - L3 - M - HSDir + C - G - M - L3 - M - Intro + S - G - M - L3 - M - Rend + S - G - M - L3 - HSDir + S - G - M - L3 - Intro + where C is this client, S is the service, G is the Guard node, L2 is a node from this option, and M is a random middle node. Rend, HSDir, and Intro point selection is not affected by this option. + While it is possible to use this option by itself, it should be combined with HSLayer2Nodes to create paths of the form: + C - G - L2 - L3 - Rend + C - G - L2 - L3 - M - HSDir + C - G - L2 - L3 - M - Intro + S - G - L2 - L3 - M - Rend + S - G - L2 - L3 - HSDir + S - G - L2 - L3 - Intro + + ExcludeNodes have higher priority than HSLayer3Nodes, which means that nodes specified in ExcludeNodes will not be picked. + When either this option or HSLayer2Nodes are set, the /16 subnet and node family restrictions are removed for hidden service circuits. Additionally, we allow the guard node to be present as the Rend, HSDir, and IP node, and as the hop before it. This is done to prevent the adversary from inferring information about our guard, layer2, and layer3 node choices at later points in the path. + This option is meant to be managed by a Tor controller such as https://github.com/mikeperry-tor/vanguards that selects and updates this set of nodes for you. Hence it does not do load balancing if fewer than 20 nodes are selected, and if no nodes in HSLayer3Nodes are currently available for use, Tor will not work. Please use extreme care if you are setting this option manually."
}

variable "middle_nodes" {
  default = null
  description = "A list of identity fingerprints and country codes of nodes to use for \"middle\" hops in your normal circuits. Normal circuits include all circuits except for direct connections to directory servers. Middle hops are all hops other than exit and entry. + This option can appear multiple times: the values from multiple lines are spliced together. + + This is an **experimental** feature that is meant to be used by researchers and developers to test new features in the Tor network safely. Using it without care will strongly influence your anonymity. Other tor features may not work with MiddleNodes. This feature might get removed in the future."
}

variable "node_family" {
  default = null
  description = "The Tor servers, defined by their identity fingerprints, constitute a \"family\" of similar or co-administered servers, so never use any two of them in the same circuit. Defining a NodeFamily is only needed when a server doesn't list the family itself (with MyFamily). This option can be used multiple times; each instance defines a separate family.  In addition to nodes, you can also list IP address and ranges and country codes in {curly braces}. See <<ExcludeNodes,ExcludeNodes>> for more information on how to specify nodes."
}

variable "strict_nodes" {
  default = null
  description = "If StrictNodes is set to 1, Tor will treat solely the ExcludeNodes option as a requirement to follow for all the circuits you generate, even if doing so will break functionality for you (StrictNodes does not apply to ExcludeExitNodes, ExitNodes, MiddleNodes, or MapAddress).  If StrictNodes is set to 0, Tor will still try to avoid nodes in the ExcludeNodes list, but it will err on the side of avoiding unexpected errors. Specifically, StrictNodes 0 tells Tor that it is okay to use an excluded node when it is *necessary* to perform relay reachability self-tests, connect to a hidden service, provide a hidden service to a client, fulfill a .exit request, upload directory information, or download directory information.  (Default: 0)"
}

variable "server-options" {
  default = null
  description = ""
}

variable "accounting_max" {
  default = null
  description = "Limits the max number of bytes sent and received within a set time period using a given calculation rule (see <<AccountingStart,AccountingStart>> and <<AccountingRule,AccountingRule>>). Useful if you need to stay under a specific bandwidth. By default, the number used for calculation is the max of either the bytes sent or received. For example, with AccountingMax set to 1 TByte, a server could send 900 GBytes and receive 800 GBytes and continue running. It will only hibernate once one of the two reaches 1 TByte. This can be changed to use the sum of the both bytes received and sent by setting the AccountingRule option to \"sum\" (total bandwidth in/out). When the number of bytes remaining gets low, Tor will stop accepting new connections and circuits. When the number of bytes is exhausted, Tor will hibernate until some time in the next accounting period. To prevent all servers from waking at the same time, Tor will also wait until a random point in each period before waking up. If you have bandwidth cost issues, enabling hibernation is preferable to setting a low bandwidth, since it provides users with a collection of fast servers that are up some of the time, which is more useful than a set of slow servers that are always \"available\". + + Note that (as also described in the Bandwidth section) Tor uses powers of two, not powers of ten: 1 GByte is 1024*1024*1024, not one billion. Be careful: some internet service providers might count GBytes differently."
}

variable "accounting_rule" {
  default = null
  description = "How we determine when our AccountingMax has been reached (when we should hibernate) during a time interval. Set to \"max\" to calculate using the higher of either the sent or received bytes (this is the default functionality). Set to \"sum\" to calculate using the sent plus received bytes. Set to \"in\" to calculate using only the received bytes. Set to \"out\" to calculate using only the sent bytes. (Default: max)"
}

variable "accounting_start" {
  default = null
  description = "Specify how long accounting periods last. If **month** is given, each accounting period runs from the time __HH:MM__ on the __dayth__ day of one month to the same day and time of the next. The relay will go at full speed, use all the quota you specify, then hibernate for the rest of the period. (The day must be between 1 and 28.) If **week** is given, each accounting period runs from the time __HH:MM__ of the __dayth__ day of one week to the same day and time of the next week, with Monday as day 1 and Sunday as day 7. If **day** is given, each accounting period runs from the time __HH:MM__ each day to the same time on the next day. All times are local, and given in 24-hour time. (Default: \"month 1 0:00\")"
}

variable "address" {
  default = null
  description = "The address of this server, or a fully qualified domain name of this server that resolves to an address.  You can leave this unset, and Tor will try to guess your address.  If a domain name is provided, Tor will attempt to resolve it and use the underlying IPv4/IPv6 address as its publish address (taking precedence over the ORPort configuration). The publish address is the one used to tell clients and other servers where to find your Tor server; it doesn't affect the address that your server binds to.  To bind to a different address, use the ORPort and OutboundBindAddress options."
}

variable "address_disable_ipv6" {
  default = null
  description = "By default, Tor will attempt to find the IPv6 of the relay if there is no IPv4Only ORPort. If set, this option disables IPv6 auto discovery. This disables IPv6 address resolution, IPv6 ORPorts, and IPv6 reachability checks. Also, the relay won't publish an IPv6 ORPort in its descriptor. (Default: 0)"
}

variable "assume_reachable" {
  default = null
  description = "This option is used when bootstrapping a new Tor network. If set to 1, don't do self-reachability testing; just upload your server descriptor immediately. (Default: 0)"
}

variable "assume_reachable_ipv6" {
  default = null
  description = "Like **AssumeReachable**, but affects only the relay's own IPv6 ORPort. If this value is set to \"auto\", then Tor will look at **AssumeReachable** instead. (Default: auto)"
}

variable "bridge_relay" {
  default = null
  description = "Sets the relay to act as a \"bridge\" with respect to relaying connections from bridge users to the Tor network. It mainly causes Tor to publish a server descriptor to the bridge database, rather than to the public directory authorities. + + Note: make sure that no MyFamily lines are present in your torrc when relay is configured in bridge mode."
}

variable "bridge_distribution" {
  default = null
  description = "If set along with BridgeRelay, Tor will include a new line in its bridge descriptor which indicates to the BridgeDB service how it would like its bridge address to be given out. Set it to \"none\" if you want BridgeDB to avoid distributing your bridge address, or \"any\" to let BridgeDB decide.  See https://bridges.torproject.org/info for a more up-to-date list of options. (Default: any)"
}

variable "contact_info" {
  default = null
  description = "Administrative contact information for this relay or bridge. This line can be used to contact you if your relay or bridge is misconfigured or something else goes wrong. Note that we archive and publish all descriptors containing these lines and that Google indexes them, so spammers might also collect them. You may want to obscure the fact that it's an email address and/or generate a new address for this purpose. + + ContactInfo **must** be set to a working address if you run more than one relay or bridge.  (Really, everybody running a relay or bridge should set it.)"
}

variable "disable_ooscheck" {
  default = null
  description = "This option disables the code that closes connections when Tor notices that it is running low on sockets. Right now, it is on by default, since the existing out-of-sockets mechanism tends to kill OR connections more than it should. (Default: 1)"
}

variable "exit_policy" {
  default = null
  description = "Set an exit policy for this server. Each policy is of the form \"**accept[6]**|**reject[6]**  __ADDR__[/__MASK__][:__PORT__]\". If /__MASK__ is omitted then this policy just applies to the host given. Instead of giving a host or network you can also use \"*\" to denote the universe (0.0.0.0/0 and ::/0), or *4 to denote all IPv4 addresses, and *6 to denote all IPv6 addresses. __PORT__ can be a single port number, an interval of ports \"__FROM_PORT__-__TO_PORT__\", or \"*\". If __PORT__ is omitted, that means \"*\". + + For example, \"accept 18.7.22.69:*,reject 18.0.0.0/8:*,accept *:*\" would reject any IPv4 traffic destined for MIT except for web.mit.edu, and accept any other IPv4 or IPv6 traffic. + + Tor also allows IPv6 exit policy entries. For instance, \"reject6 [FC00::]/7:*\" rejects all destinations that share 7 most significant bit prefix with address FC00::. Respectively, \"accept6 [C000::]/3:*\" accepts all destinations that share 3 most significant bit prefix with address C000::. + + accept6 and reject6 only produce IPv6 exit policy entries. Using an IPv4 address with accept6 or reject6 is ignored and generates a warning. accept/reject allows either IPv4 or IPv6 addresses. Use *4 as an IPv4 wildcard address, and *6 as an IPv6 wildcard address. accept/reject * expands to matching IPv4 and IPv6 wildcard address rules. + + To specify all IPv4 and IPv6 internal and link-local networks (including 0.0.0.0/8, 169.254.0.0/16, 127.0.0.0/8, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, [::]/8, [FC00::]/7, [FE80::]/10, [FEC0::]/10, [FF00::]/8, and [::]/127), you can use the \"private\" alias instead of an address. (\"private\" always produces rules for IPv4 and IPv6 addresses, even when used with accept6/reject6.) + + Private addresses are rejected by default (at the beginning of your exit policy), along with any configured primary public IPv4 and IPv6 addresses. These private addresses are rejected unless you set the ExitPolicyRejectPrivate config option to 0. For example, once you've done that, you could allow HTTP to 127.0.0.1 and block all other connections to internal networks with \"accept 127.0.0.1:80,reject private:*\", though that may also allow connections to your own computer that are addressed to its public (external) IP address. See RFC 1918 and RFC 3330 for more details about internal and reserved IP address space. See <<ExitPolicyRejectLocalInterfaces,ExitPolicyRejectLocalInterfaces>> if you want to block every address on the relay, even those that aren't advertised in the descriptor. + + This directive can be specified multiple times so you don't have to put it all on one line. + + Policies are considered first to last, and the first match wins. If you want to allow the same ports on IPv4 and IPv6, write your rules using accept/reject *. If you want to allow different ports on IPv4 and IPv6, write your IPv6 rules using accept6/reject6 *6, and your IPv4 rules using accept/reject *4. If you want to _replace_ the default exit policy, end your exit policy with either a reject *:* or an accept *:*. Otherwise, you're _augmenting_ (prepending to) the default exit policy. + + If you want to use a reduced exit policy rather than the default exit policy, set \"ReducedExitPolicy 1\". If you want to _replace_ the default exit policy with your custom exit policy, end your exit policy with either a reject *:* or an accept *:*. Otherwise, you're _augmenting_ (prepending to) the default or reduced exit policy. + + The default exit policy is:"
}

variable "exit_policy_default" {
  default = null
  description = "Since the default exit policy uses accept/reject *, it applies to both IPv4 and IPv6 addresses."
}

variable "exit_policy_reject_local_interfaces" {
  default = null
  description = "Reject all IPv4 and IPv6 addresses that the relay knows about, at the beginning of your exit policy. This includes any OutboundBindAddress, the bind addresses of any port options, such as ControlPort or DNSPort, and any public IPv4 and IPv6 addresses on any interface on the relay. (If IPv6Exit is not set, all IPv6 addresses will be rejected anyway.) See above entry on <<ExitPolicy,ExitPolicy>>. This option is off by default, because it lists all public relay IP addresses in the ExitPolicy, even those relay operators might prefer not to disclose. (Default: 0)"
}

variable "exit_policy_reject_private" {
  default = null
  description = "Reject all private (local) networks, along with the relay's advertised public IPv4 and IPv6 addresses, at the beginning of your exit policy. See above entry on <<ExitPolicy,ExitPolicy>>. (Default: 1)"
}

variable "exit_relay" {
  default = null
  description = "Tells Tor whether to run as an exit relay.  If Tor is running as a non-bridge server, and ExitRelay is set to 1, then Tor allows traffic to exit according to the ExitPolicy option, the ReducedExitPolicy option, or the default ExitPolicy (if no other exit policy option is specified). + + If ExitRelay is set to 0, no traffic is allowed to exit, and the ExitPolicy, ReducedExitPolicy, and IPv6Exit options are ignored. + + If ExitRelay is set to \"auto\", then Tor checks the ExitPolicy, ReducedExitPolicy, and IPv6Exit options. If at least one of these options is set, Tor behaves as if ExitRelay were set to 1. If none of these exit policy options are set, Tor behaves as if ExitRelay were set to 0. (Default: auto)"
}

variable "extend_allow_private_addresses" {
  default = null
  description = "When this option is enabled, Tor will connect to relays on localhost, RFC1918 addresses, and so on. In particular, Tor will make direct OR connections, and Tor routers allow EXTEND requests, to these private addresses. (Tor will always allow connections to bridges, proxies, and pluggable transports configured on private addresses.) Enabling this option can create security issues; you should probably leave it off. (Default: 0)"
}

variable "geo_ipfile" {
  default = null
  description = "A filename containing IPv4 GeoIP data, for use with by-country statistics."
}

variable "geo_ipv6_file" {
  default = null
  description = "A filename containing IPv6 GeoIP data, for use with by-country statistics."
}

variable "heartbeat_period" {
  default = null
  description = "Log a heartbeat message every **HeartbeatPeriod** seconds. This is a log level __notice__ message, designed to let you know your Tor server is still alive and doing useful things. Settings this to 0 will disable the heartbeat. Otherwise, it must be at least 30 minutes. (Default: 6 hours)"
}

variable "i_pv6_exit" {
  default = null
  description = "If set, and we are an exit node, allow clients to use us for IPv6 traffic. When this option is set and ExitRelay is auto, we act as if ExitRelay is 1. (Default: 0)"
}

variable "key_directory" {
  default = null
  description = "Store secret keys in DIR. Can not be changed while tor is running. (Default: the \"keys\" subdirectory of DataDirectory.)"
}

variable "key_directory_group_readable" {
  default = null
  description = "If this option is set to 0, don't allow the filesystem group to read the KeyDirectory. If the option is set to 1, make the KeyDirectory readable by the default GID. If the option is \"auto\", then we use the setting for DataDirectoryGroupReadable when the KeyDirectory is the same as the DataDirectory, and 0 otherwise. (Default: auto)"
}

variable "mainloop_stats" {
  default = null
  description = "Log main loop statistics every **HeartbeatPeriod** seconds. This is a log level __notice__ message designed to help developers instrumenting Tor's main event loop. (Default: 0)"
}

variable "max_mem_in_queues" {
  default = null
  description = "This option configures a threshold above which Tor will assume that it needs to stop queueing or buffering data because it's about to run out of memory.  If it hits this threshold, it will begin killing circuits until it has recovered at least 10% of this memory.  Do not set this option too low, or your relay may be unreliable under load.  This option only affects some queues, so the actual process size will be larger than this.  If this option is set to 0, Tor will try to pick a reasonable default based on your system's physical memory.  (Default: 0)"
}

variable "max_onion_queue_delay" {
  default = null
  description = "If we have more onionskins queued for processing than we can process in this amount of time, reject new ones. (Default: 1750 msec)"
}

variable "my_family" {
  default = null
  description = "Declare that this Tor relay is controlled or administered by a group or organization identical or similar to that of the other relays, defined by their (possibly $-prefixed) identity fingerprints. This option can be repeated many times, for convenience in defining large families: all fingerprints in all MyFamily lines are merged into one list. When two relays both declare that they are in the same 'family', Tor clients will not use them in the same circuit. (Each relay only needs to list the other servers in its family; it doesn't need to list itself, but it won't hurt if it does.) Do not list any bridge relay as it would compromise its concealment. + + If you run more than one relay, the MyFamily option on each relay **must** list all other relays, as described above. + + Note: do not use MyFamily when configuring your Tor instance as a bridge."
}

variable "nickname" {
  default = null
  description = "Set the server's nickname to 'name'. Nicknames must be between 1 and 19 characters inclusive, and must contain only the characters [a-zA-Z0-9]. If not set, **Unnamed** will be used. Relays can always be uniquely identified by their identity fingerprints."
}

variable "num_cpus" {
  default = null
  description = "How many processes to use at once for decrypting onionskins and other parallelizable operations.  If this is set to 0, Tor will try to detect how many CPUs you have, defaulting to 1 if it can't tell.  (Default: 0)"
}

variable "offline_master_key" {
  default = null
  description = "If non-zero, the Tor relay will never generate or load its master secret key.  Instead, you'll have to use \"tor --keygen\" to manage the permanent ed25519 master identity key, as well as the corresponding temporary signing keys and certificates. (Default: 0)"
}

variable "or_port" {
  default = null
  description = "Advertise this port to listen for connections from Tor clients and servers.  This option is required to be a Tor server. Set it to \"auto\" to have Tor pick a port for you. Set it to 0 to not run an ORPort at all. This option can occur more than once. (Default: 0) + + Tor recognizes these flags on each ORPort: **NoAdvertise**;; By default, we bind to a port and tell our users about it. If NoAdvertise is specified, we don't advertise, but listen anyway.  This can be useful if the port everybody will be connecting to (for example, one that's opened on our firewall) is somewhere else. **NoListen**;; By default, we bind to a port and tell our users about it. If NoListen is specified, we don't bind, but advertise anyway.  This can be useful if something else  (for example, a firewall's port forwarding configuration) is causing connections to reach us. **IPv4Only**;; If the address is absent, or resolves to both an IPv4 and an IPv6 address, only listen to the IPv4 address. **IPv6Only**;; If the address is absent, or resolves to both an IPv4 and an IPv6 address, only listen to the IPv6 address."
}

variable "or_port_flags_exclusive" {
  default = null
  description = "For obvious reasons, NoAdvertise and NoListen are mutually exclusive, and IPv4Only and IPv6Only are mutually exclusive."
}

variable "publish_server_descriptor" {
  default = null
  description = "This option specifies which descriptors Tor will publish when acting as a relay. You can choose multiple arguments, separated by commas. + + If this option is set to 0, Tor will not publish its descriptors to any directories. (This is useful if you're testing out your server, or if you're using a Tor controller that handles directory publishing for you.) Otherwise, Tor will publish its descriptors of all type(s) specified. The default is \"1\", which means \"if running as a relay or bridge, publish descriptors to the appropriate authorities\". Other possibilities are \"v3\", meaning \"publish as if you're a relay\", and \"bridge\", meaning \"publish as if you're a bridge\"."
}

variable "reduced_exit_policy" {
  default = null
  description = "If set, use a reduced exit policy rather than the default one. + + The reduced exit policy is an alternative to the default exit policy. It allows as many Internet services as possible while still blocking the majority of TCP ports. Currently, the policy allows approximately 65 ports. This reduces the odds that your node will be used for peer-to-peer applications. + + The reduced exit policy is:"
}

variable "refuse_unknown_exits" {
  default = null
  description = "Prevent nodes that don't appear in the consensus from exiting using this relay.  If the option is 1, we always block exit attempts from such nodes; if it's 0, we never do, and if the option is \"auto\", then we do whatever the authorities suggest in the consensus (and block if the consensus is quiet on the issue). (Default: auto)"
}

variable "server_dnsallow_broken_config" {
  default = null
  description = "If this option is false, Tor exits immediately if there are problems parsing the system DNS configuration or connecting to nameservers. Otherwise, Tor continues to periodically retry the system nameservers until it eventually succeeds. (Default: 1)"
}

variable "server_dnsallow_non_rfc953_hostnames" {
  default = null
  description = "When this option is disabled, Tor does not try to resolve hostnames containing illegal characters (like @ and :) rather than sending them to an exit node to be resolved. This helps trap accidental attempts to resolve URLs and so on. This option only affects name lookups that your server does on behalf of clients. (Default: 0)"
}

variable "server_dnsdetect_hijacking" {
  default = null
  description = "When this option is set to 1, we will test periodically to determine whether our local nameservers have been configured to hijack failing DNS requests (usually to an advertising site). If they are, we will attempt to correct this. This option only affects name lookups that your server does on behalf of clients. (Default: 1)"
}

variable "server_dnsrandomize_case" {
  default = null
  description = "When this option is set, Tor sets the case of each character randomly in outgoing DNS requests, and makes sure that the case matches in DNS replies. This so-called \"0x20 hack\" helps resist some types of DNS poisoning attack. For more information, see \"Increased DNS Forgery Resistance through 0x20-Bit Encoding\". This option only affects name lookups that your server does on behalf of clients. (Default: 1)"
}

variable "server_dnsresolv_conf_file" {
  default = null
  description = "Overrides the default DNS configuration with the configuration in __filename__. The file format is the same as the standard Unix \"**resolv.conf**\" file (7). This option, like all other ServerDNS options, only affects name lookups that your server does on behalf of clients. (Defaults to use the system DNS configuration or a localhost DNS service in case no nameservers are found in a given configuration.)"
}

variable "server_dnssearch_domains" {
  default = null
  description = "If set to 1, then we will search for addresses in the local search domain. For example, if this system is configured to believe it is in \"example.com\", and a client tries to connect to \"www\", the client will be connected to \"www.example.com\". This option only affects name lookups that your server does on behalf of clients. (Default: 0)"
}

variable "server_dnstest_addresses" {
  default = null
  description = "When we're detecting DNS hijacking, make sure that these __valid__ addresses aren't getting redirected. If they are, then our DNS is completely useless, and we'll reset our exit policy to \"reject *:*\". This option only affects name lookups that your server does on behalf of clients. (Default: \"www.google.com, www.mit.edu, www.yahoo.com, www.slashdot.org\")"
}

variable "server_transport_listen_addr" {
  default = null
  description = "When this option is set, Tor will suggest __IP__:__PORT__ as the listening address of any pluggable transport proxy that tries to launch __transport__. (IPv4 addresses should written as-is; IPv6 addresses should be wrapped in square brackets.) (Default: none)"
}

variable "server_transport_options" {
  default = null
  description = "When this option is set, Tor will pass the __k=v__ parameters to any pluggable transport proxy that tries to launch __transport__. + (Example: ServerTransportOptions obfs45 shared-secret=bridgepasswd cache=/var/lib/tor/cache) (Default: none)"
}

variable "server_transport_plugin" {
  default = null
  description = "The Tor relay launches the pluggable transport proxy in __path-to-binary__ using __options__ as its command-line options, and expects to receive proxied client traffic from it. (Default: none)"
}

variable "shutdown_wait_length" {
  default = null
  description = "When we get a SIGINT and we're a server, we begin shutting down: we close listeners and start refusing new circuits. After **NUM** seconds, we exit. If we get a second SIGINT, we exit immediately. (Default: 30 seconds)"
}

variable "signing_key_lifetime" {
  default = null
  description = "For how long should each Ed25519 signing key be valid?  Tor uses a permanent master identity key that can be kept offline, and periodically generates new \"signing\" keys that it uses online.  This option configures their lifetime. (Default: 30 days)"
}

variable "ssl_key_lifetime" {
  default = null
  description = "When creating a link certificate for our outermost SSL handshake, set its lifetime to this amount of time. If set to 0, Tor will choose some reasonable random defaults. (Default: 0)"
}

variable "bridge_record_usage_by_country" {
  default = null
  description = "When this option is enabled and BridgeRelay is also enabled, and we have GeoIP data, Tor keeps a per-country count of how many client addresses have contacted it so that it can help the bridge authority guess which countries have blocked access to it. If ExtraInfoStatistics is enabled, it will be published as part of the extra-info document. (Default: 1)"
}

variable "cell_statistics" {
  default = null
  description = "Relays only. When this option is enabled, Tor collects statistics about cell processing (i.e. mean time a cell is spending in a queue, mean number of cells in a queue and mean number of processed cells per circuit) and writes them into disk every 24 hours. Onion router operators may use the statistics for performance monitoring. If ExtraInfoStatistics is enabled, it will published as part of the extra-info document. (Default: 0)"
}

variable "conn_direction_statistics" {
  default = null
  description = "Relays only. When this option is enabled, Tor writes statistics on the amounts of traffic it passes between itself and other relays to disk every 24 hours. Enables relay operators to monitor how much their relay is being used as middle node in the circuit. If ExtraInfoStatistics is enabled, it will be published as part of the extra-info document. (Default: 0)"
}

variable "dir_req_statistics" {
  default = null
  description = "Relays and bridges only. When this option is enabled, a Tor directory writes statistics on the number and response time of network status requests to disk every 24 hours. Enables relay and bridge operators to monitor how much their server is being used by clients to learn about Tor network. If ExtraInfoStatistics is enabled, it will published as part of the extra-info document. (Default: 1)"
}

variable "entry_statistics" {
  default = null
  description = "Relays only. When this option is enabled, Tor writes statistics on the number of directly connecting clients to disk every 24 hours. Enables relay operators to monitor how much inbound traffic that originates from Tor clients passes through their server to go further down the Tor network. If ExtraInfoStatistics is enabled, it will be published as part of the extra-info document. (Default: 0)"
}

variable "exit_port_statistics" {
  default = null
  description = "Exit relays only. When this option is enabled, Tor writes statistics on the number of relayed bytes and opened stream per exit port to disk every 24 hours. Enables exit relay operators to measure and monitor amounts of traffic that leaves Tor network through their exit node. If ExtraInfoStatistics is enabled, it will be published as part of the extra-info document. (Default: 0)"
}

variable "extra_info_statistics" {
  default = null
  description = "When this option is enabled, Tor includes previously gathered statistics in its extra-info documents that it uploads to the directory authorities. Disabling this option also removes bandwidth usage statistics, and GeoIPFile and GeoIPv6File hashes from the extra-info file. Bridge ServerTransportPlugin lines are always included in the extra-info file, because they are required by BridgeDB. (Default: 1)"
}

variable "hidden_service_statistics" {
  default = null
  description = "Relays and bridges only. When this option is enabled, a Tor relay writes obfuscated statistics on its role as hidden-service directory, introduction point, or rendezvous point to disk every 24 hours.  If ExtraInfoStatistics is enabled, it will be published as part of the extra-info document. (Default: 1)"
}

variable "overload_statistics" {
  default = null
  description = "Relays and bridges only. When this option is enabled, a Tor relay will write an overload general line in the server descriptor if the relay is considered overloaded. (Default: 1) + A relay is considered overloaded if at least one of these conditions is met: - Onionskins are starting to be dropped. - The OOM was invoked."
}

variable "padding_statistics" {
  default = null
  description = "Relays and bridges only. When this option is enabled, Tor collects statistics for padding cells sent and received by this relay, in addition to total cell counts. These statistics are rounded, and omitted if traffic is low. This information is important for load balancing decisions related to padding. If ExtraInfoStatistics is enabled, it will be published as a part of the extra-info document. (Default: 1)"
}

variable "dir_cache" {
  default = null
  description = "When this option is set, Tor caches all current directory documents except extra info documents, and accepts client requests for them. If **DownloadExtraInfo** is set, cached extra info documents are also cached. Setting **DirPort** is not required for **DirCache**, because clients connect via the ORPort by default. Setting either DirPort or BridgeRelay and setting DirCache to 0 is not supported.  (Default: 1)"
}

variable "dir_policy" {
  default = null
  description = "Set an entrance policy for this server, to limit who can connect to the directory ports. The policies have the same form as exit policies above, except that port specifiers are ignored. Any address not matched by some entry in the policy is accepted."
}

variable "dir_port" {
  default = null
  description = "If this option is nonzero, advertise the directory service on this port. Set it to \"auto\" to have Tor pick a port for you.  This option can occur more than once, but only one advertised DirPort is supported: all but one DirPort must have the **NoAdvertise** flag set. (Default: 0) + + The same flags are supported here as are supported by ORPort. This port can only be IPv4. + As of Tor 0.4.6.1-alpha, non-authoritative relays (see AuthoritativeDirectory) will not publish the DirPort but will still listen on it. Clients don't use the DirPorts on relays, so it is safe for you to remove the DirPort from your torrc configuration."
}

variable "dir_port_front_page" {
  default = null
  description = "When this option is set, it takes an HTML file and publishes it as \"/\" on the DirPort. Now relay operators can provide a disclaimer without needing to set up a separate webserver. There's a sample disclaimer in contrib/operator-tools/tor-exit-notice.html."
}

variable "max_consensus_age_for_diffs" {
  default = null
  description = "When this option is nonzero, Tor caches will not try to generate consensus diffs for any consensus older than this amount of time. If this option is set to zero, Tor will pick a reasonable default from the current networkstatus document.  You should not set this option unless your cache is severely low on disk space or CPU. If you need to set it, keeping it above 3 or 4 hours will help clients much more than setting it to zero. (Default: 0)"
}

variable "dos_circuit_creation_enabled" {
  default = null
  description = ""
}

variable "dos_circuit_creation_burst" {
  default = null
  description = ""
}

variable "dos_circuit_creation_defense_time_period" {
  default = null
  description = ""
}

variable "dos_circuit_creation_defense_type" {
  default = null
  description = ""
}

variable "dos_circuit_creation_min_connections" {
  default = null
  description = ""
}

variable "dos_circuit_creation_rate" {
  default = null
  description = ""
}

variable "dos_connection_enabled" {
  default = null
  description = ""
}

variable "dos_connection_defense_type" {
  default = null
  description = ""
}

variable "dos_connection_max_concurrent_count" {
  default = null
  description = ""
}

variable "dos_connection_connect_rate" {
  default = null
  description = ""
}

variable "dos_connection_connect_burst" {
  default = null
  description = ""
}

variable "dos_connection_connect_defense_time_period" {
  default = null
  description = ""
}

variable "dos_refuse_single_hop_client_rendezvous" {
  default = null
  description = ""
}

variable "hidden_service_enable_intro_do_sdefense" {
  default = null
  description = "Enable DoS defense at the intropoint level. When this is enabled, the rate and burst parameter (see below) will be sent to the intro point which will then use them to apply rate limiting for introduction request to this service. + The introduction point honors the consensus parameters except if this is specifically set by the service operator using this option. The service never looks at the consensus parameters in order to enable or disable this defense. (Default: 0)"
}

variable "hidden_service_enable_intro_do_sburst_per_sec" {
  default = null
  description = "The allowed client introduction burst per second at the introduction point. If this option is 0, it is considered infinite and thus if **HiddenServiceEnableIntroDoSDefense** is set, it then effectively disables the defenses. (Default: 200)"
}

variable "hidden_service_enable_intro_do_srate_per_sec" {
  default = null
  description = "The allowed client introduction rate per second at the introduction point. If this option is 0, it is considered infinite and thus if **HiddenServiceEnableIntroDoSDefense** is set, it then effectively disables the defenses. (Default: 25)"
}

