## Urban Microclimate using the Urban Weather Generator
### Introduction
This notebook is a documentation for the urban microclimate sub-team progress and outcomes.

### Repository Overview
- **Repository:** UWG repo
- **File:** .ipynb
  
### Notebook Summary
This notebook includes steps, process, and issues related to using the Urban Weather Generator (UWG) to have quick urban microclimate results. Below are the summarized steps of the process.
1. Test run the UWG script using a selected .epw file retrieved from https://climate.onebuilding.org/.
2. Perform sensitivity analysis test to select the most affective UWG inputs.
3. Collect the exact values for the selected inputs in the selected .epw file location (Using Grasshopper script).
4. Run the UWG with the correct inputs.
5. Compare the UWG .epw results with the initial .epw file.

### Usage
The notebook is structured in crolonogical order, where each heading is a step and below the step are it's issues and process. 

### Models and Algorithms Used
- **test**
- 
### Data Description
The dataset used 

### Key Findings and Observations
- The most affective inputs to be used in Atlanta, GA are; min wind speed, avg bldg height, veg start/end month, vert horiz ratio, rural avg obstacle height, albedo of veg, and sens anthro heat.

### Conclusions

### Process
## 1. Test Run the UWG
#### Process
- 
-
#### Issues
-
-

## 2. Snsitivty Analysis
#### Process
- 
-
#### Issues
- (The errors we faced)
-
## 3. Data Collection
#### Process
- A grasshopper script was developed to collect the data based on the OSM coordinates of the 125m tile.
- The coordinates of the tile are inpputted manually in GH to modify the bouding box and get the data of the specific lot.
- Ladybug in GH is used to get the wind speed.
- The spatial references of the trees cover, grass cover, buildings, anf vert horiz ratio has been utilized to find the percentage of the parameters.

#### Issues/Notes
- Map tiler Mercator tiling approach. Web Mercator projection using unique sets of coordinates to input the coordinates of each tile in the location in GH.
- Building heights are retrieved from FEMA.
- LiDAR is used to find the building height to area ratio.
- To avoid any issues toggle the true or false instantly after getting each result or when making any changes.
  

## 4. Run Accurate UWG
#### Process
-
-
#### Issues
-
-

## 5. Comparison
#### Process
-
-
#### Issues
-
-

### References
