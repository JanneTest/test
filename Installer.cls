Class InterSystems.FHIRInstaller
{

ClassMethod setup()
{
      zn "HSLIB"

      Set appKey = "/myfhirserver/fhir/r4"
      Set strategyClass = "HS.FHIRServer.Storage.Json.InteractionsStrategy"
      Set metadataPackages = $lb("hl7.fhir.r4.core@4.0.1","hl7.fhir.us.core@3.1.0")

      Do ##class(HS.HC.Util.Installer).InstallFoundation("FHIRNamespace")
      Set $namespace = "FHIRNamespace"

      // Install elements that are required for a FHIR-enabled namespace
      Do ##class(HS.FHIRServer.Installer).InstallNamespace()

      // Install an instance of a FHIR Service into the current namespac
      Do ##class(HS.FHIRServer.Installer).InstallInstance(appKey, strategyClass, metadataPackages)
}

}
