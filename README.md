# Simple Survey API

This repository contains the backend API for the Simple Survey application. The API handles survey creation, response management, and user authentication. Follow the setup instructions below to get the API running on your local machine.

## Part 1: Project Setup

### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)
- virtualenv (recommended)
- MySQL Server 5.7 or higher
- MySQL Connector for Python

### Database Setup

1. Install MySQL Server if not already installed
```bash
# For Ubuntu/Debian
sudo apt-get update
sudo apt-get install mysql-server

# For macOS using Homebrew
brew install mysql

# For Windows
# Download and install MySQL from the official website
```

2. Start MySQL service
```bash
# For Ubuntu/Debian
sudo service mysql start

# For macOS
brew services start mysql

# For Windows
# MySQL service should start automatically
```

3. Create the database and user
```sql
# Log into MySQL as root
mysql -u root -p

# Create the database
CREATE DATABASE sky_survey_db;

# Create user and grant privileges
CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON sky_survey_db.* TO 'your_username'@'localhost';
FLUSH PRIVILEGES;
```

4. Configure database settings
- Open `sky_survey/settings.py`
- Locate the DATABASES configuration
- Update the credentials to match your setup:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'sky_survey_db',
        'USER': 'your_username',
        'PASSWORD': 'your_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

5. Install MySQL Python connector
```bash
pip install mysqlclient
```

### Setup Instructions
0. Copy the template and static files from [simple-survey-client](https://github.com/BenroyKirwa/simple-survey-client.git) to fit the file structure below

1. Clone the repository
```bash
git clone <repository-url>
cd simple-survey-api
```

2. Create and activate a virtual environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate
```

3. Install required dependencies
```bash
pip install -r requirements.txt
```

4. Set up the database
```bash
python manage.py makemigrations
python manage.py migrate
```

5. Create a superuser (admin)
```bash
python manage.py createsuperuser
```

6. Run the development server
```bash
python manage.py runserver
```
7. You can create your own survey from the admin page with the superuser created. The survey creation process should be easy
```
http:localhost:8000/admin
```

The API should now be running at `http://localhost:8000/`

### Project Structure
```
simple-survey-api/
│
├── sky_survey/                 
│   ├── __init__.py             
│   ├── settings.py             
│   ├── urls.py                 
│   ├── wsgi.py                 
│   ├── asgi.py                 
│   └── manage.py               
│
├── survey/                     
│   ├── migrations/             
│   │   └── __init__.py         
│   ├── templates/             
│   │   └── survey/
│   │       ├── base.html       
│   │       ├── survey_list.html 
│   │       └── survey_responses.html
│   ├── static/                 
│   │   ├── css/
│   │   │   └── styles.css      
│   │   ├── js/
│   │   │   └── scripts.js      
│   │   └── images/             
│   ├── admin.py                
│   ├── apps.py                 
│   ├── models.py              
│   ├── tests.py               
│   ├── urls.py                 
│   └── views.py                
│
├── venv/                       
│   ├── Scripts/               
│   └── site-packages/          
│
├── requirements.txt           
├── README.md                   
├── db.sqlite3                  
└── .gitignore                 

```

## Part 2: API Documentation

### API Endpoints

#### Authentication Endpoints
| Endpoint | Method | Description |
| -------- | ------ | ----------- |
| `/api/login/` | POST | User login |
| `/api/signup/` | POST | User registration |
| `/api/logout/` | POST | User logout |

#### Survey Endpoints
| Endpoint | Method | Description |
| -------- | ------ | ----------- |
| `/api/surveys/` | GET | List all surveys |
| `/api/surveys/` | POST | Create new survey |
| `/api/surveys/{id}/` | GET | Retrieve specific survey |
| `/api/surveys/{id}/` | PUT | Update survey |
| `/api/surveys/{id}/` | DELETE | Delete survey |

#### Question Endpoints
| Endpoint | Method | Description |
| -------- | ------ | ----------- |
| `/api/questions/` | GET | List all questions |
| `/api/questions/` | POST | Create new question |
| `/api/questions/{id}/` | GET | Retrieve specific question |
| `/api/questions/{id}/` | PUT | Update question |
| `/api/questions/{id}/` | DELETE | Delete question |

#### Option Endpoints
| Endpoint | Method | Description |
| -------- | ------ | ----------- |
| `/api/options/` | GET | List all options |
| `/api/options/` | POST | Create new option |
| `/api/options/{id}/` | GET | Retrieve specific option |
| `/api/options/{id}/` | PUT | Update option |
| `/api/options/{id}/` | DELETE | Delete option |

#### Response Endpoints
| Endpoint | Method | Description |
| -------- | ------ | ----------- |
| `/api/responses/` | GET | List all responses |
| `/api/responses/` | POST | Submit survey response |
| `/api/responses/{id}/` | GET | Retrieve specific response |

#### Response Detail Endpoints
| Endpoint | Method | Description |
| -------- | ------ | ----------- |
| `/api/response-details/` | GET | List all response details |
| `/api/response-details/` | POST | Create response detail |
| `/api/response-details/{id}/` | GET | Retrieve specific detail |

#### Certificate Endpoints
| Endpoint | Method | Description |
| -------- | ------ | ----------- |
| `/api/certificates/` | GET | List all certificates |
| `/api/certificates/` | POST | Upload certificate |
| `/api/certificates/{id}/` | GET | Retrieve specific certificate |

### Models

The API uses the following main models:

1. **Survey**
   - title (CharField)
   - description (TextField)

2. **Question**
   - survey (ForeignKey to Survey)
   - question_text (TextField)
   - type (CharField: short_text, long_text, choice, file)
   - is_required (BooleanField)
   - description (TextField)

3. **Option**
   - question (ForeignKey to Question)
   - option_text (CharField)
   - is_multiple (BooleanField)

4. **Response**
   - survey (ForeignKey to Survey)
   - user (ForeignKey to User)
   - submitted_at (DateTimeField)

5. **ResponseDetail**
   - response (ForeignKey to Response)
   - question (ForeignKey to Question)
   - answer_text (TextField)
   - answer_option (ForeignKey to Option)

6. **Certificate**
   - response (ForeignKey to Response)
   - question (ForeignKey to Question)
   - file_upload (FileField)
   - uploaded_at (DateTimeField)

### API Features
- Token-based authentication
- File upload support for certificates
- Pagination for list endpoints
- Nested serialization for complex data structures
- Comprehensive validation for all endpoints
- Support for multiple question types
- User response tracking and management

### Troubleshooting

#### Common Database Issues
1. If you get a MySQL connection error, verify:
   - MySQL service is running
   - Credentials in settings.py match your MySQL user
   - The database exists and user has proper permissions
   - MySQL connector is properly installed

2. For "Access denied" errors:
   - Double-check your MySQL user permissions
   - Ensure the password in settings.py matches
   - Try connecting to MySQL directly to verify credentials

3. For migration issues:
   - Make sure the database is empty before first migration
   - Check if all required MySQL dependencies are installed
   - Verify MySQL server version compatibility
