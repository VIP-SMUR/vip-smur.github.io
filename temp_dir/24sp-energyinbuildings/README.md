# Multivariate Regression of Energy Consumption

## Introduction

This notebook is part of the repository 'Optimization of Building Energy Consumption' aimed at using machine learning models to optimize building design parameters to minimize energy consumption for heating and cooling. This notebook focuses on multivariate regression to predict both heating and cooling energy loads based on building design parameters.

## Repository Overview

- **Repository**: [Optimization of Building Energy Consumption](https://github.com/tstran155/Optimization-of-building-energy-consumption)
- **File**: Notebook1B_Multivariate_regression_heating_cooling_load_final.ipynb

## Notebook Summary

This notebook includes comprehensive steps for preprocessing, analyzing, and modeling building energy data with the goal of predicting heating and cooling loads. The process includes:

1. Data loading and initial exploration.
2. Descriptive statistics to understand the dataset.
3. Data visualization to infer relationships and data distribution.
4. Data cleaning and transformation to prepare for modeling.
5. Model building using various machine learning techniques including Linear Regression, KNN, Support Vector Machine, and a neural network model using Keras.
6. Evaluation of models using cross-validation and comparison based on mean squared error.
7. Final model selection and saving the model for future use.

## Usage

The notebook is structured to be followed sequentially. Detailed comments and markdown notes provide guidance through each step of the analysis and modeling process.

## Models and Algorithms Used

- **Linear Regression**
- **Random Forest**
- **KNN (K-Nearest Neighbors)**
- **Support Vector Machine (SVM)**
- **Neural Networks (Keras Sequential Model)**

The notebook also discusses the use of early stopping in neural network training to prevent overfitting and improve model generalization.

## Data Description

The dataset used (`EPB_data.csv`) includes various building parameters such as orientation, area, and glazing area among others, and the target variables are 'Heating Load' and 'Cooling Load'.

## Key Findings and Observations

- Multivariate regression can effectively predict energy consumption when appropriate preprocessing and feature engineering are applied.
- The Random Forest algorithm showed superior performance in predicting the energy loads compared to other models.
- Neural Networks provided competitive results, highlighting their potential in complex regression tasks.

## Conclusions

This notebook serves as a detailed example of using statistical and machine learning methods to predict building energy consumption. The methodologies outlined here can be adapted and expanded for other types of predictive modeling tasks within the building energy domain.

## References

- Tsanas, A. and Xifara, A. (2012). Accurate quantitative estimation of energy performance of residential buildings using statistical machine learning tools. Energy and Buildings, 49, 560-567. DOI: [10.1016/j.enbuild.2012.03.003](https://doi.org/10.1016/j.enbuild.2012.03.003)

---

# Demand Ninja - Energy Demand Forecasting Model

## Overview

Demand Ninja is a sophisticated tool that provides hourly energy demand forecasts based on environmental data and building characteristics. It employs advanced algorithms and machine learning techniques to predict heating and cooling needs with high accuracy.

## Repository Structure

The repository consists of several Python scripts each designed to perform specific roles in the data processing and forecasting pipeline:

### Core Scripts

- `core.py`: Contains the primary logic for calculating energy demands based on the Building-Adjusted Internal Temperature (BAIT) model.
- `demand_ninja_example.py`: Demonstrates how to use the Demand Ninja model to compute energy demand using custom input data.
- `geo_json_file.py`: Converts processed energy demand data into GeoJSON format for easy integration with geospatial applications.
- `test_download.py`: Automates the downloading of EPW files for various locations using API calls.
- `epw_to_dataframe.py`: Consolidates key weather parameters from multiple EPW files into a single CSV file for easier analysis.
- `clean_weather_with_demand.py`: Cleans and preprocesses weather data combined with demand forecasts to prepare for analysis.
- `aggregate_data.py`: Processes and aggregates weather and energy demand data by geographic coordinates.

## Features

- **Energy Demand Forecasting**: Utilize historical weather data and building parameters to forecast energy needs.
- **Data Enrichment**: Enhance your datasets with calculated energy demand metrics to aid in further analyses or model training.
- **GeoJSON Conversion**: Export your enriched datasets to GeoJSON for use in mapping and other geospatial applications.
- **Automated Data Retrieval**: Automatically download weather data required for demand calculations.

## Getting Started

To start using the Demand Ninja scripts, follow these steps:

1. Clone the repository to your local machine.
2. Ensure that all dependencies are installed via `pip install -r requirements.txt` (ensure you have this file configured based on the scripts needs).
3. Run the scripts individually as needed:
   
   ```bash
   python demand_ninja_example.py
   python clean_weather_with_demand.py
   python geo_json_file.py
   ```

## Data Requirements

Each script is designed to be modular but certain data standards must be maintained for seamless functionality:

- Weather data should include key metrics like temperature, humidity, wind speed, and radiation levels.

## Credits

Demand Ninja was developed by the Renewables Ninja team, including notable contributions from Iain Staffell, Stefan Pfenninger, and Nathan Johnson.

---

# Rank 5 of ASHRAE Great Energy Predictor III (GEPIII)

## Overview

We refer to "rank 5" as the 5th winning solution of the [ASHRAE Great Energy Predictor III (GEPIII)](https://www.kaggle.com/c/ashrae-energy-prediction) contest which is hosted on Kaggle. We originally were working on 'rank 1', or the highets ranked solution but decided to first go through 'rank 5' as it had a much quicker time to complete with not as much difference compared to 'rank 1'. Accorrding to ASHRAE, "This competition's overall objective was to find the most accurate modeling solutions for the prediction of over 41 million private and public test data points." There are many models within the solutions, with many libraries and a need to run on a very, very fast computers. We used GaTech's PACE system to run these jobs. 

### Rank 5 GitHub Tutorial

- [Rank 5 Kaggle Documentation](https://www.kaggle.com/c/ashrae-energy-prediction/discussion/127086)
- [Rank 5 Github Walkthrough](https://github.com/buds-lab/ashrae-great-energy-predictor-3-solution-analysis/tree/master/solutions/rank-5)

### Directory Structure

- `model`: - trained model binary files
- `output`: - model predictions and the final submission file
- `train_code`: - code to train models from scratch
- `predict_code`: - code to generate predictions from model binaries
- `ensemble_code`: - code to ensemble the predictions
- `preproceeding_code`: - code to pre-process the data
- `prepare_data`: - pre-processed data files
- `external_data`: - external files required by this solution such as leak data
- `requirements.txt`: - python package dependencies
- `SETTINGS.json`: - a json configuration file

## Issues with Rank 5

There were many issues running Rank 5, here are some of them and possible solutions:

1. When running on PACE, using sudo is not allowed without special permissions. Hence getting git installed would be hard to do. Instead for ease, just download the files and use PACE ICE onDemand and upload the files onto the instance machine directly, without using git.
2. The requirements file has a LOT of libraries, many which are outdated and will give compilation errors. You will have to see which ones would work, and whenever an error occurs pip install seperatley and keep running the file. This is tedious. An issue that isnt resolved yet is the complilation problems with the Cython libraries with pandas and others.
3. The GitHub will ask to make a virtual environment using myenv. In PACE you should use [Ananconda](https://gatech.service-now.com/home?id=kb_article_view&sysparm_article=KB0041621), which comes along with it.
4. Kaggle API is a bit different with the outdated version of this Kaggle competition. Ther emay be multiple times where you have to uninstall kaggle and reinstall it. [Scroll down here](https://github.com/Kaggle/kaggle-api/issues/29). Issues occurs where the files for Kaggle are not aligned with the process of getting training data. So you would have to download the training data and upload it onto PACE.
5. There was an issue uploading the training files onto PACE, as it keeps giving an error that it cant upload half of the files. Will have to figure this one out later.
