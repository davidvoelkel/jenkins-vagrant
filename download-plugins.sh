#! /bin/bash

# Parse given specification file for jenkins plugins to be installed &
# download them into the JENKINS_HOME/plugins directory

jenkins_download_host=http://updates.jenkins-ci.org/
jenkins_plugin_dir=/var/lib/jenkins/plugins
while read spec || [ -n "$spec" ]; do
    plugin=(${spec//:/ });
    [[ ${plugin[0]} =~ ^# ]] && continue
    [[ ${plugin[0]} =~ ^\s*$ ]] && continue
    [[ -z ${plugin[1]} ]] && plugin[1]="latest"
    echo "Downloading ${plugin[0]}:${plugin[1]}"
    curl -s -L -f ${jenkins_download_host}/download/plugins/${plugin[0]}/${plugin[1]}/${plugin[0]}.hpi -o $jenkins_plugin_dir/${plugin[0]}.hpi || echo "Failed to download ${plugin[0]}:${plugin[1]}"
done  < $1

