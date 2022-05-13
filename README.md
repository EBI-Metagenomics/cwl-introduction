# CWL Introduction

This repo has a very small CWL workflow for demonstration purposes.

## Requirements

- Python >=3.8
- Docker or Singularity
- Conda or a python virtualenv

## Setup

Create the conda env:

```bash
$ conda create -y -n cwl-intro python=3.8
$ conda activate cwl-intro
```

Or the python virtualenv:

```bash
$ python -m venv .venv
```

### Install CWL tool

```
$ pip install cwltool
```

### Test run

Run the completed|done workflow, add the `--singularity` if you have singularity installed.

```
$ cwltool [--singularity] --outdir results src_complete/workflow.cwl inputs/input.yml
```

### Hack away

The idea is to fix the issues in the `src_todo` folder. The .cwl files on that folder have a series of issues to fix before running it.

Hint:

```bash
$ cwltool --validate src_todo/workflow.cwl 
```