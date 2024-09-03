# Urban Microclimate using the Urban Weather Generator

The Urban Weather Generator models the urban heat island using EnergyPlus (.epw) weather files. The Python model utilizes various parameters to reflect urban canyon conditions.

## Introduction

This notebook is a documentation for the urban microclimate sub-team progress and outcomes.

## Notebook Summary

This notebook includes steps, process, and issues related to using the Urban Weather Generator (UWG) to have quick urban microclimate results. Below are the summarized steps of the process:

1. Test run the UWG script using a selected .epw file retrieved from https://climate.onebuilding.org/.
2. Perform sensitivity analysis test to select the most affective UWG inputs.
3. Collect the exact values for the selected inputs in the selected .epw file location (Using Grasshopper script).
4. Run the UWG with the correct inputs.
5. Compare the UWG .epw results with the initial .epw file.

## Usage

The notebook is structured in chronological order, where each heading is a step and below the step are its issues and process.

## Key Findings and Observations

- The most affective inputs to be used in Atlanta, GA are: min wind speed, avg bldg height, veg start/end month, vert horiz ratio, rural avg obstacle height, albedo of veg, and sens anthro heat.

# Steps

## 1. Test Run the UWG

- Clone the repository of the MIT UWG GitHub, and follow the instructions listed there. Test with the provided Singapore EPW file or download another one of your choice.

### Getting Started

1. Clone repository to local machine:
   
   ```
   git clone https://github.com/ladybug-tools/uwg
   ```
2. Install dependencies:
   
   ```
   cd uwg
   pip install -r dev-requirements.txt
   pip install -r requirements.txt
   ```
3. Run the scripts individually as needed.

### Issues

- There are over 60 parameters available for testing, however, the documentation does not provide an accurate measure of the range for input, and so it must be tested out manually. 
- The outputted EPW file requires a bit of cleaning, as the values of the vectors are shifted one to the left.

## 2. Sensitivity Analysis

### Process

For the Sobol sensitivity analysis, we define an objective function that takes in our parameters to measure the correlation coefficient and covariance. In this case, we went with measuring the RMSE value to simulated dry bulb temperature to the canyon temperature of the Georgia Tech Campus. Due to the design of the function, the more that the values differ from the actual, the more it would penalize the performance, leading to more accurate outputs. Within our final plotting, we see that our data tends to be normally distributed, which further supports the accuracy of the sensitivity analysis.

### Issues

- A chance for bias within dataset: Sobol sensitivity analysis generates a fixed amount of samples for a determined number of inputs. However, due to the combination restriction of the parameters (building density, tree cover, and grass cover), the sum of these three parameters must add up to less than or equal to 1.0. Because of this, we've decided to randomize each of the data views such that the sum of the three values meet this criteria. This may lead to bias as each of the samples have a set determined number of homogenous outputs.
- Due to the large test size of our samples (100,000), we resorted to using the campus HPC cluster to quickly receive the simulation output of the sensitivity analysis.

## 3. Data Collection

### Process

- A Grasshopper script was developed to collect the data based on the OSM coordinates of the 125m tile.
- The coordinates of the tile are inputted manually in GH to modify the bounding box and get the data of the specific lot.
- Ladybug in GH is used to get the wind speed.
- The spatial references of the trees cover, grass cover, buildings, and vert horiz ratio has been utilized to find the percentage of the parameters.
- Map Tiler: This tool allows us to input a specific geographic location and allows us to adjust the zoom level fitting to our region of interest within a bounding box. Then, it allows us to evenly partition the region into subsets of maps, all of which contain coordinates that can later be utilized within the Rhino 3D tool to fetch the data specific to that subset of our region of interest, which we would apply to the UWG to output simulations of more specific parts of the campus.

### Issues/Notes

- Map tiler uses Mercator tiling approach. Web Mercator projection using unique sets of coordinates to input the coordinates of each tile in the location in GH.
- Building heights are retrieved from FEMA.
- LiDAR is used to find the building height to area ratio.
- To avoid any issues, toggle the true or false instantly after getting each result or when making any changes.
- Due to .gh files, we are unable to simulate the campus into sufficiently small math tiles. Thus, we resorted to using the average values of the inputs parameters on the entire Georgia Tech campus. Many of these inputs, although impactful, were not easy to fetch data for. Examples include HVAC coefficient, urban boundary layer, and vegetation albedo coefficient.
- Upon retrieving the data from Rhino, input it into the parameters of the UWG parameter function, and adjust it accordingly for each part of the subset map tiles. For each of the outputted EPW file, utilize Grasshopper tool, or geopandas with a geojson file of campus, to display the diurnal, monthly, and yearly averages across each subset, forming a complete heat map.

## 4. Run Accurate UWG

### Process

To run the UWG tool:

1. Clone this directory and install the required dependencies. 
2. Make sure to have your desired location's EPW file in the directory. 
3. Each of the parameters have a specific range for their values of input, which can be viewed within the Parameters.py file. 
4. Upon running, the UWG will start simulating the desired parameter/conditions onto the location of the EPW file, and will output a new simulated EPW.

## 5. Useful Tool

### GT PACE ICE Cluster

PACE's Instructional Cluster Environment (ICE) offers an educational environment with opportunities to gain scientific computing experience.

To access:

1. Navigate to terminal and enter: `ssh gburdell3@login-ice.pace.gatech.edu`
2. Enter GT password at prompt 

## References

1. Mao, J., Norford, L.K. (2021). Urban Weather Generator: Physics-Based Microclimate Simulation for Performance-Oriented Urban Planning. In: Palme, M., Salvati, A. (eds) Urban Microclimate Modelling for Comfort and Energy Studies. Springer, Cham. https://doi.org/10.1007/978-3-030-65421-4_12

2. Harnessing cooling from urban trees: Interconnecting background climates, urban morphology, and tree traits, EGUsphere [preprint], https://doi.org/10.5194/egusphere-2024-234, 2024.

3. Bhatt MM, Gupta K, Danodia A, Chakroborty SD, Patel NR. Detailed urban roughness parametrization for anthropogenic heat flux estimation using earth observation data. Heliyon. 2023 Jul 17;9(7):e18361. doi: 10.1016/j.heliyon.2023.e18361. Erratum in: Heliyon. 2023 Sep 10;9(9):e19953. PMID: 37519678; PMCID: PMC10375860

---

## GNI Abstract

https://github.com/kastnerp/Abstract-GNI-Symposium-Microclimate

## GNI Data Processing

https://github.com/kastnerp/GNI-Microclimate-Paper
