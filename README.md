# Python-Template
I create this repository to help me with annoying tasks.

## Easy way to prepare an environment with python on Linux


### Install Conda
Install in temp folder. An easy way to delete files.

>``cd /tmp``  

Use curl to download file. Using to Download your program. Some peoples like to use miniconda.

> ``sudo apt install curl``  

Or install using [Link](https://docs.conda.io/en/latest/miniconda.html). (Recommend)  

> `` bash Anaconda3-2018.12-Linux-x86_64.sh``  

Run conda using prompt command.

> ``vim ~/.bashrc``  

Add at end of file. CHANGE <USER>.

> ``export PATH=/home/<USER>/anaconda3/bin:$PATH ``  

How update conda. This be helpeful to fix some bugs and found nice features.
> ``conda update --prefix /home/<USER>/anaconda3 anaconda``  

### Create environment

This will create environment with python 3. You can change as you like to python 2.
> ``conda create --name my_env python=3``  

Change your environment.

> ``source activate my_env``  

### Download and install pip
Use to manager all your package. 
> ``conda install pip``

### Create a list of packages installed

> ``conda env create -f environment.yml``

##### Troubleshoot
If you use certificate could be annoying use curl and conda.  
There is a way to repair this problem. You can set your certificate or ignore.