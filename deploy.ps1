az deployment sub create  `
--location westeurope `
--template-file .\subscriptionscope.bicep `
--parameters location='westeurope' environment='tst' projectName='viktorbicep' 