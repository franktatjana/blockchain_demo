## Network Bootstrapper
This is a tool that scans all the node configurations from a common directory to generate the network parameters file, which is then copied to all the nodes’ directories. It also copies each node’s node-info file to every other node so that they can all be visible to each other.
https://docs.corda.net/docs/corda-enterprise/4.1/network-bootstrapper.html

1. Download Corda Network Bootstrapper
2. Create a directory containing a node config file, ending in “_node.conf”, for each node you want to create. “devMode” must be set to true. Then run the following command:
```
    java -jar network-bootstrapper-4.1.jar --dir <nodes-root-dir>
```
For example running the command on a directory containing files *_node.conf  will generate directories containing three nodes: notary, partya and partyb. They will each use the corda.jar that comes with the Network Bootstrapper.
> .
├── notary_node.conf             // The notary's node.conf file
├── partya_node.conf             // Party A's node.conf file
└── partyb_node.conf             // Party B's node.conf file

3. Include your CorDapps in each generated node, place them in the directory alongside the config files. The Bootstrapper will copy these apps to the folder cordapps
> .
├── notary_node.conf            // The notary's node.conf file
├── partya_node.conf            // Party A's node.conf file
├── partyb_node.conf            // Party B's node.conf file
├── cordapp-a.jar               // A cordapp to be installed on all nodes
└── cordapp-b.jar               // Another cordapp to be installed on all nodes

	These CorDapps are necessary to run Corda Explorer. Unified versioning is crucial to run the network properly. 
> corda-finance-contracts-4.1.jar
corda-finance-workflows-4.1.jar

4.Create a folder config in cordapps and file corda-finance-workflows-4.1.conf with the following content
```
{
    "issuableCurrencies" : [
        "USD",
        "GBP"
    ]
}

```



##Scripts
### corda_[party].service
**Linux: Installing and running Corda as a system service**
https://docs.corda.net/docs/corda-os/4.1/deploying-a-node.html

**NB:** 
* Creation of a user corda does not allow to connect Corda Explorer to Corda Nodes. However according to documentation: Change the username to the user account you want to use to run Corda. We recommend that this user account is not root

* Ubuntu 16.04 and most current Linux distributions use SystemD
* Make sure the service description is informative - particularly if you plan to run multiple nodes: naming convention **corda_[party].service**

**How-To**
1. Create a corda.service file save it in the directory /etc/systemd/system/ and make the following changes to corda_[party].service
```
    [Unit]
    Description=Corda Node - Bank **CORDA_PARTY_NAME** - party X
    Requires=network.target
	
    [Service]
    Type=simple
    User=root
    WorkingDirectory=/opt/corda/network/nodes/**CORDA_PARTY_NAME**
    ExecStart=sudo /usr/bin/java -jar /opt/corda/network/nodes/**CORDA_PARTY_NAME**/corda.jar
    Restart=on-failure
	
    [Install]
    WantedBy=multi-user.target
```

2. Make sure the corda.service file is owned by root with the correct permissions:
```
sudo chown root:root /etc/systemd/system/corda_[party].service
sudo chmod 644 /etc/systemd/system/corda_[party].service
```
3. You can now start a node and its webserver and set the services to start on boot by running the following systemctl commands:
  ```
sudo systemctl daemon-reload
sudo systemctl enable --now corda_[party].service
   ```

![folder_structure](corda_artefacts/folder_structure.png)

##run_corda.sh
