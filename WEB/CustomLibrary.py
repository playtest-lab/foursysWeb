from faker import Faker
import string
import random

def generate_sp_address_and_phone():
    fake = Faker('pt_BR')
    return {
        'street': fake.street_name(),
        'neighborhood': fake.bairro(),
        'city': 'São Paulo',
        'state': 'SP',
        'zipcode': fake.postcode(),
        'phone_number': fake.phone_number()
    }

def generate_password(length=12):
    fake = Faker()
    characters = string.ascii_letters + string.digits
    password = ''.join(random.choice(characters) for i in range(length))
    return password
    
