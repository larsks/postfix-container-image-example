FROM registry.access.redhat.com/ubi8/ubi

RUN yum -y install postfix \
	&& yum clean all

# This configures postfix using environment variables passed in to
# the container environment.
COPY postfix-init.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/postfix-init.sh"]
CMD ["/usr/sbin/postfix", "start-fg"]
