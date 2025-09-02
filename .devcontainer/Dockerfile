FROM python:3.11.6-slim-bullseye

RUN apt update
RUN apt install -y --no-install-recommends git
RUN apt-get install -y bash
RUN rm -rf /var/lib/apt/lists/*

# ENTRYPOINT ["/bin/bash", "-c"]
CMD ["bin/bash"]

# [Optional] If your requirements rarely change, uncomment this section to add them to the image.
# COPY requirements.txt /tmp/pip-tmp/
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#    && rm -rf /tmp/pip-tmp

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>



