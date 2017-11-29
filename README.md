## Technology Highlights
- Hyper-V & VM Provisioning
- Active Directory
- Microsoft Remote Desktop Services (RDS)
- XML Meta data
- Managed VM Reboots
- PowerShell/CredSSP

## Objective
Dynamically provision and configure infrastructure based on parameters defined by an end user. Support dynamic provisioning of the following:

- Abstract deployment configuration into server roles
- Active Directory Domain one to many nodes
- RDS clustered or stand-alone
- VM Hardware profile values
- Deploy VM from ISO or Template
- Dynamic or static IP assignment
- Windows license activation

## About the project
**XML Meta Data**

Environment assets to be provisioned are defined by the user in a meta data file. It's then ingested as a PowerShell hash table and validated prior to execution to ensure deployment integrity.

**VM Provisioning**

VM's can be provisioned from an ISO or VM template referenced in the meta data file. An unattend file is dynamically generated to issue uniqueness to each VM at the point of creation. Clients are automatically joined to its respective AD domain, it's object is placed in its designated AD Organizational Unit and DNS client list is set

**RDS Cluster**

Supports clustered or stand-alone Connection Broker deployment scenarios

**Active Directory**

Provision 1 or many AD/DNS servers. Logic will determine how to handle this setup.

**CredSSP**

Used to manipulate AD resources and handle multi-hop authentication.

**Orchestration and Managed Reboots**

Each attribute defined in the meta data file drives which assets will be provisioned. This program will dynamically identify dependencies and prerequisites to ensure a successful deployment each time.

With a single initial remote PowerShell session, several reboots are managed throughout the process by writing a function that monitors WinRM online/offline connectivity to ensure each provisioning step picks up where it left off before it's system reboot.
