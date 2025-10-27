# 100-puppet_ssh_config.pp
# Puppet manifest to configure SSH client for passwordless login using a private key

# Ensure the system-wide SSH client config file exists
file { '/etc/ssh/ssh_config':
  ensure => file,
}

# Declare the identity file (private key)
file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
}

# Turn off password authentication
file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
}

