- Open Power-Shell(Admin)
  ```bash
  Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

- Enable and starts SSH service:
```bash
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
```

- Allow SSH in firewall:
```bash
New-NetFirewallRule -Name sshd -DisplayName "OpenSSH Server" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

- Verify it's running:
```bash
Get-Service sshd
```

- now you can ssh into window from another system with:
```bash
ssh windows_username@windows_ip
```
