Instructions for using the template

This template is meant to include the most appropriate file structure for a new CRAFTY model to start with.
However, depending on your model it might be a better idea to start from another configured project.

When you checked out the template from the repository, make sure to disconnect the project and optionally share 
it with another repository (otherwise you'd mess up the template when committing if you're allowed to):
* In eclipse, right-click the checked out project > Team > Disconnect
* Delete the .hg folder in the project folder
* In eclipse, right-click the checked out project > Team > Share Project ...

Another option is to fork the template to your own repository.

In order to adjust this template to your context, search all files for "TEMPLATE" and replace that string
with a suitable substitute.

Currently known files are:
./config/ant/FetchBackResults.xml
./config/ant/ReleaseToLinuxCluster.xml
./config/cluster/resources/Eddie_CraftySerialModel.sh
./config/cluster/resources/Eddie_CraftyParallelModel.sh
templates in ./config/R

Also, the launcher in ./config/launcher should be adapted to point to the correct project and configuration,
as well as adapting the classpath (bin/, config/log/).

If you have any further questions don't hesitate to contact
Sascha.Holzhauer@ed.ac.uk 