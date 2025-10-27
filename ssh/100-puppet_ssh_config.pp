# This Puppet manifest configures the SSH client to use a specific identity file and disables password authentication

file { '/etc/ssh/ssh_config':
  ensure => file,
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
}

file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^    IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^    PasswordAuthentication',
}

