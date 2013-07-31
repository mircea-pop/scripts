#!/bin/bash
eclipseUpdateSite="http://download.eclipse.org/releases/kepler/"

updateSites=(
$eclipseUpdateSite #Eclipse
'https://sourceforge.net/projects/eclipsejsonedit/files/update' #JSON Editor
'http://moreunit.sourceforge.net/update-site/' #MoreUnit
'http://update.eclemma.org/' #EclEmma Code Coverage
'http://dist.springsource.com/release/TOOLS/gradle' #GRADLE integration
)

plugins=(
'jsonedit-feature.feature.group' #JSON Editor
'org.eclipse.mylyn_feature.feature.group' #Mylyn
'org.moreunit.feature.group' #MoreUnit
'com.mountainminds.eclemma.feature.feature.group' #EclEmma Code Coverage
'org.springsource.ide.eclipse.gradle.feature.feature.group' #GRADLE integration
)

updateSitesArray=$(printf ",%s" "${updateSites[@]}")
updateSitesArray=${updateSitesArray:1}

pluginsArray=$(printf ",%s" "${plugins[@]}")
pluginsArray=${pluginsArray:1}

./eclipse -nosplash -application org.eclipse.equinox.p2.director -repository $updateSitesArray -installIUs $pluginsArray
