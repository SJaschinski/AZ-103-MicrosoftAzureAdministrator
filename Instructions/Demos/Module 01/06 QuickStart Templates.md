# Module 01 Demonstration: QuickStart Templates
In this demonstration, you will explore QuickStart templates.

### Explore the gallery 
1.  You could start by browsing to the **Azure Quickstart Templates gallery** to see what\'s available. In the gallery you will find several popular and recently updated templates. These templates work with both Azure resources and popular software packages.
2.  Browse through the many different types of templates that are available.
3.  Are there are any templates that are of interest to you?

### Explore a template 
1.  Let\'s say you come across the **Deploy a simple Windows VM** template at\
<https://azure.microsoft.com/en-us/resources/templates/101-vm-simple-windows/?azure-portal=true>
2.  Note: The **Deploy to Azure** button enables you to deploy the template directly through the Azure portal if you wish.
3.  Note: Scroll-down to the Use the template **PowerShell** code. You will need the **TemplateURI** in the next demo. **Copy the value**.
4.  Click **Browse on GitHub** to navigate to the template\'s source code on GitHub.
5.  Notice from this page you can also **Deploy to Azure**. Take a minute to view the Readme file. This helps to determine if the template is for you.
6.  Click **Visualize** to navigate to the **Azure Resource Manager Visualizer**.
7.  Notice the resources that make up the deployment, including a VM, a storage account, and network resources.
8.  Use your mouse to arrange the resources. You can also use your mouse\'s scroll wheel to zoom in an out.
9.  Click on the VM resource labelled **SimpleWinVM**.
10. Review the source code that defines the VM resource.
    a.  The resource\'s type is Microsoft.Compute/virtualMachines.
    b.  Its location, or Azure region, comes from the template parameter named location.
    c.  The VM\'s size is **Standard\_A2**.
    d.  The computer name is read from a template variable, and the username and password for the VM are read from template parameters.
11. Return to the QuickStart page that shows the files in the template. Copy the link to the azuredeploy. json file. You will need the template link in the next demonstration.

