# Pedestrian Environment Index (PEI) Documentation

<details>
<summary>Table of Contents</summary>

- [Pedestrian Environment Index (PEI) Documentation](#pedestrian-environment-index-pei-documentation)
  - [Project Overview](#project-overview)
    - [Core Subindices](#core-subindices)
  - [Implementation Workflow](#implementation-workflow)
  - [Detailed Index Methodologies](#detailed-index-methodologies)
    - [Commercial Density Index (CDI)](#commercial-density-index-cdi)
    - [Intersection Density Index (IDI)](#intersection-density-index-idi)
    - [Land Diversity Index (LDI)](#land-diversity-index-ldi)
    - [Population Density Index (PDI)](#population-density-index-pdi)
</details>

## Project Overview

The Pedestrian Environment Index (PEI) is a composite measure of walkability that combines four key subindices to evaluate pedestrian-friendly environments.

### Core Subindices

1. **Population Density Index (PDI)**
   - Measures residential population density within defined areas
   - Data sourced from Census block groups
   - Implementation: `PDI_generator.ipynb`

2. **Commercial Density Index (CDI)**
   - Evaluates density of commercial establishments per Block Group
   - Indicates availability of walkable destinations and services
   - Implementation: `CDI_generator.ipynb`

3. **Intersection Density Index (IDI)**
   - Quantifies intersection density within an area
   - Evaluates route options and pedestrian safety
   - Implementation: `IDI_generator.ipynb`

4. **Land-use Diversity Index (LDI)**
   - Analyzes mix of land-use types (residential, commercial, industrial)
   - Assesses environment walkability through land use diversity
   - Implementation: `LDI_generator.ipynb`

## Implementation Workflow

1. **Subindex Calculation**
   - Individual Jupyter notebooks (`*_generator.ipynb`) process Census block group shapefiles
   - Each generator computes its respective subindex score
   - Outputs saved as CSV or GeoJSON files

2. **PEI Compilation**
   - `PEI_generator.ipynb` combines subindex outputs
   - Computes final PEI score for each block group

3. **Visualization**
   - Results displayed as geographic maps
   - PEI scores visualized across census block groups

*Note: Project is transitioning to standardize all output files to GeoJSON format.*

## Detailed Index Methodologies

### Commercial Density Index (CDI)

#### Overview
Calculates amenity counts per block group, normalized against the region's maximum commercial density.

#### Input Data
- Source: `atl_bg.geojson`
- Contains Atlanta neighborhood data
- Uses OSMNx for amenity quantification

#### Amenity Categories
- **Groceries**: supermarket, convenience, grocery, food, organic
- **Restaurants**: restaurant, cafe, food_court, bistro, fast_food
- **Banks**: bank, atm
- **Schools**: school, college, university, kindergarten, music_school, language_school, driving_school
- **Entertainment**: cinema, theatre, nightclub, casino, arts_centre, sports_centre, stadium, amusement_arcade, dance, bowling_alley, attraction, theme_park, zoo
- **Parks**: recreation_ground, grass, greenfield

#### Output
Normalized commercial density values relative to regional maximum

### Intersection Density Index (IDI)

#### Overview
Analyzes intersection patterns within block groups to evaluate street connectivity.

#### Input Requirements
- GeoJSON file containing:
  - Block group geometries
  - State and county FIPS codes

#### Output Data (CSV)
- Polygon: Block group geometry
- Area: Block group area
- Intersection: Sum of intersection-connected roads
- IDI: Normalized intersection density value

#### Processing Steps
1. Read GeoJSON geometry data
2. Extract intersection data via OSMNx
3. Calculate equivalency factors
4. Compute population density
5. Generate visualization-ready output

### Land Diversity Index (LDI)

#### Overview
Evaluates land use diversity within block groups.

#### Input Requirements
- GeoJSON file containing:
  - Block group geometries
  - State and county FIPS codes

#### Output Data (CSV)
- Polygon: Block group geometry
- Land_use_dict: Land use type areas
- Entropy: Block entropy value
- LDI: Normalized land diversity value

#### Processing Steps
1. Extract GeoJSON geometry
2. Gather land use data via OSMNx
3. Calculate block entropy
4. Compute land diversity
5. Prepare visualization data

### Population Density Index (PDI)

#### Overview
Processes Census Bureau population data to calculate density metrics.

#### Input Requirements
- GeoDataFrame with:
  - Block group geometries
  - State/county FIPS codes
- Census API key (from parameter or `census_api_key.txt`)

#### Output Data (GeoDataFrame)
- POP: Block group population
- POPDENSITY: Persons per square kilometer
- NORMPOPDENSITY: Normalized population density

#### Processing Steps
1. Validate API credentials
2. Extract FIPS codes
3. Retrieve Census data
4. Integrate population data
5. Calculate density metrics
6. Clean and format output

#### Error Handling
Raises ValueError if Census API key is unavailable
