FROM --platform=linux/amd64 odoo:10.0

USER root

# Configurar repositorios de archivo de Debian Jessie
RUN rm -rf /etc/apt/sources.list.d/* && \
    echo "deb [trusted=yes] http://archive.debian.org/debian/ jessie main" > /etc/apt/sources.list && \
    echo "deb [trusted=yes] http://archive.debian.org/debian-security/ jessie/updates main" >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid-until

# (Opcional pero útil en Python2): fija pip/setuptools compatibles
RUN python -m pip install -U "pip==20.3.4" "setuptools<45" "wheel<0.35"

# Dependencias del sistema para compilar paquetes típicos (sin tocar libpq)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    python-dev \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libjpeg-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    libtiff5-dev \
    libwebp-dev \
    libldap2-dev \
    libsasl2-dev \
    swig \
    libusb-1.0-0-dev \
    tidy \
    git \
 && rm -rf /var/lib/apt/lists/*

# Instala tus librerías Python
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --ignore-installed -r /tmp/requirements.txt

USER odoo