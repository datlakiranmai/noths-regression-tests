# Notonthehighstreet Authentication E2E

**Set up**

1. Git clone https://github.com/notonthehighstreet/notonthehighstreet-end2end.git

2. Go to project directory from terminal i.e cd notonthehighstreet-end2end

3. Run **bundle install** this command will install all gems to the system that are listed in Gemfile as well as their dependencies.

4. From the same directory run any of the following cucumber test exceution command on desired QA environment.


**Execution Commands**: 

**Selenium  webdriver chrome profile**

To run entire test suite
    
     ex ENV_ID="QA_ENV_NAME" cucumber -p e2e || cucumber -p rerun
         
To run individual cucumber features   
 
   ex  ENV_ID="QA_ENV_NAME" cucumber features/login.feature
   
To run individual test scenarios

   ex ENV_ID="QA_ENV_NAME" cucumber features --tag @1.01
   
   

**Headless( NO GUI ) profile**

To run entire test suite

    ex ENV_ID="QA_ENV_NAME" cucumber -p headless || cucumber -p rerun
            
To run individual cucumber features   
 
   ex  ENV_ID="QA_ENV_NAME" DRIVER="headless" cucumber features/login.feature
   
To run individual test scenarios

   ex ENV_ID="QA_ENV_NAME" DRIVER="headless" cucumber features --tag @1.01
   
   
**Possible Test failure causes:**
   
   1. Sporadic test failures might happen if QA Environment encounters bad gateway errors. 
 