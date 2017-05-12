# Notonthehighstreet Authentication E2E

**Set up**

1. Git clone https://github.com/notonthehighstreet/notonthehighstreet-end2end.git

2. Go to project directory from terminal i.e cd notonthehighstreet-end2end

3. Run **bundle install** this command will install all gems to the system that are listed in Gemfile as well as their dependencies.

4. From the same directory run any of the following cucumber test exceution command on desired QA environment.


**Execution Commands**: 

**Selenium  webdriver chrome profile**

To run the entire test suite

    ENV_ID="QA_ENV_NAME" cucumber features/ --tag ~@wip
            
To run an individual cucumber features   
 
   ex  ENV_ID="QA_ENV_NAME" cucumber features/login.feature
   
To run an individual test scenarios

   ex ENV_ID="QA_ENV_NAME" cucumber features --tag @1.01
   
   

**Headless( NO GUI ) profile**
To run the entire test suite

    ENV_ID="QA_ENV_NAME" DRIVER="headless" cucumber features/ --tag ~@wip
            
To run an individual cucumber features   
 
   ex  ENV_ID="QA_ENV_NAME" DRIVER="headless" cucumber features/login.feature
   
To run an individual test scenarios

   ex ENV_ID="QA_ENV_NAME" DRIVER="headless" cucumber features --tag @1.01