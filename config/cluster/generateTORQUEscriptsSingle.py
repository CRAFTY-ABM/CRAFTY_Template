'''
Created on 08.03.2014

@author: Sascha Holzhauer
'''

import sys, os, shutil, stat

workingDir = "./"
targetDir = "../"

numRunsPerBatch = 1

scenarioFile = "xml/baseline/Scenario.xml"
dataFolder   = "./data/"
outputFolder = "./output/"

startTick   = 2000
endTick     = 2025

numRuns     = 10
numRunsPerBatch = 1
randomSeedStart = 0

scenario    = "Scenario"

if (len(sys.argv) >= 5):
    dataFolder      = sys.argv[1]
    scenarioFile    = sys.argv[2]
    startTick   = int(sys.argv[3])
    endTick     = int(sys.argv[4])
    
    if (len(sys.argv) >= 6):
        numRuns = int(sys.argv[5])
    
    if (len(sys.argv) >= 7):
        numRunsPerBatch = int(sys.argv[6])    
    
    if (len(sys.argv) >= 8):
        randomSeedStart = int(sys.argv[7])
        
    if (len(sys.argv) >= 9):
        scenario = sys.argv[8]

    SinglesTargetDir = "./" + scenario + "/"
    
    print("Build scripts for scenario file ")
    print(scenarioFile + " (ticks " + str(startTick) + "-" + str(endTick) + ")")
    
    # specify target file (without file ending
    torqueScriptTemplate =  "Eddie_CraftyTestModel_Single"
    
    if os.path.exists("../" + SinglesTargetDir):
        shutil.rmtree("../" + SinglesTargetDir, ignore_errors=True)    
    os.mkdir("../" + SinglesTargetDir)
    
    if os.path.exists("../" + outputFolder + scenario):
        shutil.rmtree("../" + outputFolder + scenario, ignore_errors=True)    
    os.mkdir("../" + outputFolder + scenario)
    
    qsubFilename = targetDir + "qsubScript_" + scenario + "_" + str(startTick) +"-" + str(endTick) + ".sh"
    qsubScript = open(qsubFilename, "w")
    
    qsubScript.write("#!/bin/bash\n")
    for i in range(0, numRuns, numRunsPerBatch):
             
        # adapt torque script:
        infile = open(workingDir + "resources/" + torqueScriptTemplate + ".sh", 'r')
        outFile = open("../" + SinglesTargetDir + torqueScriptTemplate +  "_" + str(randomSeedStart + i) + ".sh", 'w')
        inputLine =  infile.readline()
        while inputLine != "":
            inputLine = inputLine.replace("%SCENARIO_FILE%", scenarioFile)
            inputLine = inputLine.replace("%DATA_FOLDER%", dataFolder)
            inputLine = inputLine.replace("%START_TICK%", str(startTick))
            inputLine = inputLine.replace("%END_TICK%", str(endTick))
            inputLine = inputLine.replace("%NUM_RUNS%", str(numRunsPerBatch))
            inputLine = inputLine.replace("%RANDOM_SEED_OFFSET%", str(randomSeedStart + i))
            inputLine = inputLine.replace("%SCENARIO%", scenario)
            outFile.write(inputLine)
            inputLine =  infile.readline()
        infile.close()
        outFile.close()
        
        qsubScript.write("qsub " + SinglesTargetDir  + torqueScriptTemplate +  "_" + str(randomSeedStart + i) + ".sh\n")
    qsubScript.close()
    
    st = os.stat(qsubFilename)
    os.chmod(qsubFilename, st.st_mode | stat.S_IEXEC)
    
else:
    print("Usage: <script> <data folder> <scenario file> <start tick> <end tick> <numRuns> <num runs per batch> <randomSeedOffset> <scenario>")