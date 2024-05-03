# Pedestrian Environment Index (PEI) Project Overview

## Introduction and Overview

This project implements the Pedestrian Environment Index (PEI) methodology, a composite measure of walkability. It uses four key subindices:

- **Population Density Index (PDI):** Measures the density of residential population within a given area. Data for this index is derived from Census block groups  (_PDI_generator.ipynb_).
- **Commercial Density Index (CDI):** Calculates the density of commercial establishments in a Block Group, indicating the availability of destinations and services within walking distance (_CDI_generator.ipynb_).
- **Intersection Density Index (IDI):**  Measures the density of intersections within an area. Intersections can influence route options and pedestrian safety  (_IDI_generator.ipynb_).
- **Land-use Diversity Index (LDI):** Assesses the mix of different land-use types (e.g., residential, commercial, industrial) present. Diverse land uses often correspond with more walkable environments (_LDI_generator.ipynb_). 

## Workflow

1. **Subindex Calculation:** Each Jupyter Notebook file (`*_generator.ipynb`) processes a Census block group shapefile to compute its respective subindex score. The output is saved as either a CSV or GeoJSON file.
2. **PEI Compilation:**  The `PEI_generator.ipynb` notebook takes the outputs from the subindex generators and computes the final PEI score for each block group.
3. **Visualization:**  The results are presented as a map, visualizing the PEI scores across census block groups.

**Note:** To ensure consistency and ease of use, we are in the process of consolidating all output files into the GeoJSON format.

## Detailed Index Calculations and Methodologies

### Commercial Density Index (CDI)

#### Description

For this index, we gather the count of the different types of amenities in each block group. We then normalize the value by dividing each count by the greatest value for commercial density index within the region.

#### Parameters

- **atl_bg.geojson**: The data we are reading. This contains specific information about the neighborhood within Atlanta that we are researching. We will use OSMNx to calculate the quantity of each type of amenity.

#### Amenities & Tags Used

- **Groceries**: 'supermarket', 'convenience', 'grocery', 'food', 'organic'
- **Restaurants**: 'restaurant', 'cafe', 'food_court', 'bistro', 'fast_food'
- **Banks**: 'bank', 'atm'
- **Schools**: 'school', 'college', 'university', 'kindergarten', 'music_school', 'language_school', 'driving_school'
- **Entertainment**: 'cinema', 'theatre', 'nightclub', 'casino', 'arts_centre', 'sports_centre', 'stadium', 'amusement_arcade', 'dance', 'bowling_alley', 'attraction', 'theme_park', 'zoo'
- **Parks**: 'recreation_ground', 'grass', 'greenfield'

#### Returns

Value for the commercial density Index, normalized by the maximum commercial density within the area.

### Intersection Density Index Generator

#### Description

This Python script analyzes a GeoJSON file containing block group data, calculating the Intersection Density Index (IDI) for each block group. It outputs a CSV file detailing these IDI values, providing insights into intersection patterns within the analyzed area.

#### Parameters

- **GeoJSON file**: A GeoJSON file that must contain the block groups' geometries and the FIPS codes for the state and counties.

#### Returns

- **CSV file**: A new csv file is created, which contains columns from the geojson file as well as additional values collected for each block utilized in the IDI computation.
  - `Polygon`: the geometry of each block group
  - `Area`: The area of the block group
  - `Intersection`: Sum of the roads connected to an intersection in a block group.
  - `IDI`: The IDI value which is normalized IDI value for all the blocks.

#### Workflow

1. **Reading GeoJSON data**: Extracts the geometry of polygons from a file.
2. **Intersection Data Extraction**: OSMNX is used to extract intersection data for a specified block.
3. **Equivalency Factor Calculation**: The number of roads connecting each intersection in a polygon is determined, as is the total of the Equivalency factors of all intersections in a block.
4. **Population Density Calculation**: Calculates IDI per block by dividing equivalency factor sums by respective areas. Normalize all IDIs.
5. **return file**: generates a CSV with the data and IDI values required for creating visualizations in IDI_visualization.ipynb.

### Land Diversity Index Generator

#### Description

This Python script analyzes a GeoJSON file containing block group data, calculating the Land Diversity Index (LDI) for each block group. It outputs a CSV file detailing these LDI values, providing insights into diversity within the analyzed area.

#### Parameters

- **GeoJSON file**: A GeoJSON file that must contain the block groups' geometries and the FIPS codes for the state and counties.

#### Returns

- **CSV file**: A new csv file is created, which contains columns from the geojson file as well as additional values collected for each block utilized in the IDI computation.
  - `Polygon`: the geometry of each block group
  - `Land_use_dict`: A dictionary for each block with key as the land use type and the value being the area occupied by the land type.
  - `Entropy`: The entropy of a block
  - `LDI`: The LDI value which is normalized  with the maximum LDI value for all the blocks.

#### Workflow

1. **Reading GeoJSON data**: Extracts the geometry of polygons from a file.
2. **Land Use Data Extraction**: OSMNX is used to extract Land use data for a specified block.
3. **Entropy Calculation**: This is the first step of calculating LDI and the entropy is calculated for each block.
4. **Land Diversity Calculation**: Calculates LDI per block by normalizing the entropies of all the blocks
5. **return file**: generates a CSV with the data and LDI values required for creating visualizations in LDI_visualization.ipynb.

### Population Density Index Generator

#### Description

This function retrieves the population data for each block group within the given geographic areas from the U.S. Census Bureau's API and merges it with an existing GeoDataFrame containing block group geometries. The result includes added columns for population density and PDI (normalized population density relative to the maximum value in the dataset).

#### Parameters

- **census_gdf** (`GeoDataFrame`): A GeoDataFrame that must contain the block groups' geometries and the FIPS codes for the state and counties.
- **census_api_key** (`str`, optional): The API key for accessing the U.S. Census Bureau data. If not provided, the function will attempt to read it from a local file named `census_api_key.txt`. Census API keys may be generated at https://api.census.gov/data/key_signup.html.

#### Returns

- **GeoDataFrame**: The original GeoDataFrame is returned with additional columns:
  - `POP`: Population of the block group.
  - `POPDENSITY`: Population density of the block group in persons per square kilometer.
  - `NORMPOPDENSITY`: Normalized population density scaled by the maximum population density across all block groups.

#### Raises

- **ValueError**: If no API key is provided and it is also not found in the file `census_api_key.txt`, a `ValueError` is raised.

#### Workflow

1. **API Key Validation**: Checks for the presence of an API key either directly through the parameter or within a local file.
2. **FIPS Code Extraction**: Extracts the state and unique county FIPS codes from the GeoDataFrame.
3. **Census Data Retrieval**: Uses the Census API to fetch population data for each block group in the specified counties and state.
4. **Data Integration**: The fetched data is integrated into the original GeoDataFrame, converting population data to a usable format and creating new columns for population and population density.
5. **Population Density Calculation**: Calculates the population density and normalized population density, adding these metrics to the GeoDataFrame.
6. **Data Cleaning**: Cleans up the GeoDataFrame by removing unnecessary columns and ensuring proper indexing and geometry settings.

