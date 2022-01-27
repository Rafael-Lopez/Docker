# Specify a base image
FROM node

# Set the current working directory inside the container (where to execute these commands)
WORKDIR /app

# Specify which files to put into the container
# First param: path for the content to copy. In this case (.), all folders and files in this directory (excluding the Dockerfile)
# Second param: where to put the content inside the container. In this case, since we set WORKDIR to /app, 
# we could just use the current directory (.), but for clarity, we are using /app
COPY . /app

RUN npm install

# Remember, a container is an isolated environment. You need to expose ports if you want to make the container reachable from the outside.
# In this case, the containers running based on this image can be reached at port 80. This however, DOES NOT DO ANYTHING!
# From the official docs: 
# 
#      * The EXPOSE instruction does not actually publish the port. It functions as a type of documentation between the person   *
#      * who builds the image and the person who runs the container, about which ports are intended to be published. To actually *
#      * publish the port when running the container, use the -p flag on docker run to publish and map one or more ports, or the *
#      * -P flag to publish all exposed ports and map them to high-order ports.                                                  *
# 
# This means this instruction here is optional, but you SHOULD have it. It's a good practice.
EXPOSE 80

# Although this is valid, it's not what we want. RUN is used during the image creation process. Since an image is just a template,
#  we don't want to run the app when buidling the image. We do want to install node, install the dependencies, but that's it.
# RUN node server.js

# The difference between RUN and CMD is that, CDM is run when a container is started based on the image
CMD ["node", "server.js"]

# If you don't specify a CMD, the base image's CMD will be executed. If there's no base image nor CMD, you'd get an error