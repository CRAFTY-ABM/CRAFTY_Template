################################################################################
# Version specific SIMulation Properties:
#
# Project:		TEMPLATE
# Last update: 	02/09/2015
# Author: 		Sascha Holzhauer
################################################################################

# General SIMulation Properties ################################################

if (!exists("simp")) simp <- craftyr::param_getDefaultSimp()

simp$sim$version				<- "VERSION"
simp$sim$parentf				<- ""
simp$sim$folder					<- paste("_", simp$sim$version, sep="")
simp$sim$scenario				<- "A1"
simp$sim$regionalisation		<- "26"
simp$sim$regions				<- c("AT", "BE", "BG", "CZ", "DE", "DK", "EE", "EL", "ES",
									"FI", "FR", "HU", "IE", "IT", "LT", "LU", "LV", "MT", 
									"NL", "PL", "PT", "RO", "SE", "SI", "SK", "UK")
simp$sim$runids					<- c("0-0")
simp$sim$id 					<- "A1-0"


### Directories ################################################################
simp$dirs$outputdir			<- paste(simp$dirs$project,	"TEMPLATE/Output", sep="")

simp$dirs$output$simulation	<- paste(simp$dirs$outputdir, "Data/", sep="")
simp$dirs$output$data		<- paste(simp$dirs$outputdir, "Data/", sep="")
simp$dirs$output$rdata		<- paste(simp$dirs$outputdir, "RData/", sep="") 
simp$dirs$output$raster		<- paste(simp$dirs$outputdir, "Raster/", sep="") 
simp$dirs$output$figures	<- paste(simp$dirs$outputdir, "Figures/", sep="")
simp$dirs$output$reports	<- paste(simp$dirs$outputdir, "Reports/", sep="")
simp$dirs$output$tables		<- paste(simp$dirs$outputdir, "/Tables/", sep="")
simp$dirs$output$csv		<- paste(simp$dirs$outputdir, "/CSV/", sep="")
simp$dirs$output$runinfo	<- paste("TEMPLATE/CRAFTY_Runs.ods")

simp$dirs$data				<-  paste(simp$dirs$project, "data/", version, sep="") 


### Figure Settings ############################################################
simp$fig$resfactor		<- 3
simp$fig$outputformat 	<- "png"
simp$fig$init			<- craftyr::output_visualise_initFigure
simp$fig$numfigs		<- 1
simp$fig$numcols		<- 1
simp$fig$height			<- 1000
simp$fig$width			<- 1500
simp$fig$splitfigs		<- FALSE
simp$fig$facetlabelsize <- 14

### Batch Run Creation Settings #################################################
simp$batchcreation$scenarios				<- c("A1", "B1")
simp$batchcreation$startrun 				<- 0
simp$batchcreation$regionalisations			<- c("26")
simp$batchcreation$modes					<- c("plain", "complex")
simp$batchcreation$percentage_takeovers 	<- c(30) 
simp$batchcreation$competitions 			<- c("plain" = "Competition_linear.xml", 
												"complex" = "Competition_linear.xml")
simp$batchcreation$institutions				<- c("plain"="institutions/Institutions_CapitalDynamics.xml", 
												"complex" = "institutions/Institutions_CapitalDynamics.xml | 
															/institutions/Institution_VariableCapital.xml")
simp$batchcreation$multifunctionality 		<- c("plain" = "mono", "complex"= "multi")
simp$batchcreation$allocation				<- c("BestProductionFirstGiveUpGiveInAllocationModel.xml")
											
simp$batchcreation$variationstages 			<- c("plain" = "homo", "complex"= "hetero")
simp$batchcreation$socialnetwork 			<- "SocialNetwork_HDFF.xml"
simp$batchcreation$searchabilities			<- c(30)
simp$batchcreation$inputdatadir 			<- sprintf("./%s/data/%s", simp$dirs$project, version)
simp$batchcreation$inputdataagent_tmpldir	<- simp$dirs$inputdata
simp$batchcreation$agentparam_tmpldir		<- paste(simp$batchcreation$inputdataagent_tmpldir,
													"/agents/templates/", sep="")
simp$batchcreation$gu_stages				<- c("medium")
simp$batchcreation$gi_stages				<- c("medium")
simp$batchcreation$placeholders				<- c(0)

simp$batchcreation$versiondirs$production	<- simp$sim$version
simp$batchcreation$versiondirs$competition	<- simp$sim$version
simp$batchcreation$versiondirs$allocation	<- simp$sim$version
simp$batchcreation$versiondirs$worldfile	<- simp$sim$version
simp$batchcreation$versiondirs$agentdef 	<- simp$sim$version
