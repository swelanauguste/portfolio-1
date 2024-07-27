#!/bin/sh

# if [ "$DATABASE" = "postgres" ]
# then
#     echo "Waiting for postgres..."

#     while ! nc -z $SQL_HOST $SQL_PORT; do
#       sleep 0.1
#     done

#     echo "PostgreSQL started"
# fi


# python manage.py migrate
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser --username kingship --email kingship.lc@gmail.com --noinput

# python manage.py add_banks
# python manage.py add_fees
# python manage.py add_payees
# python manage.py add_issuers
# python manage.py add_dishonoured_reasons


python manage.py collectstatic --noinput

exec "$@"