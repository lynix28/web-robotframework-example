# web-robotframework-example
Web automation testing example project using Robot Framework

- Requirements
    - Python 3
    - NodeJS 12 or later

- Setup Virtual ENV
    - Install venv
        - `pip install virtualenv`
        - `virtualenv ${PROJECT_FOLDER}/venv`
    - Activate venv
        - `source ${PROJECT_FOLDER}/venv/bin/activate`

- Install Dependencies
    - `pip install -r requirement.txt`
    - `rfbrowser init`

- Run File Test (Example)
    - Create `reports` directory
    - Run all test
        - `robot -d ./reports/ ./tests/.`
    - Run test by Tag
        - `robot -d ./reports/ -i "Sanity Test" ./tests/.`
    - Run specific Testcase
        - `robot -d ./reports/ ./tests/${TESTCASE_NAME}.robot`
    - Run with specific web browser (available browser: Chromium, Firefox, Webkit)(Default browser is Chromium)
        - `robot -d ./reports/ -v BROWSER:firefox ./tests/${TESTCASE_NAME}.robot`
    - Run HEADLESS mode
        - `robot -d ./reports/ -v HEADLESS:True -v BROWSER:firefox ./tests/${TESTCASE_NAME}.robot`
- With Docker
    - Build and run a docker container with `Dockerfile`
    - Copy test project to `/app/` directory with docker copy command
    - Run test file inside docker container (must use HEADLESS mode)
