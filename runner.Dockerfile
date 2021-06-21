FROM registry.access.redhat.com/ubi8/ubi:latest


RUN dnf install -y git curl git-core && \
    curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_amd64.rpm" && \
    rpm -i gitlab-runner_amd64.rpm && \
    gitlab-runner --version
#ARG GITLAB_RUNNER_VERSION

ENV HOME=/home/gitlab-runner/

LABEL maintainer="Alexandre Carvalho da Silva<alexandre@gandhiva.io>" \
      version="latest" \
      io.openshift.tags="gitlab,ci,runner" \
      name="ocp-gitlab-runner" \
      io.k8s.display-name="GitLab runner" \
      summary="GitLab runner" \
      description="A GitLab runner image designed to work in OpenShift." \
      io.k8s.description="A GitLab runner image designed to work in OpenShift." \
      url="https://github.com/RedHatQE/ocp-gitlab-runner"
USER 1001
