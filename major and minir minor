import jenkins.model.Jenkins
import hudson.model.*

def jenkins = Jenkins.getInstance()
def jobName = "yourJobName"
String versionType = "minor"
def job = jenkins.getItem(jobName)

//get the current version parameter and update its default value
paramsDef = job.getProperty(ParametersDefinitionProperty.class)
if (paramsDef) {
   paramsDef.parameterDefinitions.each{
       if("version".equals(it.name)){
           println "Current version is ${it.defaultValue}"
           it.defaultValue = getUpdatedVersion(versionType, it.defaultValue)
           println "Next version is ${it.defaultValue}"
       }
   }
}

//determine the next version by the required type 
//and incrementing the current version

def getUpdatedVersion(String versionType, String currentVersion){

    def split = currentVersion.split('\\.')
    switch (versionType){
        case "minor.minor":
            split[2]=++Integer.parseInt(split[2])
            break
        case "minor":
            split[1]=++Integer.parseInt(split[1])
            break;
        case "major":
           split[0]=++Integer.parseInt(split[0])
           break;
    }
    return split.join('.')
}
