FROM spliceprep.azurecr.io/spliceprep-micromamba:0.0.0
# This assumes that the requirements file is at top level with the Dockerfile
ARG requirements
ADD $requirements ./
RUN micromamba install -y -n base -f requirements.txt && micromamba clean --all --yes
CMD CMD ["bash", "-c", "$AZ_BATCH_NODE_STARTUP_WORKING_DIR/spliceprep-jobs/docker_entry_point.sh"]
