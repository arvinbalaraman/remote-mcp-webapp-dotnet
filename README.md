# AZD Template for App Service web app following best practices

This template deploys a simple Flask web application to Azure App Service. The App Service is created following best practices and security recommendations provided by the Azure App Service product group. You may choose to enable/disable certain features based on your requirements.

Because the App Service is created following best practices, it includes features such as:

- Virtual Network Integration
- Managed Identity
- Logging and Monitoring
- Slot Deployment
- And more!

Note that this template is for demonstration purposes only and may not be suitable for production use. You should review the settings and configurations to ensure they meet your requirements. Pay attention to the ipSecurityRestrictions setting in the template, as it restricts access to the App Service to a specific IP address range. You may need to update this setting to allow access from your IP address or network.

## Usage

1. Install AZD.
1. Login to azd. Only required once per-install.

    ```bash
    azd auth login
    ```

1. Run the following command to initialize the project.

    ```bash
    azd init --template Azure-Samples/app-service-web-app-best-practice
    ```

    This command will clone the code to your current folder and prompt you for required information.
    - `Environment Name`: This will be used as a prefix for the resource group that will be created to hold all Azure resources. This name should be unique within your Azure subscription.
1. Run the following command to build a deployable copy of your application, provision the template's infrastructure to Azure and also deploy the application code to those newly provisioned resources.

    ```bash
    azd up
    ```

    This command will prompt you for the following information:
    - `Azure Location`: The Azure location where your resources will be deployed.
    - `Azure Subscription`: The Azure Subscription where your resources will be deployed.
    > NOTE: This may take a while to complete as it executes three commands: `azd package` (builds a deployable copy of your application), `azd provision` (provisions Azure resources), and `azd deploy` (deploys application code). You will see a progress indicator as it packages, provisions and deploys your application.
1. [Optional] Make changes to app.py and run `azd deploy` again to update your changes.

## Additional notes

The `sample.bicep` file is available in the main directory of this repo to provide a single template that includes all of the resources and properties in the AZD template. Information and details have been added in-line in that file to provide more context on the various properties including why you should configure them as described.