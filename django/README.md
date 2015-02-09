#Django (unfinished)
Some config snippets and hints to get a django (https://www.djangoproject.com/) site up and running.

##Installation
You can either install django via packages or via pip within a python-virtualenv.

    pkg install nginx py27-pip py27-virtualenv bash
    # create some place for the python virtualenvs to live in ...
    mkdir /usr/local/share/virtualenvs
    cd /usr/local/share/virtualenvs
    # activate bash as shell to make virtualenvs prompts to show up
    bash
    # create virtualenv
    virtualenv django-project
    cd django-project
    source ./bin/activate
    # now your bash prompt will change and begin with (django project)
    pip install django gunicorn
    
    
After that you must create a virtualenv and activate it.

#Other resources
This is based on: http://www.jeffknupp.com/blog/2013/12/18/starting-a-django-16-project-the-right-way/
