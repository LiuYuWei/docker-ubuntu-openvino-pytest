FROM openvino/ubuntu18_runtime

USER root

#Setting timezone
ENV TZ Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# Install npm package
RUN apt-get update \
    && apt-get install -y \
    tzdata \
    libgtk-3-dev \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt autoremove -y \
    && apt autoclean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV APP_HOME=/tmp/
RUN mkdir -p $APP_HOME

COPY ./requirements.txt $APP_HOME/requirements.txt
RUN pip3 --no-cache-dir install -r $APP_HOME/requirements.txt
RUN rm -f -r $APP_HOME