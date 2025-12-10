# Author Stats

This is a little hobby project for analyzing ebook sales data across Amazon's KDP (Kindle Direct Publishing) and Draft 2 Digital. You could use the same principles to add data from other sources, also.

Essentially the project completes the following steps:
 * Reads raw data from the .csv and .xlsx exports and puts them in a duckdb database
 * Uses dbt to transform and model the data in another duckdb database
 * Runs data analysis in python to create a set of visualizations

## Project setup

Overall, the project setup takes an intermediate amount of python and SQL experience to set up. 

You'll want to create a virtual environment (venv) in the author_stats directory and install the necessary packages to that environment. You can check the import statements in the notebooks to see what all the relevant packages are.

You can then use your terminal and/or an IDE like VS Code to test the scripts and troubleshoot your instance.

*Note that dbt tends to have issues with the latest version of python. This project was created with python 3.12.6*

### Tools overview

**duckdb** is a tool that allows you to easily create local SQL databases. It's very straightforward to set up and call via python, and can transform large data locally with great performance. (We've got small data here, but it's a great tool!)

**dbt** stands for "data build tool" and it's a tool for data transformation. It has a lot of useful features, including a very robust infrastructure for model dependencies and data tests.

**Jupyter notebooks** add great visual features to the python experience, and are particularly well suited for this kind of analytics notebook.

### VS Code Extensions
It's possible to run this entire project within VS Code, including the Jupyter notebooks. The key extensions you'll need are:
* [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
* [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
* [Power User for dbt](https://marketplace.visualstudio.com/items?itemName=innoverio.vscode-dbt-power-user)

Other helpful extensions:
* [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)

## The Notebooks

 `author_db_pipeline` creates or updates the two databases, raw_db and model_db
 * Read files on disc
 * save to raw_db
 * run the dbt project
 * \> seed
 * \> run
 * \> test

`author_notebook` connects to the model_db and runs a series of queries to create helpful charts
* connect to the duckdb model_db
* query the db
* analyze those queries and create charts


## Tips and troubleshooting

### Using your own Books seed

You can create a fork of this project in order to update the `seed__books` file with your own books and benefit from git version control for your own changes.

Creating a fork also allows you to merge in updates from the main version of the project, if you want.

### File not found issues

If you're getting errors that report files can't be found, you can add the following to a code cell anywhere to fetch and print the current working directory:

```
dir = os.getcwd()
print(dir)
```

### Database file is locked
Make sure to run the 'close' command in `author_notebook` to close the analytics connection before you run dbt. 

If dbt is the one keeping the lock on the duckdb files, make sure `keep_open: false` is specified in your profiles.yml