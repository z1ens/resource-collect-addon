#!/usr/bin/env bash

########################
# include the magic
########################
. ./demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# text color
# DEMO_CMD_COLOR=$BLACK

# clean env
clear

# hide the evidence

p "Hello, this is a demo for the new updates in resource-collect-usage-addon, which add the GPU scores for the clusters. Users could use scores in AddOnPlacementScore to select clusters."
p "Precondition 1: The environment has 3 managed clusters."
pe "oc get managedclusters"
p "Each managed cluster has different GPU resources, which describes as the number of allocatble GPUs and also the capacity of GPUs"
pe "oc get managedcluster -o yaml | grep gpu"
p "scoretool --resource-name demo1 --interval 20"
pe "kubectl get AddOnPlacementScore -A"
pe "kubectl get AddOnPlacementScore -A -oyaml"
pe "kubectl get addonplacementscore -A -o=jsonpath='{range .items[*]}{.metadata.namespace}{\"\\t\"}{.status.scores}{\"\\n\"}{end}'"

p "Case 1: I want to select 2 clusters with highest customized score cpuratio."
pe "cat demo1-1.yaml"
pe "kubectl create -f demo1-1.yaml -n ${NS}"
pe "kubectl describe -f demo1-1.yaml -n ${NS} | grep Events -A 10"
pe "kubectl describe placementdecision demo1-1-decision-1 -n ${NS} | grep Status -A 10"
p "Placement reschedule every 5 minutes (in this demo is 20s)"
cmd
cmd
cmd
cmd
cmd
cmd
cmd
cmd
cmd
cmd

p "Case 2: I want to select 2 clusters with highest customized score cpuratio and keep the decision steady."
pe "cat demo1-2.yaml"
pe "kubectl create -f demo1-2.yaml -n ${NS}"
pe "kubectl describe -f demo1-2.yaml -n ${NS} | grep Events -A 10"
pe "kubectl describe placementdecision demo1-2-decision-1 -n ${NS} | grep Status -A 10"
cmd
cmd
cmd
cmd
cmd
cmd
cmd
cmd
cmd
cmd

p "Case 3: I want to select 1 cluster with lowest customized score cpuratio."
pe "cat demo1-3.yaml"
pe "kubectl create -f demo1-3.yaml -n ${NS}"
pe "kubectl describe -f demo1-3.yaml -n ${NS} | grep Events -A 10"
pe "kubectl describe placementdecision demo1-3-decision-1 -n ${NS} | grep Status -A 10"

pe "- end -"

clear
