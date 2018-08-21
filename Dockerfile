FROM busybox
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Environments
ENV VERSION "0.9.4-2"
ENV ARCHIVE "OpenCATS-${VERSION}-full.tar.gz"
ENV LINK "https://github.com/opencats/OpenCATS/releases/download/${VERSION}/${ARCHIVE}"
ENV OPENCATS "/opencats"

# Download OpenCATS
RUN \
    mkdir -p ${OPENCATS} \
    && cd ${OPENCATS} \
    && wget ${LINK} \
    && tar -xvzf ${ARCHIVE} \
    && rm -f ${ARCHIVE} \
    && ls -al ${OPENCATS}


# Change owner, group, and modes
RUN chown -R nobody:nogroup ${OPENCATS}
RUN chmod 777 ${OPENCATS} ${OPENCATS}/attachments ${OPENCATS}/config.php ${OPENCATS}/upload

# Declare volume
VOLUME ${OPENCATS}
