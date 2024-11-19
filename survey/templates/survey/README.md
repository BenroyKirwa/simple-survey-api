# SurveyMaster - The simple-survey-app

This repository contains the Static and template files for the simple survey application. This repository contains the client side of the application, the interface. Below is shown how to set up with the simple-survey-api repository to create the survey app on your own machine.

---

### Repository Contents by Project Task

| Tasks | Files | Description |
| ----- | ----- | ------ |
| 0. README  | [/survey/README.md](link) | Project details and instructions |
| 1. Home | [/survey/home.html](link) | Home page code for the survey app|
| 2. Log in | [/survey/login.html](link) | Page for log in of users for the app |
| 3. Sign up | [/survey/signup.html](link) | Page for new users to sign up to the app |
| 4. Base template | [/survey/base.html](link) | A template for the main site. Contains all common code for the template |
| 5. Show surveys | [/survey/survey_list.html](link)| Displays a list of surveys the are available to be answered |
| 6. Answer Survey | [/survey/survey_detail.html](link) | Displays the survey and survey questions, paginated |
| 7. Survey Summary | [/survey/survey_summary.html](link) | Displays a detailed summary of the answered survey |
| 8. Survey Responses | [/survey/survey_responses.html](link) | Displays all survey responses answered by a user filtered by page for each survey |


## General Use

1. Clone the repository.

2. Save the static and template to fit the structure below :
```
simple-survey-api/
├── sky_survey/                 
│   ├── settings.py             
│   ├── urls.py                 
│   └── ...
├── survey/                     
│   ├── templates/              
│   ├── static/                 
│   └── ...
├── venv/                       
├── requirements.txt            
├── README.md                   
└── db.sqlite3                  
```
3. Follow the instructions in the [simple-survey-api](link) to create the app.