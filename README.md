# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# poolfolio

### Master Plan
    https://docs.google.com/document/d/1evWD6qk7TEPbiDrTsSlK1oq_qJj6Bc8PHwp7SZ4WLc4/edit?usp=sharing
    
### Deployment Instructions
Access EC2 instance: 
```
ssh -i poolfolio.pem poolfolio@ec2-52-35-41-146.us-west-2.compute.amazonaws.com
```
Deploy to Elastic Beanstalk once inside EC2 instance using alias: 
```
cd poolfolio
ebstart
```
    
### Team Members:
    Pierson Marks, pmarks98, ![Pierson Marks Photo](profileimg/piersonmarks.png)
    Hanyao Liu, liuhanyao98, ![Hanyao Liu Photo](profileimg/HanyaoLiu.jpeg)
    Jack Zhang, dvorjackz, ![Jack Zhang Photo](profileimg/jackzhang.jpg)
    Nikita Lukyanenko, nikita1923666, ![Nikita Lukyanenko Photo](profileimg/nikita.jpg)
