# sftsrvtest
This proyect was created with Terraform deploying the following infraestructure.

![image](https://user-images.githubusercontent.com/113218813/214489673-7d368545-9cf1-49c8-bb71-2465444905fc.png)

There are 3 steps to deploy the project and it needs to be executed in the following order:

- VPC
- VM1
- NLB

The files have some parts that are not parameterized, this could be a improve opportunity.

Additional, you can find the script.sh, a bash file to execute the 2nd part of the test, deploying the apache server and the webpage with Hello World.




