#!/bin/bash
 
NAME="TileStache"                                 # Name of the application
DIR=/home/user/tilestache                         # Project directory
SOCKFILE=/home/user/tilestache/tilestache.sock    # we will communicte using this unix socket
USER=user                                         # the user to run as
GROUP=user                                        # the group to run as
NUM_WORKERS=4                                     # how many worker processes should Gunicorn spawn
 
echo "Starting $NAME as `whoami`"
 
# Activate the virtual environment
# cd $DJANGODIR
# source ../bin/activate
 
# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR
 
# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
cd $DIR
exec /usr/bin/gunicorn server:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --backlog=512 \
  --timeout 60 \
  --user=$USER --group=$GROUP \
  --log-level=info \
  --bind=unix:$SOCKFILE
