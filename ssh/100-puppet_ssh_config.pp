# 100-puppet_ssh_config.pp
# Puppet manifest to configure SSH client for passwordless login

# Ensure the SSH config file exists
file { '/home/ubuntu/.ssh/config':
  ensure => 'file',
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0600',
}

# Set the identity file to ~/.ssh/school
file_line { 'Declare identity file':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

# Disable password authentication
file_line { 'Turn off passwd auth':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}

