FROM node:14-alpine

WORKDIR /app

# CMD and ENTRYPOINT are kind of similar in the sense that they both execute the commands passed it to them.
# But there's a key difference: when using CMD, if we add a command after the image name on docker run, then 
# this command, overwrites the command specified in CMD - in the Dockerfile (if there is one).
# With ENTRYPOINT, that's different. For ENTRYPOINT, whatever you enter after your image name on docker run 
# is appended after the command(s) in ENTRYPOINT.

# Here, we specify npm. And now we can append any npm command after our image name. This ensures
# that only npm commands are executed with this image.
ENTRYPOINT [ "npm" ]