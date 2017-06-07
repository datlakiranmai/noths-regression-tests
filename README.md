# Notonthehighstreet Authentication E2E

**Set up**

1. Git clone https://github.com/notonthehighstreet/notonthehighstreet-end2end.git

2. Go to project directory from terminal i.e cd notonthehighstreet-end2end

3. Run **bundle install** this command will install all gems to the system that are listed in Gemfile as well as their dependencies.

4. From the same directory run any of the following cucumber test exceution command on desired QA environment.


**Execution Commands**: 

**Selenium  webdriver chrome profile**


To run the entire test suite

     ex ENV_ID="QA_ENV_NAME" cucumber -p e2e || ENV_ID="QA_ENV_NAME" cucumber -p rerun
            
To run an individual cucumber features   
 
     ex  ENV_ID="QA_ENV_NAME" cucumber --guess features/desktop/login.feature
   
To run an individual test scenarios

     ex ENV_ID="QA_ENV_NAME" cucumber features --guess --tag @1.01
     
     
   
**Selenium  webdriver mobile profile**
   
To run entire test suite
       
     ex ENV_ID="QA_ENV_NAME" cucumber --guess -p mobile || ENV_ID="QA_ENV_NAME" cucumber -p rerun
            
To run individual cucumber features   
    
      ex  ENV_ID="QA_ENV_NAME" cucumber --guess features/mobile/login.feature
      
To run individual test scenarios
   
       ex ENV_ID="QA_ENV_NAME" cucumber features --guess --tag @1.01
      
   
   

**Headless( NO GUI ) profile**

To run the entire test suite

    ex ENV_ID="QA_ENV_NAME" cucumber --guess -p headless || cucumber -p rerun
            
To run an individual cucumber features   
 
    ex  ENV_ID="QA_ENV_NAME" DRIVER="headless" cucumber --guess features/login.feature
   
To run an individual test scenarios

    ex ENV_ID="QA_ENV_NAME" DRIVER="headless" cucumber --guess features --guess --tag @1.01
      
**Possible Test failure causes:**
   
   1. Sporadic test failures might happen if QA Environment encounters bad gateway errors. 
   2. Headless profile has got couple of known test failures due to inconsistent redirection behaviour.
   3. Sporadic test failures might happen(rarely) due to race condition/driver issues. 
   
   *  --guess - We have 2 different step definitions(desktop and mobile) that are the same, Cucumber does not know which one to run. Using the --guess flag forces Cucumber to pick the most likely one. 
   The cucumber rake tasks use the --strict flag, and will fail if you have ambigious steps.
