FROM debian:stretch-slim

ENV KUBECTL_VERSION=1.16.9

RUN apt-get update && apt-get install -y wget && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN ["/bin/sh", "-c", "wget -O kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && mv kubectl /bin/kubectl && chmod +x /bin/kubectl"]

ENTRYPOINT ["/bin/kubectl"]
CMD ["--help"]
