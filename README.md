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
    - `robot -d ./reports/ ./tests/${TESTCASE_NAME}.robot`                     | Run with default web browser setting (Chromium Based)
    - `robot -d ./reports/ -v BROWSER:firefox ./tests/${TESTCASE_NAME}.robot`  | Run with other web browser (use 'firefox' or 'webkit' (Apple browser))
    - `robot -d ./reports/ -v HEADLESS:True -v BROWSER:firefox ./tests/${TESTCASE_NAME}.robot` | Run in different browser and HEADLESS mode

- With Docker
    - Build and run a docker container with `Dockerfile`
    - Copy test project to `/app/` directory with docker copy command
    - Run test file inside docker container (must use HEADLESS mode)
