# Segregation in the 15-Minute City

## Introduction
This notebook focuses on the concept of the 15-minute city and investigates segregation on a basis of mobility. 15-minute usage is defined as the proportion of consumption-related trips made within a 15-minute walk from a home. 15-minute access defines the number of essential amenities within the 15-minute walk from a home. Segregation is examined within this context to measure and assess the distribution of amenities within urban areas.

## Notebook Summary
This program includes procedures for loading, analyzing, processing, then modeling mobility and segregation density within a defined 15-minute city. The process includes:
1. Data loading and initial analyze.
2. Define 15-minute city parameters for given dataset.
3. Identifying data file tags to define residents, streets, amenities, and places of work.
4. Calculate routes between coordinates of residents and amenities through shortest path profile.
5. Project grid points to routes.
6. Estimate populations in provided buildings.
7. Interpret relations between routes and intersection density (segregation) with populations weighted.
8. Calculate and model final data normalized with heatmap through Grasshopper and Rhino.

## Usage
The notebook is structured to be followed sequentially. Detailed comments and markdown notes provide guidance through each step of the analysis and modeling process.

![image](https://github.com/VIP-SMUR/wiki/assets/80086242/42125dde-0ed8-4f24-8647-b76ec7fe20c2)

## Models and Algorithms Used
- **Kernel Densities**
- **Space-Time Prisms**
- **Volumetric Population Estimation**
- **Vehicle Profile Routing (Itinero)**

## Data Description
Densities for segregation are calculated and output through the heatmap weighted by population. In Rhino, the heatmap overlayed a segment of data from OSM will display darker blue for larger density and red for lowest.

## Key Findings and Observations
- Kernel densities allow for a simple calculation of segregation under the definition of interaction between pedestrians in a defined 15-minute city
- Volumetric Method with building area, building height, and census population provides general estimate for populations with data from https://opendata.atlantaregional.com/
- Potential for interaction is best calculated through space-time prisms in which are more accurately representing spatial and temporal dynamics and constraints
- Increased local usage correlates with higher experienced segregation for low-income residents.

## Conclusions
This notebook serves as a detailed example of using methods within activity spaces and provided data to calculate segregation values for a 15-minute city. The methodologies outlined here can be adapted and expanded for other types of assessment for pedestrian mobility and accessibility.

## References
- Abbiasov, et al. (2024) The 15-minute city quantified using human mobility data.
- Patterson & Farber (2015) Potential Path Areas and Activity Spaces in Application: A Review
- Schönfelder (2002) Measuring the size and structure of human activity spaces: The longitudinal perspective.


# Itinero
## Overview
Itinero is a flexible open-source routing engine for a variety of transportation modes such as walking, cycling, and driving. It provides sophisticated tools to integrate customizable routing solutions into their applications, enabling efficient navigation. Itinero emphasizes versatility, offering support for various map data formats and allowing customization to suit specific needs. Most importantly, features like offline routing and routing across multiple transportation modes are provided.

## Repository
[Itinero Routing]( https://github.com/itinero/routing)

## Features
- **Routing**: The Router uses the RouterDb data to calculate routes for a given Profile. It starts and ends the Route at a RouterPoint.
•	RouterDb: Contains the routing network, all meta-data, restrictions and so on.
•	Profile: Defines vehicles and their behaviour.
•	RouterPoint: A location on the routing network to use as a start or endpoint of a route.
•	Router: The router is where you ask for routes.
- **GeoJSON Conversion**: Export calculated routing to GeoJSON for use in mapping and other geospatial applications.
- **Open Street Maps Data Retrieval**: Automatically download street and building data required for demand calculations.

## Getting Started
To start using Itinero, follow these steps:
1. Install following Itinero packages to .NET project:
  •	Itinero: The Itinero routing core, this is usually the only package you need to install.
  •	Itinero.Geo: This package ensures compatibility with NTS.
  •	Itinero.IO.Osm: This package contains code to load OSM data.
  •	Itinero.IO.Shape: This package contains code to load data from shapefiles.
2. Specify OSM file as needed
3. Run project through determined routing coordinates

## Data Requirements
- Street data should include either OSM or FEMA tag attributes for project defined amenities and places of work

## Credits
https://www.itinero.tech/
Itinero is open-source and commercially supported, developed by the Itinero BVBA team.
Itinero was built using OpenStreetMap

# Future Work
•	Integrate temporal layer to find effective rates of encounter.
•	Generate daily routines to represent more realistic behavior.
•	Normalization of results to allow comparisons across sites with different total populations.

