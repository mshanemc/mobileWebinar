sfdx shane:org:create -s -f config/project-scratch-def.json -d 1 --userprefix user -o grocery.demo

sfdx force:source:push

sfdx force:user:permset:assign -n grocery

sfdx force:data:tree:import -p data/pickupOrderPlan.json
sfdx force:data:tree:import -f data/Task.json
sfdx force:data:tree:import -f data/Event.json
sfdx shane:user:password:set -g User -l User -p mobile123

# package for e-signature
sfdx force:package:install --package 04t24000000kaar
#utilitypack
sfdx force:package:install --package 04t0I000000Xa0Y
#events
sfdx force:package:install --package 04t28000000yBl5

sfdx force:org:open

sfdx force:user:create -f config/userDef/bandar.json
sfdx force:user:create -f config/userDef/jodi.json
sfdx force:user:create -f config/userDef/rahul.json

sfdx shane:user:photo -f assets/bandar.jpeg -l El-Eita
sfdx shane:user:photo -f assets/jodi.jpg -l Innerfield
sfdx shane:user:photo -f assets/rahul.jpeg -l Awasthy

sfdx force:apex:execute -f scripts/setup.cls
sfdx shane:user:photo -f assets/shane.jpeg -l McLaughlin
