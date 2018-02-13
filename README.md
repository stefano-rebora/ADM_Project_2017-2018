# ADM_Project_2018-2018

## Author

* **Andrea Canepa - Stefano Rebora** - *Università degli studi di Genova - ADM 2017-2018*

The aim of this project is the design and the implementation of the distributed data management layer for
a remote patient monitoring service. We have choosen Cassandra as reference technology and we have relied 
on CQL for workload implementation.

## Project Structure
* src folder: contains the cql scripts for the schema creation and population
* workload folder: contains the cql scripts that implement the workload 
* datasets folder: contains the csv files used for population 
* documents folder: contains the pdf documents about the project

## Code instructions

* For the creation of the cluster, download and install the Cassandra Cluster Manager from here: https://github.com/riptano/ccm

* Create the cluster with the following commands:
	ccm create cluster_test -v 3.11.1
	ccm populate -n 6
	ccm start
	
* Open cqlsh from one node:
	ccm node1 cqlsh
	
* Run the script with the SOURCE command in the following order:
	1) schema.cql
	2) populate_DB.cql
	3) some workload scripts of your choice
 