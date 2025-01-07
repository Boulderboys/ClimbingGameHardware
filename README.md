# Boulderboys Climbing Game Hardware
This is the Vivado project for the Boulderboys Climbing game.

## Setting up Git in Vivado
This project uses a Vivado Git wrapper: https://github.com/barbedo/vivado-git.
Follow the instructions on the `Install` section of the readme for the wrapper to install the wrapper.

## Cloning the repository


To set up the project locally:
1. Clone the repository as you normally would
   ```
   git clone https://github.com/Boulderboys/ClimbingGameHardware.git
   ```
2. Open Vivado
3. On the starting screen, go to `Tools -> Run Tcl Script...`
4. Find the script `ClimbingGameHardware.tcl` at the root of the repository and select it.
5. The project will be created with all the source files.

## Making changes
When adding files, **do not save them to the local project directory**. Instead, save them to `src`, in the relevant subfolder.
Vivado sometimes auto-generates a dcp file in the project, check the Utility Sources tab in Vivado and delete the dcp file before committing.
If you're adding a block diagram, make sure it's local to the Vivado project. The git wrapper will generate the Tcl such that it regenerates the block design alongside the project.

The git wrapper will regenerate the Tcl script any time you run `git commit -m "<commit message>"` in Vivado's Tcl console. If you prefer to do git operations in a different environment, such as VSCode or GitHub Desktop, you can instead generate the Tcl by doing `wproj` ("**w**rite **proj**ect) in the Tcl console, then adding and committing changes in the other environment.
