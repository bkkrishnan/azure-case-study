### Azure-case-study

We are palnning to migrate the FE apps Retail application from on-promise to azure cloud. So We will need to create a below compounents and network resopurces. 

### Compounents
1. Resource group
2. Vnet, NSG, Subnet, Route Tables (Define the inbound & Outbound Traffics)
3. Application Gateway with WAF (7 Layer)
4. DDoS (Protection from Internet & social attack)
5. APIM to Manage the api (Which will help us to expose the api with secure way)
6. AKS (Mange the application in scalabity & resilience environment and support 99.99% high Availability in services)
7. KetVault (We will store our secrets in here and refer it for the service)
8. Apply PrivateEndpoint to AKS and internet facing the resource like (storage account & Service Bus, EvntHub)
9. SQL Server and Databases(Manage the our transsacation and customer data if required based Architecture Diagram)
10. Create DR environment for all resource (Repilication of Prod Environment to handle the DR scenarios)


### Terraform Folder Struture

```
Azure-Case-Study
    Environment
        prod
            1.network-layer
                backend.tf
                datasource.tf
                main.tf
                outputs.tf
                providers.tf
                variables.tf
            terraform.terraform.prod.tfvars
    tf-modules
        nsg
            main.tf
            outputs.tf
            README.md
            variables.tf
        vnet
            main.tf
            outputs.tf
            README.md
            variables.tf
        resource_group
            main.tf
            outputs.tf
            README.md
            variables.tf
        subnet
            main.tf
            outputs.tf
            README.md
            variables.tf

```

### Run the terrafrom Configuration

1. Make sure you have below prerequtieis
    i. backend configuration
    ii. az login session
    iii. Ensure you have stroage blob data contributor access in storage account
2. Go to configution path
3. Run terraform init
4. Run Terraform Validate (If you want to verify the co figuration first)
5. Run Terraform Plan (Pass flag -var-files if you have tfvars file for the environment)
6. Run Terrafrom apply -auto-apptove (Pass flag -var-files if you have tfvars file for the environment)
7. Finally, You will able to see the resources into azure portal.

### Conculation
Hopefully, you have understood that, how we will create a new infrastucture via terraform and how it would have looks after creating it in azure portal.