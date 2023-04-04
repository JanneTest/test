FROM containers.intersystems.com/intersystems/irishealth-community:2023.1.0.218.0
COPY ./Installer.cls /usr/irissys/
RUN iris start iris && printf '_SYSTEM\nSYS\nzn "USER"\ndo $system.OBJ.Load("/usr/irissys/Installer.cls", "c")\ndo ##class(InterSystems.FHIRInstaller).setup()\n' | irissession IRIS
