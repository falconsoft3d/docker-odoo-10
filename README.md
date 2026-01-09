# Docker Odoo 10.0
Como instalar Odoo version 10.0

# Instalar Docker Compose
```
apt-get update && apt-get upgrade -y
apt install docker-compose
```

Clonamos y levantamos Odoo
```
git clone https://github.com/falconsoft3d/docker-odoo-10.git
cd docker-odoo-10
docker-compose up -d
```

Reiniciamos el Docker
```
docker-compose restart odoo
```

Vemos los logs de Odoo
```
docker-compose logs -f odoo
```
