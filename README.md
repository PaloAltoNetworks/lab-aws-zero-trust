![](https://lh6.googleusercontent.com/X6oOme2LltwAWHYXXhOD_-Ghm2MVYklyNNXfn1u5iKgO1otHIJicZhNplLasCRi83D-pPMFtIxB-MTjC86MCtly45nn4ZtlroqUDjEMNo9ch6RwD8e1Z92mJ75zhg5nXOEPdGdShP3uXAYQB0A)

![](https://lh4.googleusercontent.com/Fs7lRwjN44Y65LvcBAUJeKT0Fcn3hUf5dquMEiBba8eHLdq4csdCcTvFKJmc9ZRQDohRlGkPa3j9lJc-wwSFqoAELUD9OHn5a8sMgoP3aEoRTBQlVnE9PzWl0E2PmGGBEgoH_0tciKxWCU9HzQ)

# Zero Trust AWS GWLB QwikLab Guide

# Overview

The goal of this workshop is to take you through a deployment scenario where the Palo Alto Networks VM-Series firewall is deployed on an AWS environment. We will discuss design scenarios leveraging the AWS Gateway Load balancer. This workshop will demonstrate a use case that involves deploying Zero Trust Policies on VM-Series Virtual Next-Generation Firewall (NGFW) to protect your applications against various attacks.

## Hands-On Lab – Zero Trust Exercise Summary

![](https://lh3.googleusercontent.com/ELq0Hz2A7_Kz4WsGBW9H4HiLIsmgYg8wRPn20aGgJBaJzZtw8Ae4ILUk7jGrZ_uoA1cOIZWWD7QlKfmYu09Y2CGx5i7r13D7xBZsme8fJmPZB8bv4YQZqFUsGu28A1o-VfwXTWQrB3b3apBpjA)

As part of this workshop, you will be deploying security services on Palo Alto VM-Series Virtual Firewalls to protect your virtual application environment against the Log4j attack.  You will follow best practice recommendations to deploy a tiered protection against Log4j and similar attacks with the VM-Series NGFW.

A Zero Trust implementation should provide security administrators with the visibility and the ability to secure traffic between the various applications. 

## Hands-On Lab – Palo Alto Networks Product Coverage

- **[VM-Series Virtual Next-Generation Firewalls](https://www.paloaltonetworks.com/prisma/vm-series)**

  - Protect Private Cloud investments
  - Safeguard cloud and virtualized investments with the virtual firewall that pays for itself. VM-Series NGFWs are built for high performance and significant ROI.
  - Detect hard-to-find threats, Stop outbound traffic exfiltration, Protect against lateral movement

- **[Panorama™](https://www.paloaltonetworks.com/network-security/panorama)**

  - Consolidate policy management. Panorama™ network security management simplifies policies across infrastructures and clouds. Seamless integration. Increased oversight.
  - Panorama can be deployed as a virtual appliance on VMware ESXi™ and vCloud<sup>®</sup> Air, Linux KVM, and Microsoft Hyper-V<sup>®</sup>.

# Application Environment Overview

![](https://lh3.googleusercontent.com/I0SaCbiLPocLqiwH8xEBhwFRo4RMmya_kH0gJCBQhKd18jcsVTv8IUY-eGMR3bg1cKGl2fqK1qfEaMD-eivpllEBHk-dEx2Licy48slA6Daqiqpmbub7dNnPB6rM0PDQAkO5MBXLYmAOMwZ3MQ)

**Figure:** Hands on Lab Environment – Achieving Zero Trust Security

For this workshop, we have pre-deployed some components for you.  You will see a VM-Series, Panorama and an Application Virtual Machine and an Attacker VM pre-deployed.  

## What You'll Do

- Use Zero Trust Policy on VM-Series to protect your application against Log4j attack 
- Use Panorama to apply Zero Trust Policy on VM-Series NGFWs
- Use Panorama to Monitor Logs to see Security activity

## Launch the lab environment

In this section, we will launch the lab environment. These are the steps that we will accomplish at this time.

- Start the lab on your designated Qwiklab account.
- Login to the AWS Console using the provided credentials and set up  IAM roles
- Subscribe to the Palo Alto Networks VM-Series PAYG and Panorama appliances on the AWS Marketplace.
- Deploy lab environment using Terraform

## Start qwiklabs lab environment and login to AWS

1. Log in to the [Qwiklabs portal](https://paloaltonetworks.qwiklabs.com) and click on the "Zero Trust AWS GWLB lab" on the home page. If you do not have access to the lab, please reach out to the lab instructor to get the access.
2. On the Qwiklab environment, Click on _Start Lab_ Button to start the lab.

![](https://lh4.googleusercontent.com/wXAOGK-7HvYZu-lbXJxHydwjSFSJk81MhhkU1DRAOXxInW0yCmVFFyL0ehuoESNBx1wFcFO7EttbnZwYDi6mah4ktoB3xIxjvrfa14j2RoWlNKIvcu60SqPobl5kayN-cbcHZ8a2wzG3BA6XNg)

> At this point, Qwiklabs will build an AWS account for you. You will find the login credentials for accessing the AWS account under the _Open Console_ button as shown below.

![](https://lh4.googleusercontent.com/7IyzN9RWDQHAZ8DvZBy4PbBAhE2l4hiF_CblBNlnikOA2F9AhMacXS-KD9_3tHnRMIudde2SeniSgmW5lNRQEXJCUl-EyI7IK3pmMP9ZBGpVPbEaCvlN6MP92BJOKH4Ae6yFvIIwkT7HPqeJlw)

3. To login to the AWS environment, right click on “Open Console’ and “Open link in Incognito window” for Chrome-based browsers. For other browsers, use the appropriate option to open the AWS Console in a new private tab.

![](https://lh5.googleusercontent.com/u8LCI-tSfVhU1Fg4l23EneOJi-JK0e-yLyzFXugqaXRGkyWZ31gSvLZHKm92qGd-auzmU19QK0y2M5JlhNCxeiwAnulKoKwq8GM3i45fQo8AfQwvUS8Zpj0ek9aF027ZNdg7vF84t1IRvBwX1g)

4. On the AWS Console, copy over the IAM username and password from the Qwiklabs page.

![](https://lh5.googleusercontent.com/LI7p5mG_IUeGfyPLrWMmxy72Xw8oBUCJzlo3uzJifLJcyBnjP_SzEhjmqR6xkiDPh9_SNwjLB8Ek9b6lCSdAnIg3-un04zIYi8zj-IWT6aGLrRr5F2fzTZefghlgmaeweQIaukx1w2EY8TKhVQ)

5. Now, click on “Sign In”.

![](https://lh5.googleusercontent.com/u1cgHNrL2zQ-kooD_pzqZ8Ygop3KA-ZFhQgdGfyb_DyJV6mIf7aHssQ29r-uIb_UwzHdEQUxIVf3kPJ2aEckPbBwV_pdgnIksXZMqoYRpEtWLNphPCjjwtbfg2IK1dcGX1eOihSvLMU2Ui8-vA)

> Once you are successfully logged in, you will land on the AWS Management Console.

![](https://lh4.googleusercontent.com/MpWh_LbaK7MU6xXNDjN1P5AGT40aKYkVNckzdYuw4KLH85WSQjYaNoWfJ-BG6cxDnc2O15cLK8TTAaWoKxFz8SjxObwldCEm8loFweK0wssoR3Qsw0LIONS78QIg00HLt68l09SrZZCNlvMQEw)

**Figure:** The AWS Management Console

## Set up AWS Account permissions

As mentioned earlier, the Qwiklab user account, by default, does not have the permissions to AWS Marketplace and CloudShell services, which are required for the purpose of this lab. We will now edit the permissions for the Qwiklab user account to provide access to those services.

6. On the AWS console, in the search bar at the top, type ‘iam’.
7. Click on the link to _IAM_. A new IAM dashboard window will open.

![](https://lh4.googleusercontent.com/llSjjavSVh874tqUmkaqTU-gG_GQ9iVgh2FQf0KfrpFgIdPRMVbiIhSn2-oEnFeeEyvl6EzQ3yONzoFwEa8M8F8ffVZ93Uy7ipAG47WSZyTLQ6izcaSLS_VD-svJtDvDGKWdJ91SWxr57Cp19Q)

8. From the left menu, select _Users_ and from the list of users displayed, click on _awsstudent_.

![](https://lh4.googleusercontent.com/XyoxfrWRWGaSg2tpOUKZdgTg8U1sDfHc83ccr9DlxY2A60MgvJH7rq_JvmeYWu-JzAtOXu1R6QumGgg1NKV2FXY3R7uaRbqJDp9ITTjDJKQyBl1ypv5KLDrJfIV1zjDZ1RDa_pt-B0bQ6xK_Fg)

9. Under _Permissions policies_, Click on _default policy_ to edit the default permissions policy.

![](https://lh3.googleusercontent.com/5dQEsGypkstWrkdHghFpjD90zjtbTiT2USfqvvgS9pBawnZPxoEoP_EavEBnNzt6gvSvTr8wPO33p-Q1noLXbPbugGZow2mIYxYVC5IOHhYTVaMpIw3yQQm2a2Ie7QQ2swI5t3ZEly6Pt8c-LQ)

10. Click the ‘JSON’ tab.

![](https://lh5.googleusercontent.com/xkmd7Za1Dlm9dbRjeRg4SfsNt1cuyGbib1Nl10OMMCkcUtCQqvYOdp8f90VdzFdo1ZrBwggu8pjyXsoz1ceXYhToT6b6ARmX4OZAlpjOcMgDf-1Urg7d_7zU1k0lBkAArC4zKqxXmzezV2fsVw)

11. Scroll down to the Deny policy and remove two lines (**line number 27** and **line number 36**) listed below

```
"aws-marketplace:\*ubscribe",
...
"cloudshell:\*",
```

> Make sure to delete the whole line.

![](https://lh5.googleusercontent.com/OfZqi7CKh6MioLvJH15wD5o5v3HcNry9q-D3wPQFTokkWFz3fF7m2lcRJsMUpAR1aSm7h_UIWSVRqOGR5GxPhBwLHyCmJG5UwY9dcaSZ8tIL48apvw_g-KCb2u6GnqaveVh-8CLsTMY3tpHhEQ)

12. Click on ‘Review policy’ at the bottom of the screen.

![](https://lh3.googleusercontent.com/mwVOBERCRlod1bqLYa_k63oLOdg88KtrmT0FcnEr8n03p5x5mfOMP4YFvBB7reih4_9-wZZ5QC6FdjyKdKgj-FFSeIWmVuOqmTUmbterjgaXNxYvBvv8395za9jot9uWDwQmRtG-aRLyqmrqAg)

13. On the next screen, click on ‘Save changes’.

![](https://lh5.googleusercontent.com/8TSjfr-yVd1H9GN4uWdveOnpxy9_Qu_u5TyGGujvRqoLX-eNA8qD7OtFUYBYG6i0XdUD9IMyKikyq-V4wGON9STJFioYEkr4e7m8VtHUCio7luyspaHxNoDjz_QaU-fmXuVk-nBcXNj4RxSonQ)

14. Account setup is now complete.

## Launch lab environment

In this section, we will deploy the AWS Cloud resources required for the purpose of this lab using Terraform. 

15. Click on ‘AWS’ on the top left hand corner to navigate to the primary console.

### Subscribe to VM series

16. Click on the link below and the page that opens up, Click on “Continue to Subscribe” and then Click on “Accept Terms”.

> Make sure to open the below link on the same browser/window to ensure that you are already logged in to the same AWS account.

<https://aws.amazon.com/marketplace/pp?sku=hd44w1chf26uv4p52cdynb2o>

![](https://lh5.googleusercontent.com/VaLL6fiYUtPrq_P7hJFAjs7IXN8LIZnBjUXNLzpbHNxNH4Vpc2sRRW23BRUGZkV1RG07cRk-Bicbbngz-Yk0FTQPf3OoGyVbL8oIt8C74eCTW1dnXadWW4vJg857h1guN8vluhy6q5RNFlfxSA)

![](https://lh5.googleusercontent.com/GUzCf4Ib8CL3gRB2ApTqVKuUWTYMrQfypNXXWKgiXlXX-XSoduu0DrZnGcR8VfmxgP0csEbWaoJ0N1TTJIa0ZQ1ugb1j3-hhvJHPCWhN3ygI8ANKypzZjwDkKaG72aM-3gnizYvLzr0mj_uSeg)

17. Wait a few minutes until the effective date changes from  ‘Pending’ to date.

![](https://lh4.googleusercontent.com/77DudT8Crpdp6TDgnkywEaJCRj6txVxtKXrrgrU4y0T7Lo5n8d04mdItMjwiD_JDsEvGrHlHHkTvN9xBUqmF9MthhFYDlMykK3sXxGSAWOqkjF1OPOwr1Agu0EBXI5WG1Vww77-_LOfLgvHQXw)

![](https://lh3.googleusercontent.com/BUgFJyZn4aD21CAlp4S7FeWrqlIK0aIXtrB03inVyMVxw1HnlZDGln4AiCX_h9Xpeb8EDPLR2xRj2A05LQM2g1GVaCFffGRTwsMhEX7GFd5PXBCqxcjlgxJwZbhNqJfqtxTZedy84E3vOUf96A)

### Subscribe to Panorama

18. Click on the link below and the page that opens up, Click on “Continue to Subscribe” and then Click on “Accept Terms”.

> Make sure to open the below link on the same browser/window to ensure that you are already logged in to the same AWS account.

<https://aws.amazon.com/marketplace/pp?sku=eclz7j04vu9lf8ont8ta3n17o>

![](https://lh3.googleusercontent.com/2HJcdCsWPNIgDWSOhmNYJMgqHubasNh_rlrXFaA6FSTNCoiiQ-pCo3OwIJCfGOTb9XyT-1CzHQSn7V-eIhxGnFeNv8KX1lP_JyB1EzI8lK988u1vd3G7nVmTRfIWve3OBN4HMDjMRezQXEkIRg)

![](https://lh3.googleusercontent.com/3GkFo_jbeF4pV6G3DX4ArVeMlDupKYAG_DXZ9WO2l3Ux_qlnKf-KclDfUUqC47eWgp8qvWxejAD58fVwLofw46EQQxI8ceRLOFEvrBHOiiVY23ocXUMuHRZmWwWBLGds3MT1RDdnfN9Xk0nuXg)

19. Wait till Effective date changes from ‘Pending’ to today’s date. This will take a few minutes.

![](https://lh4.googleusercontent.com/F5dugTsnfjNqsVI6OtoXC_aNYPbjpZQowuPY7zeBTB6p9kxKIvlIitoJ4zQVWI9rQpwQ5p4tkoYGpoW0xxO28QLa-zKjp2jd0t69l9Cy_TSBq88O-nIgC0rcg4PimDwhElREXgxJTViHykLeRQ)

## Deploy AWS Lab resources

20. From the AWS management Console, launch CloudShell using the icon on the top right side of the console.

![](https://lh5.googleusercontent.com/nFCREA1332c6fGdYGUCL8r9YhG-kJgC146vxlzVs_8Vfvqx2BtVf34dk7QavJ7ofGcc87PaXNg1GXnGH_3-ZbYMcdQ15kkUS7yVlCgCgkuJceTW6Fp2BcVXhWDGEMmGT7jVQ1OcFc8iqjZCuMQ)

> If you do not see the icon as shown in the image above, you can search for CloudShell on the Search bar on top to open the service.

21. Close out the welcome pop up.

![](https://lh3.googleusercontent.com/Dohs1Z78kMrOu_R1NstwDIdPbeR7yUR67ixJ6pkkvOnd2M1CwQKRWhv7gHuSW8h9jJJGlA1zHLi424pTqLiezt_ysTas8mcFEJXzkYzPTP9t39mwIe9LDgCSjGES4472GlZDvMyFdv6_PtTyOQ)

> It takes around a minute for cloudshell to launch and to get the prompt as shown in the example below.

22. After the cloudshell is launched, copy and paste the below commands on the shell prompt and hit the Enter key to execute them.

```
rm -rf * && git clone https://github.com/PaloAltoNetworks/lab-aws-zero-trust.git
```

<a id="lab_setup"></a>
```
lab-aws-zero-trust/setup.sh
```

> It will take a few minutes  (**~5m** ) to deploy all the lab components. Status will be updated on the cloudshell console as deployment progresses. At the end of deployment, you should see the message “Completed successfully!”

![](https://lh4.googleusercontent.com/z1z5P31hLK_6k9aA4YItpL8CKgaLMKLRJiSvjuj3bnL92bE9UPyFDNTvP2JmKn9nCf2CwdHivGCSGiDLP79QF9QHi_xp3W8b1F0SD1f6b9QVhXHToY_paolNFVZNRG1IKXWCCuYFiXTZCErqzA)

**Figure:** Completion message of the Lab Setup script

> If you run into any errors during the setup script execution, please check the [Troubleshooting](#troubleshooting) section on how to resolve the errors.

23. Review the deployed lab environment with the topology diagram shown below.

![](https://lh3.googleusercontent.com/FmwD5cvyVHv5ejVBY2GxZRceOHs6aTEq2XN1VA6Trs_2kmQQU9Fk9td1aLaLxPyKaaKCTK9a210PaNldd_GCkPzTJkvbNMn2uBV-XJIdmv_eN9zmpN83dZHN0iqd4FEzqh7cjnE_6sae7aXU8w)

**Figure:** The Lab topology that is deployed using Terraform

## Log in to Panorama

24. Run the below command to get the Panorama URL.

```
cd ~/lab-aws-zero-trust/terraform/vmseries && terraform output PANORAMA_IP_ADDRESS && cd
```

25. Copy and paste the Panorama URL on a new browser tab and hit the Enter key. On the Login page, enter the credentials as shared below.
    * __Username__: admin
    * __Password__: Paloalto@1

![](https://lh4.googleusercontent.com/DuiYwH5TH-mgv8cSqLa20fymSMOvYg9-Y0IzvU9MHsIbD0Sx7YyNjjUueRDiP3Vmq7T2q1Zd4HiBYs5vV_MUUUeDcxWuioZc2MyKDAKoG0MZRuglchpBMrYHcJlFd-uAccc7oT5v3EjunpQIgw)

![](https://lh5.googleusercontent.com/O8qhwPZ_1pR9dLJNoaKLS_8NkiLSQiXsLX0JNluqYhmnVXOB5eckVSYMxhIc2MrSlOOuSPCpdAhR9gYYMPzww1vM5d9Bn_fmB-VCPDrG8f9-S4oV8MaHHebFgdPUEuLRjljbXX6Yx47ucthWLA)

26. Once logged in, navigate to the _Panorama_ tab, Click on _Managed Devices > Summary_ on the vertical menu. Ensure that the VM-Series NGFW is in _Connected_ state.

![](https://lh5.googleusercontent.com/haIkx7FrTjiVEZsHH2I24GGxMh-FQpU2Za4Z5iQeQ0CGcmPYEhb2jA176dWNRBvfet3PFbFlbVbqU3YfEPqA0uCEkDYI0eEeUGacuZSumnj7NxIYWXkMUKRl2BunQVEVWAkDD_xsm56kCSi5jw)

> If you face some issues accessing the Panorama Web UI or logging into Panorama or post login if you are unable to find the VM-Series NGFW connected to the Panorama, please wait for a couple more minutes for Panorama to be setup completely.

> Make sure that the VM-Series NGFW is in _Connected_ state and _In Sync_ with the Panorama. If it is not, you will not be able to login to the spoke servers.

## Set up the Vulnerable application server

27. On CloudShell, open a new CloudShell tab by clicking on the __Actions__ menu on top and selecting _New tab_.
28. Run the below command to connect to the vulnerable server, _vul-app-server_.

```
aws ec2-instance-connect ssh --instance-id $(aws ec2 describe-instances --filters "Name=tag:Name,Values=qwikLABS-vul-app-server" "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[InstanceId]' --output text)
```

> There are also other ways to connect to the EC2 instances, you can look them up in the [Appendix section](#connecting_to_aws)

29. Verify that the vulnerable application is already running by running the below command.

```
sudo docker container list -a
```

![](https://lh6.googleusercontent.com/VWA7T96Z2D6XI2_7TUo_W-i5Q6x-JBJSCR67LfGrVwrJdggUp_ZkcNWXIWn0HUzEJA0Q28E3FqNPsaUs_G1PwP9tvpiPorU96Z5KUONlws-PUxr59vA1etdgv1TLz1bttWyXBFYktzhos8Gf6g)

30. In this lab environment we do not have a DNS set up. So we would add an entry directly on the pod hosts file.

```
sudo docker exec -it vul-app-1 /bin/sh -c 'echo "10.2.1.100 att-svr" >> /etc/hosts'
```

31. To verify the update of the hosts file, try to ping the att-app-server using the hostname (att-svr) provided. 

```
sudo docker exec -it vul-app-1 /bin/sh -c 'ping att-svr'
```

![](https://lh5.googleusercontent.com/0kmdbzIpUfp-N_BSGBm6yScPHD3TaZdp9sRjAKTaLk6GdRm1Ia-8EmRsX308_Zwmqtr1K89JTrKpONLDqwN0Sh5dxT3eYc8CTgkhgCcOb9ODRwcFEJ4u41z09AUeX0LMTZNaGLbiaLq0f5tP0A)

## Launch Log4J Attack

32. On CloudShell, open a new CloudShell tab by clicking on the __Actions__ menu on top and selecting _New tab_.
33. Run the below command to connect to the attack server, _att-app-server_.

```
aws ec2-instance-connect ssh --instance-id $(aws ec2 describe-instances --filters "Name=tag:Name,Values=qwikLABS-att-app-server" "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[InstanceId]' --output text)
```

34. Verify that the attack application is already running by running the below command.

```
sudo docker container list -a
```

![](https://lh5.googleusercontent.com/7cyUWWjUPpH3cKD_oyUbaCLqakdx6R7TMTfwqofEH8aAYuAZtbd_kBp8500TmnhePrAsCNeTNrh4NAgKkecsHA-bT2sdE460w-1fVKibRN0yGwYlSbZYOUoAY8FH_JTJ67q_6CLyEE3kh2Q-lQ)

35. On the **att-app-server** command prompt, execute this command to launch the Log4J attack.

```
/tmp/launch_attack.sh
```

36. You should receive a ‘**_Hello World_**’ message back.

![](https://lh3.googleusercontent.com/WDxnlTUhxoe3OzRqKcWXDFHj9v9XJoUwV3b9aBu-Zlmt7ldgbpMh5j6OBgQ1FOz5DmM-2jynMDQ-DxANXtriiD4jqDqXbKClyZ_MA5q7eKCSIxCg9TAXznpd7G8PtQLg-M1S8opiRPs4njM_Lw)

37. The vulnerable application has now been infected by malware. Go back to the SSH session with __vul-app-server__ and execute the below commands:

```
sudo docker exec -it vul-app-1 /bin/sh
```

```
ls -lrt /tmp
```

For example:

![](https://lh6.googleusercontent.com/IbnrhAjgUkTPnXDHjAfykC6Zpj0nwf-pAFEtDZs3wAgNK8SES2D-h72Mr4f15vIQ7nnF0VgzF92hbmezXD-d3gOCm5pMSOBdP_QisSvsElCCtI_U50IkSIa7z4gxvmTGMQqUVmNYRZPBdbjKiw)

38. On your Panorama tab on the browser, navigate to Monitor > Traffic

![](https://lh3.googleusercontent.com/HochvmJxXuqNggSg2Q5XJnZhieiT1LtsF9FKBEPqv3fNED7wc7yDF8RmUUS5IvjPtqbrLoISBDWxt2uc-zkodyNvAhKhaKAa3q6c8Vf6flgVn6eLCmfzbqbdgZcv5_tfSWMEjz5y4_w_xWYlQQ) 

39. Notice the 3 sessions associated with a successful Log4J attack.

| Source              | Destination         | Destination Port | Application      |
| ------------------- | ------------------- | ---------------- | ---------------- |
| att-svr(10.2.1.100) | vul-app(10.1.1.100) | 8080             | web              |
| vul-app(10.1.1.100) | att-svr(10.2.1.100) | 1389             | LDAP             |
| vul-app(10.1.1.100) | att-svr(10.2.1.100) | 8888             | Malware transfer | 

40. Remove the malware-sample file for subsequent tests.

```
rm -rf /tmp/malware-sample
```

![](https://lh3.googleusercontent.com/aY2Mfz7laByWZZNDhfGs5G88PDHd2SrdX3oV1bvI72f7WjAoPr2W-O3SpUtlAgCQySoLWixk456JB1iQICegABcrltFuOEAmZejs-PEtzDNdSbkJnfAmqPirBJXMRAxSGTtud-kaIzgIsrc6jQ)

# Best Practices for Protection against Log4J

In the following sections, we will see how you can build a policy model that will provide multi-tiered protection for your application against Log4j attack. Multiple complementary security controls across our portfolio, combined with best practices, can help protect organizations against the vulnerability. If your organization is already aligned with our [security best practices](https://docs.paloaltonetworks.com/best-practices.html), you gain automatic protection against the multiple steps of this attack with no manual intervention. 

In the following section, we will deploy best practices zero trust policies to  protect against attacks. We will deploy 3 policies one each for outbound, inbound and application based protection.

## Deploy Zero Trust Policy for INBOUND Traffic

41. On the Panorama tab on the browser, navigate to Policies tab. Ensure that you are in _Shared_ Device Group

![](https://lh6.googleusercontent.com/S_gB-8pzYsDMzgtkq97zo657mrCiu1kTrmcEwExQ9spfrQ5_TLsWIAcxvUyW4nIRUPid2Z6vcjplHWVzumd4ksezkROJe7IGmAALMfihsb6hpuAYwhtFuccywn7v99DIrTp80Ma2zTDIoRTuJw)

The policies will look like this.

![](https://lh6.googleusercontent.com/wQPElQS9oCGEfnxRzphLNqs_on3il-NmmEJrPOHgNfTNWIPiP_KDk9b7GIUJ5n5iGJ5kFhOuxVO7bQvCQKKkPb9zrmefjrmelaedWIvyGBlztfP8t3FLVdnxKgR29t4J5AZc5qVTyB3U-wVlUg)

42. Enable _ZT-log4j_BLOCK_INBOUND_

![](https://lh3.googleusercontent.com/TSlzaEDhOuWhkCIFsW5w1R-YUQ-uvF55NvctN_DjeOiS8P722J_cbbvdSbkaYNEwlP76aEC6TsTx9yxgiGU0qmj-7AB0KtQ2henfxxc_ryH6rPYvohEEFNYaeSTooV7jimnf5SSM0JubVriL0g)

43. On the policy, Click on _ZT-log4j_BLOCK_INBOUND,_ navigate to the ‘Profile’ column and click on the icon shown there. Ensure that ‘Strict’ vulnerability protection profile has been enabled for this policy. 

![](https://lh5.googleusercontent.com/xnZaOybfOykgjeoOrsG2NLRBp5jsgJcdEwgfUg3Tmg0J-K7uWvB18GrWj_uTjAyHND8jlRAlpFTWrojNjFBZyzGAkkqkq2QHCgh0ZCo5sUCUEaNvUNYmxoQktznmypI-n81-38E7CeN1dclIvQ)

![](https://lh6.googleusercontent.com/ajjEtztu3PANIByyY7v90YgGSxalI-k0esOCzY6t102tcoHgWcwTOPp98TW_TnEfHOdKctSWUE0oQsaXho2x2wroBZGT3CWF3Ee-3PhY7Dz5j5E_NAwjVVY02BbZa_Ogjt26wxAaeXaRFY4DZw)

44. Click ‘OK’ and commit the changes and push to device.

![](https://lh5.googleusercontent.com/4y0UBE-42_4HySREzVU-wYr5mGKb2I7gGqMGbjUTFZg98QQQgd9ddkSOp7rHm9YpmgTQF-fr09Qvc54vjhgCa6KrOC-efq-pd4c04D8UBDDfpr89JfFN32GQYPguNH8BtReiME3AVccNbP8nzA)

![](https://lh3.googleusercontent.com/aLMuFyci301sIxPfYMYmhKYtAdvc1-6xOoYN8cYQEJx7bkYsMWHQCBtp8r4jVPHZOREEd18jj2PeUaEG5IvsCGld4XMf4p-KDPWHvlMrmL95imPZIzIS5Fx_-Vx1m04GzFd9x0dQazlRURPAdw)

![](https://lh6.googleusercontent.com/3DiOnz3Itg0DyW45G0XCEXPCgOCZ4551pWD3fmE4xyMbZxitXIaFPc9LSdvzjzqp3xmAfFxoLyemC2tZxvJ5Z9q87GsSrORMUZxikk1vM2Zc_hhk5ag386LSJBQ0QsU3RjC8qfJTIh32u0xb6g)

> If you see the message "Not all Commit jobs got triggered", see this [section](#commit_issues) on how to resolve this issue.

45. Click in ‘Tasks’ button on the bottom horizontal bar and ensure that ‘commit all’ job finishes. Click on Close to exit out of the window.

![](https://lh6.googleusercontent.com/0e_73oUxOEB1XE56HsNgPSLrI2ljHBXSCoCutpYjzheOhVxTkvCdLq8FleP7uLu6NvzYjR3MFWDdqlFYolwIa0GVF5xmmpmP5R14Wg3WWZKtHdWXKoJCPrZ8Ag9yzlX38FeAIWBpgF_wfc_i8A)

46. Relaunch the attack by navigating to the SSH session on **att-app-server** and issue the command.

```
/tmp/launch_attack.sh
```

47. This time we will see it does not go through

![](https://lh4.googleusercontent.com/0JVCnNrWY1UKNo6i-Wrt5G1tqhFCoSse6LaecMiGL_cCWauu3gd0QP8x4DjEdED0pNYrefDmNdkgKE_zbJTLaN7DbqpvTlvMcRjY0ccbIbMCZxnhZ_xpCYxZNagRC4u93cBhOxIjtMDmtrlYCQ)

48. Go back to the Panorama UI and navigate to Panorama > Monitor > Threat
49. You will see that the Firewall detected the attack and blocked it.

![](https://lh4.googleusercontent.com/41HHZq3ngzA9AmbmiQUA1BqrTr68fF4vXgegZJruBsKcW3GMZq7TH1iJm0eGa3CwaeuBCmKysvM7SXuk3UsY3fYHgh7MwUmP2ix6c73EWFGIIDCi7-hP7qY2vzfa2gBqm4yTXykYvvzifqWfSw)

> It may take a minute for the logs to show up on the Panorama.

## Deploy Zero Trust Policy for OUTBOUND Traffic

The Log4j attack requires access to malicious Java code hosted externally. Our Advanced URL Filtering and DNS Security service are constantly monitoring and blocking new, unknown and known malicious domains (websites) to block those unsafe external connections.

In this activity, we will use a policy that has both the profiles set to protect outbound traffic.

50. On the Panorama tab on the browser, navigate to Policies tab. Ensure that you are in _Shared_ Device Group
51. Disable policy 1 and Enable policy 2. 

![](https://lh4.googleusercontent.com/4578d8hRFZx82H_VJ1Xe_k0BxfZndYPKr-Dt1iJnGt2eE3pfipRmEcQAdzrATMb0EaR_uf_cFyXTrXTJLFO8R_bjCTjiPo4T530hK1hRtSib9voHJIhY5Jnj30ya5OlWj46QXGxZCYp7DC4A3w)

![](https://lh5.googleusercontent.com/-4LSx4Tk8MKkX_bvhXj2ryMSDhj6VqNbQXicXuerO2vnq4Ucj_Qh_uqsATKzrRPfSGm_rypNT0tZq3jA4w7cOIjR8vIiwZuGOTCcAzED-JRqlMWn4J1Gxmb6afPbC2v4UtKfUWGKcNMzVxQC5g)

![](https://lh4.googleusercontent.com/wWCp0vtAkBRfQyGvO7b_lKMeBx3SvQJ7D5lMM_JS1PRo3RIRAmTQErwX5MzCETPr9k3t9aOQoDYKJVoTc73rBiKOUManfVQaUMVd5TtMjsysxcqcFVG0I9ql8cvnu5f9YEAnR5G8UQwyYZnw_A)

52. On the policy, Click on _ZT-log4j_BLOCK_OUTBOUND_, navigate to the ‘Profile’ column and click on the icons shown there. Ensure that the Anti-spyware and URL Filtering profiles set.

![](https://lh3.googleusercontent.com/XjmZIXk-VAQ1y_IOPWcEMeR1k194tXpIJgjJsEzcsZ2U2h6D_gcIh_2Tdsrqx_-IejWv07doK7vKtlW2fZLCyxCDmFkxvKI55_KAtNrgPsuDUAsxxiYYR6zdITqfYshUsuO_pRs8yi_-s5fuUg)

53. To view the profiles, navigate to Panorama > Objects > Security Profiles > URL Filtering

![](https://lh4.googleusercontent.com/dFpK0PtEYa9LMcLEIj0PuTzTSG4m8VHbQGCHFCmTxc3c58YmT5z99-xTM-sV3TpZodUnvRx3A4h3BwceNY7wfVRh8C-T-zm-6Wd0EZjtvoGH3nLir7-KlBvbC2tCMq8TzD05_twh88SIvsXbKg)

54. The profile follows best practices recommendations for URL filtering.

![](https://lh4.googleusercontent.com/D90XYxigw1a-mscww6akBH5cenvHt5s5r047o3D6VC1Ns6oB4y69w_jA2n7J-mHT0UhfLf3KN9sYSZNBpHNPGRSZq7yHWnA_FbJPqtC7C02dlPBHsI18R-kin91OFtAWTEjvcY8I9Ct2bpAsrg)

55. Close and Commit the changes and push to device

![](https://lh5.googleusercontent.com/IxTaLul84VihDRHwBKa2uQeKiHSsRptNVSmJR_ionyOZpx3WKe7BRD7o-z9Bp6Zpps3_ZuqJpo99GuFn5jJgrHKF8fbrviHuCvZ2uDm-WYf0hgAN9YItQ6SWioC2YQQtU-9xW9K0culUjkDcrA)

![](https://lh6.googleusercontent.com/3DiOnz3Itg0DyW45G0XCEXPCgOCZ4551pWD3fmE4xyMbZxitXIaFPc9LSdvzjzqp3xmAfFxoLyemC2tZxvJ5Z9q87GsSrORMUZxikk1vM2Zc_hhk5ag386LSJBQ0QsU3RjC8qfJTIh32u0xb6g)

> If you see the message "Not all Commit jobs got triggered", see this [section](#commit_issues) on how to resolve this issue.

56. Click in ‘Tasks’ button on the bottom horizontal bar  and ensure that ‘commit all’ job finishes. Click on Close to exit out of the window.

![](https://lh6.googleusercontent.com/0e_73oUxOEB1XE56HsNgPSLrI2ljHBXSCoCutpYjzheOhVxTkvCdLq8FleP7uLu6NvzYjR3MFWDdqlFYolwIa0GVF5xmmpmP5R14Wg3WWZKtHdWXKoJCPrZ8Ag9yzlX38FeAIWBpgF_wfc_i8A)

57. Relaunch the attack by navigating to the SSH session on **att-app-server** and issue the command.

```
/tmp/launch_attack.sh
```

58. This time we will see the ‘Hello, world!’ message but the attack does not succeed.
59. On the __vul-app-server__, you will see that the malware-sample file is not transferred. On the vul-app-server, execute these commands:

```
sudo docker exec -it vul-app-1 /bin/sh
```

```
ls -lrt /tmp
```

![](https://lh6.googleusercontent.com/-21McYd08RS_Dl0rtUU3zGVbVOdrvRVji8UWaoEn38HeZLe-5CLKna6iGcrq0_47PWe8RWcng8fd3uY-0uJE46gp8eH1o0Ws2rHSzSwoUDfsluxg4A_-nu64Ps0jtu8eUlf7ZhnhaKaoqhT-PA)

> If you still see the malware-sample file here, please delete it and run the attack again.

60. Navigate to Panorama > Monitor > Traffic to see the firewall logging the web-browsing action. On the Filter search bar, paste the below query.

```
((addr.src in 10.1.1.100) and (addr.dst in 10.2.1.100) or (addr.src in 10.2.1.100) and (addr.dst in 10.1.1.100))
```

![](https://lh6.googleusercontent.com/FOZXtuT4sz4DZFK381E895ZjtlCCJfacQcl3EvY8y7QCCPlGMwqkJt7ZpLR3b0ag9mOGp93yYR89lxtleArIzmh8yeMjmFC27c--BWYfxAIXqj9NlLeMT_luYfN1XMz4PRiddF8ZxMBlfZMl8Q)

## Deploy Zero Trust Policy to Limit Applications To and From Untrusted Sources

We can use the App-ID for ldap and rmi-iiop to block all RMI and LDAP to or from untrusted networks and unexpected sources.

61. Navigate to Panorama > Policies
62. Disable Policy 2 and enable Policy 3 _ZT-LLDP-RMI_logdj_BLOCK_

![](https://lh6.googleusercontent.com/7SmQNFFXsuMAmEE1Fipw-VjeUXpK_z_8mlvcV8rwPdr8mEHJ6Z6KX3C7cL5iyOEszMVgLqPNOEtZ5RANFXW385dsjr6B8ZMgEZL7EkDPVErogGYhoTyptLUbU25SfgUrsNZZla4ol0RHMn9qlQ)

![](https://lh4.googleusercontent.com/t-uX6ryRh6ukVA8m2BEn4v7JcGUGSsn7G0sqw6bnixwUtBROTiVnX2QQG9ZETISkL1aDoz2Yxq0Mjif-u63uNkF0C7tEDlTpTisqzv0FrTlQwL6kxeuwmCaqflJWWdE5HriUf8JkaL8OoI4MrA)

![](https://lh6.googleusercontent.com/c6uL5fjxwXFnSl5c_d2ICYac2oe20rLdcG4i3_J8CkNmIDbuI5V9HLBpEdFDX_zpi9vKt7kbQ8uRjqlN8zJ4Dpoq5l3EHjdt8dyDZb5weT86nXE2T6Q2uhKUExaC-xMNnBw8WI-6j7p2a2Cs9A)

63. Commit the changes and push to device

![](https://lh4.googleusercontent.com/g2QKowd_vOSjzGvmfOxUdxqb2-E-Wn3gvqye_aNslM5I2M0BfxVP7WFpm_XxmTFa2-GoN7DMzq9s34SPVrjsBsrwdte9akGBbqOcCbat92bTBlwKHK5ACvRUaHJ-CdZ39gDQnKmvmQPNwmjR8w)

![](https://lh6.googleusercontent.com/3DiOnz3Itg0DyW45G0XCEXPCgOCZ4551pWD3fmE4xyMbZxitXIaFPc9LSdvzjzqp3xmAfFxoLyemC2tZxvJ5Z9q87GsSrORMUZxikk1vM2Zc_hhk5ag386LSJBQ0QsU3RjC8qfJTIh32u0xb6g)

> If you see the message "Not all Commit jobs got triggered", see this [section](#commit_issues) on how to resolve this issue.

64. Click in ‘Tasks’ button on the bottom horizontal bar  and ensure that ‘commit all’ job finishes. Click on Close to exit out of the window.

![](https://lh6.googleusercontent.com/JrB8jyKPymcNypg-AehfNRRqDLrjREkgkbI_paBRe-1Oll56s6gI41QhBVAhoX5DlO43nJQLSIBKUGno-G89T8zuIKhhbP9bg_GGijyXGLsrmljK_VvdOd5pXI4ScHfqpBYhpq44T5Lpe3ud2Q)

65. Relaunch the attack by navigating to the SSH session on **att-app-server** and issue the command.

```
/tmp/launch_attack.sh
```

66. Attack fails as the firewall block application access
67. Navigate to Panorama > Monitor > Traffic. On the Filter search bar, paste the below query.

```
((addr.src in 10.1.1.100) and (addr.dst in 10.2.1.100) or (addr.src in 10.2.1.100) and (addr.dst in 10.1.1.100))
```

![](https://lh4.googleusercontent.com/AzKkj6SkR3ZUpE-lvBKmeu6UyWy4Pf-n1OlyptIL_-AdUwyDk5yBkreRkiIWhS7SgdxoXoEImKPMB6N2DPhmig9FYtTgN7VkolW7OEd9rNQfKQbTsfQRpYvDunBnwPe0Yh1z2PECtPVT9v2wgw)

<a id="lab_teardown"></a>
# Lab Teardown

To delete all the lab resources that were set up, you can run the below commands in CloudShell.

```
cd && lab-aws-zero-trust/teardown.sh
```

> __Note__: Please note that this teardown script may fail due to insufficient privileges to delete all the resources. In such a case, you will need to once again update the IAM permissions for your user to get the privilege to delete resources, then run this script again.

# Appendix

<a id="connecting_to_aws"></a>
## Connecting to the AWS Instances

There are 2 types of keys provided to connect to the AWS EC2 instances; PEM and PPK.

* If you are on a Mac system, you will be using ‘Terminal’ to connect to the devices via SSH. For this, click on the “Download PEM” link. This will download a file named “qwikLABS-L\*\*\*\*\*-\*\*\*\*\*.pem”. 
* If you are using a Windows laptop to access this lab, you will need to have a SSH application like PuTTY installed. In this case, click on the “Download PPK” link. This will download a file named “qwikLABS-L\*\*\*\*\*-\*\*\*\*\*.ppk”.
* Make sure to note the location where the file is downloaded. On a Mac, by default, it should be downloaded to “/Users/&lt;username>/Downloads”.

We will be using the user ‘ec2-user’ as the username to login to these applications. We can login to the EC2 instances using the below methods.

### On the AWS CloudShell

* Navigate to the AWS CloudShell and run the below command to log in to the EC2 instance on the AWS environment. Make sure to replace the _&lt;instance-id>_ in the command below with the instance ID of the EC2 instance.

```
aws ec2-instance-connect ssh --instance-id <instance-id>
```

### Using the PEM file

If connecting via the AWS EC2 console does not work, you could try the below two options as well.

* Launch terminal on your MAC.
* Navigate to the folder where the pem keys were downloaded to.

```
cd ~/Downloads
```

* Substitute qwikLABS-\*\*\*\*.pem with the PEM key that you downloaded and run the command below

```
chmod 400 qwikLABS-****.pem
```

* Substitute qwikLABS-\*\*\*\*.pem with the PEM key that you downloaded and run the command below.  Username is ‘ec2-user’. IP Address is the public IP address of the ‘qwikLABS-vul-app-server’ that we noted in the previous step.

```
ssh -i qwikLABS-****.pem ec2-user@<vul-app-public-ip>
```

For example:

![](https://lh6.googleusercontent.com/ulQz4of2Lfn1iAsbmy9J4YXfXg3_UkbeEx7tRrjHu8uZJqTX6yQ5NTRUlzuKNvSYuwGldLCo6_8wOmUeBIrTsvBffE3Zf68iGRh5x34_UqlJe4fKgEN1rWlKYBKfBeGza0x4iyagGTlJO9jhoA)

### Using the PPK file

If you are using PuTTY to connect to the servers, after opening the putty, 

* On the Category menu on the left, expand SSH and click on Auth.
* In the field to select the Private key file for authentication, browse for the downloaded PPK file and select it.

![](https://lh3.googleusercontent.com/aAAvPXmenQ-cHpAP6BzLKgKM6tXguUbnSkLc427HE8J8UsNSl9TlM4E2Q7TxQTGKRsF6B-BXpd2R6tbmLP1tmoj9v9B8NSGmqpOMCCz7RmQNc676n5Lmo088qYnHiUiVkNH4O-0uk2kyaHxxzA)

* Within the same PuTTY window, on the Category menu on the left, click on Session and provide the Public IP Address of the vul-app server as shown below.
* Click “Open” to connect to the server.

![](https://lh4.googleusercontent.com/wmz5MlxioKGCl8qp_kP9XFMkw-TPGuz6BvKrFsxolNeKNBUo5wDvDVoPMOX6OQlUyoIw4UX579VHkBdtpeA740jsXqawYvtaK2u32kj9K04MEw1HXCAl7qfOtQD7wKZ75Qbgg9nuFEpc_01W1g)

<a id="troubleshooting"></a>
## Troubleshooting

### Setup script Errors

#### "Resource not found" or "No such File or Directory found" error

This error can occur due to come cloud resource, for example, transit gateway, gateway load balancer, etc., taking longer than required to be deployed, so the Terraform script times out. To resolve this error, simple run the [setup](#lab_setup) command again.

#### Error: creating EC2 Instance: InsufficientInstanceCapacity

This error occurs due to exhaustion of AWS Cloud resources in the AWS region where we are deploying our lab. To overcome this issue, you can [teardown](#lab_teardown) your lab, change the AWS region and run the setup again.

#### Error: creating EC2 Instance: VcpuLimitExceeded

```
Error: creating EC2 Instance: VcpuLimitExceeded: You have requested more vCPU capacity than your current vCPU limit of 32 allows for the instance bucket that the specified instance type belongs to. Please visit http://aws.amazon.com/contact-us/ec2-request to request an adjustment to this limit.
```

This lab requires a total of 14 vCPUs, which is well below the limit of 32. This means that there already exists some AWS resources that were not cleaned up properly. There are a couple of ways to proceed from here.

* [Teardown](#lab_teardown) your lab. Then look for any EC2 instances that still exist in the AWS account and delete them. Run the setup again, or,
* [Teardown](#lab_teardown) your lab, change the AWS region and run the setup again, or,
* [Teardown](#lab_teardown) your lab, End the lab and Start the lab again from scratch.

<a id="commit_issues"></a>
### Panorama Commit Issues

On selecting _Commit and Push_ from the Commit menu on the Panorama, if you see the message "Not all Commit-All jobs got triggered", then

![](https://lh3.googleusercontent.com/QoB9oHT_ZIBcnRMLXT9OroCI9jEKS7HZ3vaGc0OdimDwt8LmdRPbngNz772koXuERGQo4KhuPmSh-rf7pi3D6TRw0Q-xs16go9iy5Y6RgzfSYgTA6BLx52Y1mlW3MsGTGvkXWVYCdfl2GJQh3A)

1. On the top right, click on Commit again and select ‘Push to Devices’

![](https://lh4.googleusercontent.com/Rb9Z4uPL7u5dKLM1ZMrINQTv_e-ZFoAEKdqvfeW7FrAnnMYDRG0Dh-6wl4pT6EKI4GmbXxFJKgqkm9g7TzGfNhybkH9v05q5yOF5og6mULD8q3jzY-ZBUgFderKo1VPK87gEXCW09gf5FE4rAQ)
    
2. Click in ‘Tasks’ button on the bottom horizontal bar and ensure that ‘commit all’ job finishes. Click on Close to exit out of the window.

![](https://lh6.googleusercontent.com/0e_73oUxOEB1XE56HsNgPSLrI2ljHBXSCoCutpYjzheOhVxTkvCdLq8FleP7uLu6NvzYjR3MFWDdqlFYolwIa0GVF5xmmpmP5R14Wg3WWZKtHdWXKoJCPrZ8Ag9yzlX38FeAIWBpgF_wfc_i8A)

# Activity Final Thoughts

As we conclude this session, you have familiarized yourself with building a policy model that provides multi-tier protection for your applications on AWS against Log4j, following best practices guidelines.
