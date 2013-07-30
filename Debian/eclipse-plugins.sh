#!/bin/bash
eclipseUpdateSite="http://download.eclipse.org/releases/kepler/"

updateSites=(
$eclipseUpdateSite 
'https://sourceforge.net/projects/eclipsejsonedit/files/update' #JSON Editor
'http://moreunit.sourceforge.net/update-site/' #MoreUnit
'http://update.eclemma.org/' #EclEmma Code Coverage
'http://dist.springsource.com/release/TOOLS/gradle' #GRADLE integration
)

plugins=(
'jsonedit-feature.feature.group' 
'org.eclipse.mylyn_feature.feature.group' 
'org.moreunit.feature.group' 
'com.mountainminds.eclemma.feature.feature.group'
'org.springsource.ide.eclipse.gradle.feature.feature.group'
)

updateSitesArray=$(printf ",%s" "${updateSites[@]}")
updateSitesArray=${updateSitesArray:1}

pluginsArray=$(printf ",%s" "${plugins[@]}")
pluginsArray=${pluginsArray:1}

./eclipse -nosplash -application org.eclipse.equinox.p2.director -repository $updateSitesArray -installIUs $pluginsArray
