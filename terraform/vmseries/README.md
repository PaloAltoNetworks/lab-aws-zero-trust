![](https://lh5.googleusercontent.com/2a_yIDcbkhGM_vxF7etjfvN25pwyzottcF0-rVO2HVW851OsRqRr54rnsy5hRN5JyKH8r6qAw-1-xm01hvM5AKbg7Jb1hxJ26A5gpCy7zDMfvALlUUi7Fz3tJB4qHr8pUw82pysTrlhdYM-GAA)

  


**Zero Trust AWS GWLB QwikLab Guide**

  
  


![](https://lh4.googleusercontent.com/0_lTgA9UJys5C9HWzh-FihfQb5ILUFpgoqmWSPyZnnn3YTP_VU5SzkEeM76Kjd6GNI6mOPLy8VjqPgvRa5P42iXDG1_FFYoJJwdhXfQBXgkn-BQRh9HQDNSFHtCLx9OMi93Tbie8PPvlolmtMA)


# Table of Contents

[**Table of Contents**](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.145rn2p5f27q)

[**Overview**](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.99h5e1s1wo43)

[Hands on Labs – Zero Trust Exercise Summary](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.lwu81ipa4c4f)

[Hands-On Lab – Palo Alto Networks Product Coverage](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.kk7e4pakydq)

[**Application Environment Overview**](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.vh558okzw1el)

[What You'll Do](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.tt3c5bhdg3gv)

[Launch the lab environment](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.tzb29urffstq)

[Start qwiklabs lab environment and login to AWS](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.kfoz4g57q659)

[Set up AWS Account permissions](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.ga1vtnisisx9)

[Launch lab environment](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.zhkfyrsdexzy)

[**Activity 1: Protect Against Log4j Attack**](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.cxmag11s292k)

[Set Up the Applications](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.4yq3mt9ta2an)

[Note the public IPs of the app servers](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.hf214aa2rrrz)

[Connecting to the app servers](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.m270sbuxdlfm)

[Using the PEM file](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.omleejorzmy8)

[Using the PPK file](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.u0emolxm3tia)

[Set up the Vulnerable application server](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.v37efxbl4kty)

[Set up the Attack application server](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.ib93mrfe83cm)

[Log in to Panorama](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.hj0f8vfw6nrk)

[Launch Log4J Attack](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.wf7o5qqwyvvs)

[Best Practices for Protection against Log4J](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.f17y6otq6vwg)

[Deploy Zero Trust Policy for INBOUND Traffic](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.54u4ytu2zzx8)

[Deploy Zero Trust Policy for OUTBOUND Traffic](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.a62sco509b)

[Deploy Zero Trust Policy to Limit Applications To and From Untrusted Sources](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.f0w76po3if0o)

[Activity Final Thoughts](https://docs.google.com/document/d/1h0fzj6ywL4MUE8OWz9syIOO7wjpIC41dbfQ12dIwd5Q/edit#heading=h.35ehbw97b0m)







# Overview

The goal of this workshop is to take you through a deployment scenario where the Palo Alto Networks VM-Series firewall is deployed on an AWS environment. We will discuss design scenarios leveraging the AWS Gateway Load balancer. This workshop will demonstrate a use case that involves deploying Zero Trust Policies on VM-Series Virtual Next-Generation Firewall (NGFW) to protect your applications against various attacks.


## Hands on Labs – Zero Trust Exercise Summary

![](https://lh6.googleusercontent.com/9HUorFYQt8DGWT3-PGAzrIEu047qyYFmjQAqOHwvGZNfoKcfK3N_3dk9tNWR9GRYss-_At8vGSY4BRsyXpweawJJKEu8-2SN29ZlPBy_MdEdYNxPB5VOs6O_RYQCttNbqwYg4c8DsDBsW1mrSA)

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

![](https://lh5.googleusercontent.com/viAfeAn6_zB_UvPAz1Dr0eIuESTFH0-WfKU627GkOnn5z5aWBReTRFTwLn9DFpT9M2IAoB_ummM5ixYrUV8mPMDetn85VZdIJ1yFFx_Bsk7n6cv6JZroL-XY1nWiSHTExesDfzXNQ0WeDWSvuw)

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

Please follow the link provided below to open the Qwiklab classroom on which the lab is being hosted.

<https://paloaltonetworks.qwiklabs.com/classrooms/966/labs/1449>

On the Qwiklab environment, Click on _Start Lab_ Button to start the lab.

![](https://lh6.googleusercontent.com/GGJi8IX1ddoqJLSpKDwNmCVdJ7gH4L9OJWTy4ffYN71bpauxR1TPFXtb3DgrOqWLqTxTXFiDSMXB30ilK2R2SxTb1DKdAPhMJsBH8KfVS_WxAczH9oIQh-rVXuZupdcu7WKfGvm3hROqYGF_Lw)

At this point, Qwiklabs will build an AWS account for you.

In order to access the EC2 application instances via SSH in your environment, you will be using keys generated by Qwiklabs. There are two types of keys generated; PEM and PPK keys.

If you are on a MAC, you will be using ‘Terminal’ to connect to the devices via SSH. For this, click on the “Download PEM” link. This will download a file named “qwikLABS-L\*\*\*\*\*-\*\*\*\*\*.pem”.

Make sure to note the location where the file is downloaded. On a Mac, by default, it will be downloaded to “/Users/&lt;username>/Downloads”

  
  


However, if you are using a windows laptop to access this lab, you will need to have a ssh application like PuTTY installed. ![](https://lh6.googleusercontent.com/0tqIgeBNJvEos5--sXmu-Zld4qceR7F3t0dcpDAB_9QJcewtYIGF3Ca1NPKqpRjFmxpVQ69bD5IDPQHRad-AUrFl1faoMh8B0wyHLOagm2NQvwXtoNFJNpLvZMs1NvpE6ImIKLfo7WFbFdjWtw)

In this case, click on the “Download PPK” link. This will download a file named “qwikLABS-L\*\*\*\*\*-\*\*\*\*\*.ppk”.

![](https://lh6.googleusercontent.com/IJ7ZZFuaf8sUkP8OvElO8pnFdA_ifHvWrzFb4t21tXu9bDk6aLIEBBJTHKYZy5p5v1PJjWPVFUgrbHXK9TbEADjKqU3xcsVHVSwEQvgwnVKpqLgDdwTOMhi9qo3XyqC1arHOgI5Z7emqOxxZ5w)

To login to the AWS environment, right click on “Open Console’ and “Open link in Incognito window” for Chrome-based browsers. For other browsers, use the appropriate option to open the AWS Console in a new private tab.![](https://lh6.googleusercontent.com/Sy4uh9gCikojLV-R0le0fhW70yFbou_KMbBrugr1w1xdb3iLGOR6cvV7PBtQjMZBZiWCgC38mhU1tndJ9rufIvBqM-XZijotwxSFXe_urOwf1rH5ozowkcEYWmQgVHDf3s9R4PizFL7ixwBCZQ)

On the AWS Console, copy over the IAM username and password from the previous tab.

![](https://lh4.googleusercontent.com/0jtggTltkhFvvItASZl-R1llpyvS-ISAlUoPCBbZXb8EBBO_ECdpfpOc2clUYG-ZJpqL2UEmtmcrlLFpDs5exicZcWWpKfzAZSlV-NP9TM_OyMUJ3jpilM05wBIZcWENs8Vcnt3pjaUKQd8zEQ)![](https://lh5.googleusercontent.com/OY2HYC5JvFhiNxbNn8teu5hyPXvNQplPHrsZ25DbcHSiAZEq-auWaV9KIZ3-4vj391U6QYyJC5t-lndYokzP0OFcVenth7lXZpbKzWrGMXrnm5RCyrAA6xr34HJUlSHwhFf60JDGLpzRWnY-ZA)

Now, click on “Sign In”.

![](https://lh5.googleusercontent.com/BPDy_fTqhR5v5F7IYOaPzQDBd57l25oFtyiR5NNYuwddoYhiCdkt40vYjFxIaA8yEeEYgbLfyhNjabeMJxERqg38c79BTExRSowswHyRzUU6agFpLSZV9hWxuyPpjUnYT-pe_CQw8y_hyBu5pA)

Once you are successfully logged in, you will land on the AWS Management Console.

![](https://lh3.googleusercontent.com/Q8tBKrTb-Nx1-9ziEghgkZtwgLRQcNegvm3sFuz86kHNxNTZIvQ2C701DWxYq4wV2Dfok8N-aA12hAvEI957V4lr0s2uhEeCto9ktLyVpWpl0pbHhH6AG1hjMlbWWh1wbHHA6tBzTaU7kj4hTA)

**Figure:** The AWS Management Console


## Set up AWS Account permissions

As mentioned earlier, the Qwiklab user account, by default, does not have the permissions to AWS Marketplace and CloudShell services, which are required for the purpose of this lab. We will now edit the permissions for the Qwiklab user account to provide access to those services.

On the AWS console,

1. If you see a message for ‘new AWS Console’ click on ‘Switch now’
2. On the search bar type ‘iam’.
3. Click on the link to _IAM_. A new IAM dashboard window will open.

![](https://lh4.googleusercontent.com/nR-1SE5rbd7OfQ1Q1kMAaIunvbkF8LbYw0iCqsb2JjxbiCC1mt2wWdkXGvn24iEnQ5j55EjQYHbPJVSveGZe_clHEVIU6xIJCP6d_MWQgpxdd1zRSG8M3Rcm9Zes_tBAYE7p2qLnSRHkkZU0Zg)

4. Click on ‘2’ below users.

![](https://lh5.googleusercontent.com/nI6Wf6qgegUZD5jV6S6T9ZRZRlAUDHSxW8V1fS-y-kG0jCe68bla1EQlazdi8caWgF6-oYnvHeC99hbLcQLnyu7GOlrhSkE6JZ8pnmuPE_FEYJgCrnQpGJs_SbdLISkNV7-ZB83t1CS7GU27Ig)

5. Click on ‘awsstudent’

![](https://lh5.googleusercontent.com/qONYYMD2s4x_nL1nlpQ4VICTRPxJx1azykDEbZ4NVPfiS77-TD8w0OADhHE7ZhYk292cigipQllNOVVm76iukct5Csm7-YDpaMdu5edZh4OfjogDL0Ek8Iff7ZVPQX1SPTaVWv08oQgi5-P8Xg)

6. Expand the default policy by clicking on the small triangle icon against default_policy in the list.

![](https://lh4.googleusercontent.com/ZEgxTLHCVwz9zalDiQkomYxWkKdIwemzR_nOP3az4fufK9L2ofcjiu_-E5akivRkHjhEsMZ9FRhmxncQbMIbtng3cSVL03-OzgKUIpH29icPbMSuxVHewtqraSFkAoKWKdyJ_MgkOwk2F7TMow)

7. Click on the ‘Edit Policy’ button.

![](https://lh3.googleusercontent.com/m9VYxeTVLPZTAoJIgCdk9CtoZ0rS7S0FaH1f0wVWBXi8FV-zyvZrwjqMiAl_n6zLQxjRhghmjP1Ih0Hp8Zxt2mlcrG7pvX1H2UpYotORk9h10R8gHZSFLeEoHxsE22P-9jBnuOx5euEsAjV63w)

8. Click on ‘JSON’ tab

![](https://lh4.googleusercontent.com/UHOl-14lbreNScGm8O3cPGiAcEmByoSqHu4X0uTQXXaLvqNi5v2CMI5r53wE876cJ7ptsdTiYh3Pl7Mj3jnPip3GenbiT0ZR-D1VSMeQZKsKZcorGBeJM1ld75lfwrtmi-A0R1rIq8vAriMEFg)

9. Scroll down to the Deny policy and remove two lines (**line number 27** and **line number 36**) listed below

"aws-marketplace:\*ubscribe",

"cloudshell:\*",

Make sure to delete the whole line.

![](https://lh4.googleusercontent.com/oPn2M_rllxQXAVS-ouURmZ2n7iGE-kNHDRLqpHPcK405z0lDm93npMF0Er65nmPzklGOZoP-3Lkl56j3wNC87nIL33Kc0x1E2IHvEMBUgyorylz2Z175wg2n1leikBSAZAmkruVYWO3B0CjYXw)

10. Click on ‘Review policy’ at the bottom of the screen

![](https://lh6.googleusercontent.com/rvlSn19173ltr6Qwf6aMQQCf996BmFt4GW0jNTWQ_ZojxTTC4itnwecn1SPXT7Y6huLgBvbw65ifSE_1Xmbg-LB8PTnQ3aQSWtD_UJEIOQ8EIjYazm2CxeoYkI_gP6G_rTPHmnIMvyrno6FTOA)

11. On the next screen, click on ‘Save changes

  
  


![](https://lh3.googleusercontent.com/w6-dYoeuivRYlQQdcq2rDqApSY6l-DyroBwKoQ-nwR-7QY3fXa5Ums7taqWT2EuuWksenUHKYrEclaheEFwTItNHoSP3U61TX2TejLLQ8v0DklUy_gtxZ-uhd_PRsCMS3V2VqiQoRHYS9oCpig)

12. Account setup is now complete.


## Launch lab environment

In this section, we will deploy the AWS Cloud resources required for the purpose of this lab using Terraform. 

1. Click on ‘AWS’ on the top left hand corner to navigate to the primary console.
2. Make sure that the region is N.Virginia.

![](https://lh6.googleusercontent.com/n0GbWfbBTYlcG86mAyo3OTwfXwChLNGdLwdN4SPbHUuRSF8qDa53HFunMUHy_86YyoROra6DCw8xqG53qFG913IRT2Dhw48G1rtMM2MtqJoM8NlrBx9MYaABG94llv1rjhuN0TrSq9c1RVzt6w)

3. Subscribe to VM series

Click on the link below and the page that opens up, Click on “Continue to Subscribe” and then Click on “Accept Terms”.

<https://aws.amazon.com/marketplace/pp?sku=hd44w1chf26uv4p52cdynb2o>

![](https://lh4.googleusercontent.com/gwq37Y2ywxaXGLSug-yebs9E3rq7iBlHobeNajCrhBRPhN8DSNuPjiswQFgAKDngj41mbMImjC_IZPrMjD5L2Cy4fL_mFfSHETsFnz0dotFKFRylyzW6bcP-xTNiTt3uo6kMP6sY6TM9a1yiYg)

![](https://lh3.googleusercontent.com/niQgwhaDgdjJcDAm_4kYpiPMpnOvvo9ZVQ3tU_mUzy3RdOZs1g3UCPf42FMguXKjNHWAbCQx5h2HpUX89J_SjGoOh6kseurPX3WgCn8sLpb71JfOcM3M3SUe6gzHpq449VrSnCfGoAwR-ruq9Q)

Wait a few minutes until the effective date changes from  ‘Pending’ to date.

![](https://lh3.googleusercontent.com/MuGCHdQwGbHCdbAo0XuQ6cJX5FPDxcBari8Ny6RlnkgUU77_z5DWgCWeGWyMLypFwxn-ly8Utrmr-S8RBoyohplV1Z_yKVIXzGnuTB6pGOLNm6SjdKUR4HiMxQzwvNh8MaX7F1oWu_HLM7gAOw)

![](https://lh5.googleusercontent.com/zV29PRCOiOZ5J5jMtPjuujtslbOHQIiRoCb3PeHNTVgnGLn49MFka7MAFRK6bJzprfk_Tjzke_UvuOwWmoHUVcEMPjKz9D86DYsrqatBkKH4QKXHKhkI4XW4jdkYUqTy96jPtzr40HGKwA-dCA)

4. Subscribe to Panorama

Click on the link below and the page that opens up, Click on “Continue to Subscribe” and then Click on “Accept Terms”.

<https://aws.amazon.com/marketplace/pp?sku=eclz7j04vu9lf8ont8ta3n17o>

![](https://lh6.googleusercontent.com/tQIONPA893OaFfO9zjJXeMK9_YRekQ4h55-ruYDn0xloeJZo2LtSUwTYvw4UNhAiY2NldqQ3KXgAvWHn93qauZmPzljoTSkQIbulzzijTW9ZP329C2u9biAOzg-Ee82kql-N3R6-Xvd3smBiww)

![](https://lh3.googleusercontent.com/T4EBNfNzDMdM-BAY4Nhfd1-ipe1XVJO0IPxuFhCgfsVytnnwVvkxW_4cHuu7rAa2ufvlJPiU4WKQQT2SAfAF0A_QRw22DslK0mjkScZ7PehAl_uLYmlbLQJp9pNqETTapStwqvCBQ5oY49J3Lg)

Wait till Effective date changes from ‘Pending’ to today’s date. This will take a few minutes.

  


![](https://lh5.googleusercontent.com/70JzX_YRdGWPbkTyd0zfqMxn2a03_RPBM1XRpPwKUZwWiZJG23jfMo8EgkRLyFkiLbBRZuJ8S8eyfBJRv67ZIXMQgWZX0CN9YePXbyhulZ0ed9yB-vteOk_PMEAR7Ka7MUeCQUh1Vnf9a9ZdBw)

5. From AWS management Console, launch CloudShell using the icon on the top right side of the console

![](https://lh4.googleusercontent.com/zaA96gngVFLfZEFqxicim3fA1HCvMfqxWTs2vJS_ddNJtItNCdG_Qvt8p8HI5Z5_pQcka5Bkyqn3ijk2kB6IFA3aAFH2cMc7PrMJVqjy5-w6Cw54pSY8Bm46HFAgs5nNk-txCUKczqCLyxN59g)

If you do not see icon as shown in the image above, please check the region and ensure that you are in the _N. Virginia_ region.

6. Close out the welcome pop up.

![](https://lh5.googleusercontent.com/gPb9mzAzIW5fA0uy2IwJwbdw-8RPU_uqI2Gvg1c4alcWYSPzgAEvEGSX_SkzCrReTqWPJW6lkKHgHGcgGEBkZ92OWiHhiv68HckGpQyO_tKjPm24sWUmnWZIYEINPFcQmbAWzNEUSlgI2O4Epg)

It takes around a minute for cloudshell to launch and to get the prompt as shown in the example below.

7. After the cloudshell is launched, we will start by cloning the following github repository

```
git clone https://github.com/vsrkrishnan/panw-zero-trust-aws.git
```

![](https://lh4.googleusercontent.com/bvCP9-cLZzEAomWUufK-wianRBAkPDCYGpHuNDgr1hDmxuWGLCQ7_q39_IEHmwLzV1lvtHADvoy_tmlM4Y4SCCNDeNyLYR9b0Zc-3jRsxwObKn6IBNckqVRjC-bb4e_M5e5Nyi3wrmbkDzVWmw)

**Figure:** Example of cloning the GitHub repository

8. Change current directory to git repositories’ root directory

```
cd panw-zero-trust-aws
```

9. Run the setup script.

```
./setup.sh
```

It will take a few minutes  (**~5m** ) to deploy all the lab components. Status will be updated on the cloudshell console as deployment progresses. At the end of deployment, you should see the message “Completed successfully!”

![](https://lh3.googleusercontent.com/WstG6yaXKOZ2rVfDBpuBOfXjLWRWvOAJZKqNR16aucjX0fWWV2QCKafAoAi8-HEcvd7xwZvJHZtMNyd29cK6N_IzJXPEsgSAVD0k5XeHkypU2A8hqWio6XonCReAQPxkk6dnCoR5e0uX-5R2Hw)

**Figure:** Completion message of the Lab Setup script

10. Review the deployed lab environment with the topology diagram shown below.

![](https://lh4.googleusercontent.com/ovjw7aJZDEi9HbAC94AGIpV1QwhCnQ5TfvSX_mNeD9FOe1y5zwZe_Wi_l6mUH8_dStFLmAiBwe0ErRfqUT2oD_tM59MXMpz_2kyUQOD3cbLu4MEyb-jNNXpgHBOjET50VBt544kKcrxamzZCJg)

**Figure:** The Lab topology that is deployed using Terraform

11. On the AWS Console, on the search bar at the top, type VPC and select _VPC_ from the listed results.

![](https://lh4.googleusercontent.com/mp-RNB3ck6Lj-85GOzNm9sG-vCluwparalw4BzafJwS_NCbsnghPHNtpLfpDr3A-zfmTakhthTA_yQsaFwK2K8tOsAqeSv7XMzh3AgG6Voo8mv9POFaVAt4KkhenjFlDfd4k0mukDMHqj2cpwQ)

12. Review Four VPCs created (5 including the default VPC).

![](https://lh5.googleusercontent.com/ChKIX_BTX7zTkpvO5ZjNcyhd2dGOBYlGh7XD2bNT2dmHF2sMkof8ipdbyZ78814pXCH5hUaMUDXlKNYeD1N8-lxTGEJFxW-0JLDr0m9NBxozMKjpfQyDzqos9vDUeXJ3HgkJyNRzk3lT-ZtUSQ)

![](https://lh3.googleusercontent.com/TYF1tOSe0x8nngjRFWG4PmVRYhGhXkZZ-lTvJql7uvwLzx4F7C85_FzZ9wkaoWrpPlG_5hRGS2GAmnT58nLLY7R_tnQ0r07sdcNG2YJtvMrlu0s9YkG4g2DVOsJLQ4KGH2xaAzOOA31lXZ2yMQ)











# Activity 1: Protect Against Log4j Attack

![](https://lh4.googleusercontent.com/HWA53_4c8Or1SLsDdXTIcpZmm-JKTCCjceT4VY7hcKlO7bLGW3zsGznC0ZwPFSq_1K0lBrueMngzRg4UEUQOVd1YKV3UdU0f1SAr_jQevzriOZG6nLwY2ulkPmDw26R3PjgDr_T9zqwSYedGbw)

**Figure:** Zero Trust Policy Blocking Log4j Attack – VM-Series

In this section we will configure different ways of securing your Application environment against Log4j attacks. We will leverage application identification, malware and vulnerability protection to block attacks to deliver a multi-tiered protection, based on best practices.


## Set Up the Applications

In the lab, there are two virtual machines deployed - ‘**vul-app-server**’ and ‘**att-app-server**’. We will first start the application on the VM ‘**vul-app-server**’.


### Note the public IPs of the app servers

1. From AWS console, navigate to EC2 instances.

![](https://lh6.googleusercontent.com/ms5NVpTwna1Zp16icr4mJgXgyZLWolDs7zOEFWbP8zzB-h3K9Nnx-yGy9RpQ0OAOEJSwX2nhkRM8rQQCapLJvoZ8EQMVbPnaqrfxYq8k6eZyBIR5-hKjhumc1WKpftq_d6NPkcRBhaZV1n3iGQ)

![](https://lh4.googleusercontent.com/CAjOsE24ybyABjdewZJCQwEaJ06lqk2czf2SKP-dZ3LBBe5ej3AZ2jjDE6gT9D0g2bLG7fy7DEqq-oD417L8Dhy0eQSFaP1jSYlfSwWsIwiShJioZcIqJGIrTT_hfiaECiLfYaqeAplAQNsjbA)

![](https://lh5.googleusercontent.com/sO4ymkqg6bVIltEgtPArljtNCIPCj4jmZKa5GGvPNbyPBLBsNunEPqtifB8bIFQu1Ia7LlIro5Bkxqxc0Us6K03SwtRxZUEtv1DGFj2GzFTEkgANpEV6Y24_hGCqcqeXoiJMObbHU42QaS7Xzw)

2. Note the application ‘qwikLABS-vul-app-server’ and its public IP address in  your environment.
3. Similarly, note the attacker ‘qwikLABS-att-app-server’ and its public IP address. We will be accessing these applications via SSH to their public IP address.
4. SSH to vul-app-server.


### Connecting to the app servers

We will be using the user ‘ec2-user’ as the username to login to these applications.


#### Using the PEM file

1. Launch terminal on your MAC.
2. Navigate to the folder where the pem keys were downloaded to.

```
cd ~/Downloads
```

3. Substitute qwikLABS-****.pem with the PEM key that you downloaded and run the command below

```
chmod 400 qwikLABS-****.pem
```

4. Substitute qwikLABS-****.pem with the PEM key that you downloaded and run the command below.  Username is ‘ec2-user’. IP Address is the public IP address of the ‘qwikLABS-vul-app-server’ that we noted in the previous step.

```
ssh -i qwikLABS-L****.pem ec2-user@<vul-app-public-ip>
```

For example:

![](https://lh4.googleusercontent.com/lE_hsRckiRmYnPmaPOsOYFJhcT-fu0G23tD00DZG-Jbb87jDsVE2H91t5KLtylufLrgGOB0yhboi7-PcxivERhdZ9yJMw89D86445tTTjHW3huMg8pj6k1ns99Ry5yqF0uToXBcVZdSm_cvo4A)


#### Using the PPK file

If you are using PuTTY to connect to the servers, after opening the putty, 

1. On the Category menu on the left, expand SSH and click on Auth.
2. In the field to select the Private key file for authentication, browse for the downloaded PPK file and select it.

![](https://lh6.googleusercontent.com/9fH3wvhqsD45_7s7OyVfRH70OxnHMohBN1vQq4DNmjaiRRey8_L4axFMr4ktKOL9obQxzkvzmCWgMKRTvHOJWc-DZ1yhRYHNLcQRYZ-1AmKoVDCJPEjYZbvKcJfvYNeHmWtwc-jloI3dr-LiKw)

3. Within the same PuTTY window, on the Category menu on the left, click on Session and provide the Public IP Address of the vul-app server as shown below.
4. Click “Open” to connect to the server.

![](https://lh6.googleusercontent.com/CiexE_cC28v_R_AxmNZoueyJtyZweE6J0uWnW1jvfhiHoqlJ0fZrfM_5G9PH4EE9bNJd1n-DzByFp2yIJY0UEcZKiDaNy70CGdYbUebnkHsau5wERIKp5QftB83zf95FwOmiHPxaSkjvXe0OIw)


### Set up the Vulnerable application server

1. Use the following command to start the container application at the prompt. This will be launching an application that is vulnerable to Log4j.

```
sudo docker container run -itd --rm --name vul-app-1 -p 8080:8080 us.gcr.io/panw-gcp-team-testing/qwiklab/pcc-log4shell/l4s-demo-app:1.0
```

For example:

![](https://lh6.googleusercontent.com/PlZ07SQfw-t-Ix0NdcFJF1B3h0n0kBTXyLrnzlwmAgp1rEuizKvTRbOYto4IX3cfGpskrgc3NYnLg2v-eORGXEtDsTTOB5x76pdwhg8M6bgOhhmE82U97z8SMuwnPsx057IPkfG2GL07JoZbJw)

2. Verify that the app is running by running the below command.

```
sudo docker container list -a
```

![](https://lh3.googleusercontent.com/zckkio_EIMo3cTNN-BeHUfyDkCKdn0PhdwBO9B6_soZVkQF1IrFINt0qvYaBAUYWmNYbg5KcaHpQd1aSDI6qQTagAvRHRa93upjgzITralciL9ouLYnvWn4tkYBu2eqsxvPi-06Z9Y5sGQsiCg)

3. In this lab environment we do not have a DNS set up. So we would add an entry directly on the pod hosts file.

```
sudo docker exec -it vul-app-1 /bin/sh
```

4. In the ‘/’ prompt vi to hosts file

```
vi /etc/hosts
```

5. Add an entry to the last line


1. Vi instructions are as follows:
2. After opening the file, press “i” on the keyboard to switch to “insert” mode.
3. Add the line as pointed to in the image below.
4. Press the escape (Esc) key to exit the “insert” mode.
5. Press “:wq” to save and exit the vi editor.
6. To verify the update of the hosts file, try to ping the att-app-server using the hostname (att-svr) provided. 

![](https://lh5.googleusercontent.com/6XsjoQazPOjT1-KyO9stV-4OGggqHYgHAGsPvj-M0M0NYMxiLcqxPR2etsjfS7lQMR2plpxTL3ArqNOKso_HXkAe-I3TiLigkhR0kk5hL-K1HyX1nImx3590yLz4g4j4udt6woA5SVa5eJllrQ)


### Set up the Attack application server

1. Substitute qwikLABS-****.pem with the PEM key that you downloaded and run the command below. Username is ‘ec2-user’, IP Address is the public IP address of the ‘qwikLABS-att-app-server’ that we noted in the previous step.

```
ssh -i qwikLABS-L****.pem ec2-user@<att-server-public-ip>
```

For example:

![](https://lh5.googleusercontent.com/onZqMxmqJeEF64AQU6ZMaWYT8lNciXtUeCqJz7E76LwQPE4gO-Ej7RNuMmnf-WqznchlFXHhqr-LMDgCP-Dp_Cn5wA1V96T7GvW3Gjd2LOG8lB9_kTAypKMLDM6a8Cx1xZ2ONXuAkzJ5-brnOA)

2. Execute the below command.

```
sudo docker container run -itd --rm --name att-svr -p 8888:8888 -p 1389:1389 us.gcr.io/panw-gcp-team-testing/qwiklab/pcc-log4shell/l4s-demo-svr:1.0
```

For example:

![](https://lh3.googleusercontent.com/zMMppWONgKT8_4im5EqQ2X3fRRB5BrMFlqbM62mLcKvJ7IS-CcZIxstoIu5SuiCvzZGe3tlaAB-b-wDpj_LZmeceY3WV6tg67GGlbdySJGf_OgtFwG_Fge-s4pDLrzEtuQEQT0vf8RBoOmzIAw)

```
sudo docker container list -a
```

**![](https://lh5.googleusercontent.com/0f-dlNYpVO-INwf0Bns8e9I8ffr3wRX-wsfmFpBr-8Uzbk9yJGayYvJobVvXfw0QfJLWF1JoCtfU7G5ACIQ6ier4PdyPaqXgLMoQr3bIGBIU7WArAhRzDg11RsEA4y22WqsHZdZHn6sUDJNJ8w)**


## Log in to Panorama

1. On AWS console search on EC2 and click on EC2

![](https://lh5.googleusercontent.com/OBL9GK6y6Z1qiUEgxd94TeMZHOCjQRf3nNR8b1bliUbz_cP_N4t5AlAJZsADGYPCV-v2rYjkmjv-gvQFlAGdYe92dYwE2xf4fPSqY1ZqzuOg_fIwaVKyKb6DdQW8oPxCbY4fZA84qqWmAwymJA)

2. Copy the public IP of Panorama Instance.

![](https://lh3.googleusercontent.com/tGDyzDocHaz5Y7JyAR6sK_OYtXGHUzKKYkWk71MaRVU7ixFX2EkCjW2hTScFDJDxaf4RVFr_dwNRiTQIOPn1lFp0olIdccJmYZGaI9LgPjvgJRiYv2o-e1DGN1IR96FFPrTNQyaGFhsnOpc_WQ)

3. Launch Panorama on a new browser tab by typing the following on the address bar. Replace &lt;panorama_public_ip> with the Public IP address of the Panorama instance.

```
https://<panorama_public_IP>
```

4. Username: admin
5. Password: Paloalto@1

![](https://lh4.googleusercontent.com/y73pmPtKXm7LkZ6382noBKvOD8y3ypr_MmXl8f7HKg-JrMFd6_Wq74GmBN5LwrNOJGeQMd8HuXBks2dyqFzeNGoPZB12fLZHHkh_0JxPNlxBSa7zxVOxgEfX_CCuI2tSxbvi5WhY39ZKuRGvaQ)

![](https://lh6.googleusercontent.com/GmOgYOoxYPXNs3CiHsItrA-ZCoxxZo9xnbmvGMM9YSQDj0H4uCsj1E0L-cmVCxZV6eoCg1rjybHQctp71fWgh5zoCEL5q7mxoAfPGc0mcOFefhm34cbwNDwvW9f62nnBNUd7Xy58_I4-CXkhTQ)

6. Once logged in, navigate to the _Panorama_ tab, Click on _Managed Devices > Summary_ on the vertical tree. Ensure that PA-VM is in _Connected_ state.

![](https://lh6.googleusercontent.com/i-JROgmPYbQhzT_7A6W8zMvQAdmuS3LEBSFsk8y4yFt9sNvtEmxoxgNonqhx-oxa1eQy_rs949GzE0t38y-B079fqfda7Nx_nXQheWh89ySrwngTEKTBy-2eA-DPWZ_ywrlXOHWPqhs81o_RVQ)


## Launch Log4J Attack

1. On the **att-app-server** command prompt, execute this command to launch the Log4J attack.

```
/tmp/launch_attack.sh
```

2. You should receive a ‘**_Hello World_**’ message back.

![](https://lh4.googleusercontent.com/o1osDzFRPbHskkOZojHzldCmjUklRMADhGLH_3FKmN8snvaHLvzW8M8RBu1nY6RG_JNBFmAwAGoK8z5LKyfhIStqbr8f4l4VZ8NurkrRZV22U2hxh40Zr51YU6E6ES_xQxp94qQitzsgn5l1Eg)

3. On your Panorama tab on the browser, navigate to Monitor > Traffic

![](https://lh4.googleusercontent.com/xMMtW4mfivpaLoaqNrlgxpaO-vy56qIF2amHgskO__BdP9fMHeFIWVu1dPYS1wOfkSZcLymT1MeyiuplcBn7bJQDKmPzWcbLodcgDs8QjqBc92LgB8tW4IYiFMRlw5EiOk7Lz23dUVLtdR_Sdw) 

4. Notice the 3 sessions associated with a successful Log4J attack.

- att-svr(10.2.1.100) ---> vul-app(10.1.1.100) --- port 8080 (web)
- vul-app(10.1.1.100)---> att-svr(10.2.1.100) --- port 1389 (LDAP)
- vul-app(10.1.1.100)---> att-svr(10.2.1.100) --- port 8888 (Malware transfer) 

5. The application has now been infected by malware. On the Vulnerable application execute these commands:

```
sudo docker exec -it vul-app-1 /bin/sh/ # ls -lrt /tmp
```

For example:

![](https://lh4.googleusercontent.com/LiSSEBo_fXsnA09lGQnLuQJB040gF2lxxKWjkSgiY9CfRMC_L8bKYRS2xoEGQJ2jfe9_0e72VMl_WzqeAo9dX6RqLtLzZvhNWb1BKk11e87stsCzxcN3qcZKipxJ5W1FsuKIGcT3ncZqGyJGNQ)

6. Remove the malware-sample file for subsequent tests.

```
rm -rf /tmp/malware-sample
```

![](https://lh3.googleusercontent.com/854NRUYFrRLd2IkB24xwHXQqrS8hRIAR1IBXusZuRQBNakVXCoQehJ9QezYQjXL0WXov-ej3ZILJ8GUB4pDGnEIe5iM8we_GFQYL7sOY-p0ns-RaYUSaK6h6b_6nN_y_QaPmNR5XpEXY-iTTrg)


## Best Practices for Protection against Log4J

In the following sections, we will see how you can build a policy model that will provide multi-tiered protection for your application against Log4j attack. Multiple complementary security controls across our portfolio, combined with best practices, can help protect organizations against the vulnerability. If your organization is already aligned with our [security best practices](https://docs.paloaltonetworks.com/best-practices.html), you gain automatic protection against the multiple steps of this attack with no manual intervention. 

In the following section, we will deploy best practices zero trust policies to  protect against attacks. We will deploy 3 policies one each for outbound, inbound and application based protection.




### Deploy Zero Trust Policy for INBOUND Traffic

1. On the Panorama tab on the browser, navigate to Policies tab. Ensure that you are in _Shared_ Device Group

![](https://lh5.googleusercontent.com/6EjqSbcy5hf3Ti2RvMVQ0EX9Ob7UqN5rINohtuwCXY6K2mySe2GnlobNDU7umPhvAfYCIblklVL9Ki0oWPMPvNi5v_XqkKLIkppH3KLIwFh7Sbw-tNI7vJuWVDM2vOzZO8cR2IcXNR5gNh03Rw)

The policies will look like this.

![](https://lh4.googleusercontent.com/37OP0V0aFPoDvcNgq7yHZlcPwiR9rRfM_NaWjoq9y6A5zCkzUMP4I9yHn7TAJNxMfIEIwzR_ceZivkoFuXYeLc-0fiLzrAw3_CpBVtTa4_sJpejB9Z4ykAn1mXKAn11DOIwswz2gHiYWftAz1Q)

2. Enable _ZT-log4j_BLOCK_INBOUND_

![](https://lh5.googleusercontent.com/w46qtnSAZTtVkSQiJSMa0elR6KELAOa5Xfb4ghSBYDWBnW3Ue2iWdkSwBoKwDXUSKw9-tOdt8ls2a2rQFk8dyg3eUBv3wt2_XsoLSnTMi_BzsJoaCr4hgLrcAzFTALqiaXyFQzqvaEpcNJK4Hg)

3. On the policy, Click on _ZT-log4j_BLOCK_INBOUND,_ navigate to the ‘Profile’ column and click on the icon shown there. Ensure that ‘Strict’ vulnerability protection profile has been enabled for this policy. 

![](https://lh4.googleusercontent.com/v8diPIdJQJSfv-dRPPCBN6NmYGbx7iMZ0YCeagilhEbIgsEPtcU4ZLqaG3BiA1oJ1KChQ8mEua5RW7wrXlAvj_BaRz5jRGnr0k9KgvMc7pGgGrB35nSvgVaPNl2dHAO6K_ZulbTIAdjSvC8PfQ)

![](https://lh5.googleusercontent.com/kEtPhiWXSxHZcApfV3ke8JWK97ogdbHRBq3Pbbo349Ap0O2Or9Vq7A3ziumjJrStV0IWdBvrpv4uJNv_48G3quUjlMuMQXvpGLkFR6pmrQZtWk32kM_qGZwUrhIb57_YnN_aQGCrDJPv0A-amA)

4. Click ‘OK’
5. Commit the changes and push to device

![](https://lh6.googleusercontent.com/_uQNaIcHOjp1kWYBIB1ngwSNyS6mRMmoYl7agYQj5FdwbWcjaZNLjH_pHhqvifkGHK79Pz1Nini16Jm8fl1HEF3XRtZYHh4tBlX5O4K2LyMe3x4q8HRxH0nqCXGA-dXZTgnwZwUI_uef3i__YA)

![](https://lh5.googleusercontent.com/jFKkrnIstAAO24Vd0Jwe26pwtx9o8XjY56FeDx-efl9SgnG9SrQZsEQVnw5ucGZV01k-Afms0mTeiknFSBUbsokkPe-pgqs87gJCw1Iru9f7JS61hqJp0xdf3tPlFUBxyKuE5M0JSkyoxEwoLQ)

![](https://lh3.googleusercontent.com/mVRtZcskm_t_O6VQws89_abTLgLUo4gg6s0-oZ68M4wgM8UzDrImdVFJh1LqRSiko16TQUnziZl_402LiVKckHieXf-CMByHM9bKd_BATEBOsfzAuk49ATHdhGHUAhSGnFe-U-bRA9lAqubvBQ)

6. Wait for status to complete.

![](https://lh3.googleusercontent.com/NeuKVelSEAmmKIgoRamL2YCBDAavPv46jjyHYNAaLkUm70_3AEBGjy7rHWI2dMiewDzNjczHqJDKFsjd0J_gsBtGx7kPuxG-UI5LR081NlixBg-1ASudUU77eSkVqxzSWRhGwti9katVxCBL1w)

- If you see the message ‘Not all Commit-All jobs got triggered”, close the window.
- On the top right, click on Commit again and select ‘Push to Devices’

![](https://lh6.googleusercontent.com/h6WDJaot1RCFmrvFZ3wKYk46TovROQfODEqJhV40VBVe9d7tTi6fgR3iPnknyW8ihslg-Xfijre-JJZ_q9DfhHc5OjGMXnml-jyeqqcN0TNBV2B04Zey3UmRqsI1M_rEUAlpBBMugUsdJ1WU5A)

- Click in ‘Tasks’ button![](https://lh6.googleusercontent.com/k8qzwKTAjZOv8HkjOYRuv12KozmTRnFJhszL3Jbd_mQI1AY5g8fP_hTv4sL6WLiaFiKEMkwAk6pBc9Q0PJmKv89F8P8Jo5O1egqOxwccPrwRrNhKB5VoaIzsE9V2OjxxWCSmbdCqGevrHjjRiw) on the bottom horizontal bar and ensure that ‘commit all’ job finishes. Click on Close to exit out of the window.

![](https://lh3.googleusercontent.com/xpWgoWdlpKKbTdXkjd37fSFXLP4mRaj-OI65zMymo0S2p3J1K-HwfO7CcnimeR-_-F6zzuhI7JLVYaUeD2u25Ep5u744IUBrTsyUTxeUKqVmoPrAmcfJwaPt8ZzOTRvWURGSx9tOtQCIpk85BQ)

- Ensure that all commit processes are completed by monitoring  ![](https://lh6.googleusercontent.com/k8qzwKTAjZOv8HkjOYRuv12KozmTRnFJhszL3Jbd_mQI1AY5g8fP_hTv4sL6WLiaFiKEMkwAk6pBc9Q0PJmKv89F8P8Jo5O1egqOxwccPrwRrNhKB5VoaIzsE9V2OjxxWCSmbdCqGevrHjjRiw)

7. Relaunch the attack by navigating to the SSH session on **att-app-server** and issue the command.

```
/tmp/launch_attack.sh
```

8. This time we will see it does not go through

![](https://lh3.googleusercontent.com/lciM1nP1a8yBPxW6BzqWj91IUIhc0MOYDe5lPDTJerY_3Fq3pOJYQbMPR5fYOr_82PnU_2bnh-9z9MwuKmfUdiac4Jxt-f8-rKP14QWzRjluX_EUp4sNIrARvxF8LvJPyBkLv_ZBwLRaoeiuxg)

9. Navigate back to Panorama > Monitor > Threat
10. You will see that the Firewall detected the attack and blocked it.

![](https://lh5.googleusercontent.com/FhLJ1GR6Scj7PDaHkYuYs5SgFckEsKUXHzUhxNUcNSkIzv8Pb8scGpcIRCZwoM4yCHkSywpg3MRrN1xiyjWWOHAA97HuP7dV3Evn5IDWEERc0cFhODwoXJXJtDolwyA5h58ShjjlgbPC2JODcA)




### Deploy Zero Trust Policy for OUTBOUND Traffic

The Log4j attack requires access to malicious Java code hosted externally. Our Advanced URL Filtering and DNS Security service are constantly monitoring and blocking new, unknown and known malicious domains (websites) to block those unsafe external connections.

In this activity, we will use a policy that has both the profiles set to protect outbound traffic.

1. On the Panorama tab on the browser, navigate to Policies tab. Ensure that you are in _Shared_ Device Group
2. Disable policy 1 and Enable policy 2. 

![](https://lh4.googleusercontent.com/08ASpCsIoJbCFobALl3m28plXzweT-for91BiBd33xe8R8qQsRAKcJnWfLhF8zDO-SNBydt_dQ3qSRYEQNc9jCZ06UmObmwccXODJO3xs9R6i0PyFm7LfBfXhIng6hc0ZS3IK_JVRQTGvdUO7A)

![](https://lh4.googleusercontent.com/WS4Jicolsl_dJlpvgQ5RqORrDieZrCnf-khcy6BzMBN1Z3iBZttRkvOZeki6j6hHeZyM8tFs6EgSJpqv0wjNaBqjCbaKGqRanbL6AIUB-RI4W_nMPta3N76Bf8FMqjFG2IsDldocuVd-8y3W-w)

![](https://lh4.googleusercontent.com/T7j_ceC1VUMYd9waBbs66P6atxIzmoRx27GOFP7m0x8UZl7fFxaLNs-ZPT6sq75mQLiY26XI0JVgpQQdVckX9xQAYRh8rrxSED2I-mxOPQEOO_3tGWOgDT94nmYjyc4DYu5xlBclXNfezsKe_A)

3. On the policy, Click on _ZT-log4j_BLOCK_OUTBOUND,_ navigate to the ‘Profile’ column and click on the icons shown there. Ensure that the Anti-spyware and URL Filtering profiles set.

![](https://lh6.googleusercontent.com/lXBRhaoU0et87UXIHmYo0DMOu5OT-rZS2plzNi0qf4_Smv6aI27fQXPB_NN4EoLnaGBYpA9qcRdXdOUJrgSsXqMHjh4xjHdn8MsNNXj4GLNysk7SvZVJABQXhokazOLy0EZiDU9ucIELfkEUGQ)

4. To view the profiles, navigate to Panorama > Objects > Security Profiles>URL Filtering

![](https://lh5.googleusercontent.com/EWc24Q7jG7KUaGVhqL2KI3z4At5IKQf_4H4rZXj9-uNLzV3X8Oct843eQ4-Ns2-KyYCcZL16c5xA5PnqA78Hcsl8HFlkj1H3BZgs-zPGar_STxmgFPhxlIiqO5EHRxO6s57UeDftVt9S6KeNqg)

5. The profile follows best practices recommendations for URL filtering.

![](https://lh3.googleusercontent.com/uzStP7utawWUnQiRHZ-sV56_jXppu80Cn8KKGaRHKM2hESL4SMRYdBN0DQT1eAxsTYYeEUyd5UGN0TPsbDeXTpzkC_yrWfR5VvlKEA1ayNYf8T5Qnmj9HO0Hlmk_NtVXlY0TQCPjYksKDbBpRA)

  
  


6. Close and Commit the changes and push to device

![](https://lh3.googleusercontent.com/dHtenpLaRpaacFnCxqlq7AyioGTtds6s4Rf_yayv9K8djV-VKjQQTC--iBo2vSOxqkX9mW8Fbhuo3MQMPppkiauk4UvdoUsRh_HRFpkeOl3nDG3Zr16ltdf9ZTBg7RcoaiF0UsG3Cz-rJk-EtA)

![](https://lh3.googleusercontent.com/mVRtZcskm_t_O6VQws89_abTLgLUo4gg6s0-oZ68M4wgM8UzDrImdVFJh1LqRSiko16TQUnziZl_402LiVKckHieXf-CMByHM9bKd_BATEBOsfzAuk49ATHdhGHUAhSGnFe-U-bRA9lAqubvBQ)

7. Wait for status to complete.

![](https://lh3.googleusercontent.com/NeuKVelSEAmmKIgoRamL2YCBDAavPv46jjyHYNAaLkUm70_3AEBGjy7rHWI2dMiewDzNjczHqJDKFsjd0J_gsBtGx7kPuxG-UI5LR081NlixBg-1ASudUU77eSkVqxzSWRhGwti9katVxCBL1w)

- If you see the message ‘Not all Commit-All jobs got triggered”, close the window.
- On the top right click on Commit again and select ‘Push to Devices’

![](https://lh6.googleusercontent.com/h6WDJaot1RCFmrvFZ3wKYk46TovROQfODEqJhV40VBVe9d7tTi6fgR3iPnknyW8ihslg-Xfijre-JJZ_q9DfhHc5OjGMXnml-jyeqqcN0TNBV2B04Zey3UmRqsI1M_rEUAlpBBMugUsdJ1WU5A)

- Click in ‘Tasks’ button![](https://lh6.googleusercontent.com/k8qzwKTAjZOv8HkjOYRuv12KozmTRnFJhszL3Jbd_mQI1AY5g8fP_hTv4sL6WLiaFiKEMkwAk6pBc9Q0PJmKv89F8P8Jo5O1egqOxwccPrwRrNhKB5VoaIzsE9V2OjxxWCSmbdCqGevrHjjRiw) on the bottom horizontal bar  and ensure that ‘commit all’ job finishes. Click on Close to exit out of the window.

![](https://lh3.googleusercontent.com/xpWgoWdlpKKbTdXkjd37fSFXLP4mRaj-OI65zMymo0S2p3J1K-HwfO7CcnimeR-_-F6zzuhI7JLVYaUeD2u25Ep5u744IUBrTsyUTxeUKqVmoPrAmcfJwaPt8ZzOTRvWURGSx9tOtQCIpk85BQ)

- Ensure that all commit processes are completed by monitoring the Tasks ![](https://lh6.googleusercontent.com/k8qzwKTAjZOv8HkjOYRuv12KozmTRnFJhszL3Jbd_mQI1AY5g8fP_hTv4sL6WLiaFiKEMkwAk6pBc9Q0PJmKv89F8P8Jo5O1egqOxwccPrwRrNhKB5VoaIzsE9V2OjxxWCSmbdCqGevrHjjRiw)

![](https://lh4.googleusercontent.com/ukyei4L0TNDtlPTVjLurgdY1pcfIA7RmjGoJFNuL24gZQxZyouIRWDZ9bUaPoFvs5HPcKykzCQjEfwnUdnWNo7ti71JKyc54VST2rzJTQBkhuCu20O03FW3sXcJqt760EXiChsirb2leyzQrQQ)

8. Relaunch the attack by navigating to the SSH session on **att-app-server** and issue the command.

```
/tmp/launch_attack.sh
```

9. This time we will see the ‘Hello, world!’ message but the attack does not succeed.
10. On the vul-app-server, you will see that the malware-sample file is not transferred. On the vul-app-server, execute these commands:

```
sudo docker exec -it vul-app-1 /bin/sh/ # ls -lrt /tmp
```

![](https://lh4.googleusercontent.com/LNIW-a0WzzXJGvvD6H1UNpkuY0ARLDvZT2gXQ8TAxHiwiEhxjPOR5ilKaPw7V-Z2KGYo87FEC0_n96I1vd-7ZMWiRcVgVd_3Foz_t-TnrjGGowhfwhXAK56rp7ui1AZCJJ3W4BTZcbxvFLJqRQ)

11. Navigate to Panorama > Monitor > Traffic to see the firewall logging the web-browsing action. On the Filter search bar, paste the below query.

```
((addr.src in 10.1.1.100) and (addr.dst in 10.2.1.100) or (addr.src in 10.2.1.100) and (addr.dst in 10.1.1.100))
```

![](https://lh3.googleusercontent.com/EkPoNWml9dmhoLIfZABOTKuamFGBdlUIVKqP6Ic8CBGfpVdB0jqvuBSSP3CcLaZAUgjhuTZqCvGdzfQSvpvBuihfIEX5Yd6Lz3GVB7nOv682reLAb3cqjHiaxEpogvCGbkY2rSQSiAZD6yCvZA)


### Deploy Zero Trust Policy to Limit Applications To and From Untrusted Sources

We can use the App-ID for ldap and rmi-iiop to block all RMI and LDAP to or from untrusted networks and unexpected sources.

1. Navigate to Panorama > Policies
2. Disable Policy 2 and enable Policy 3  _ZT-LLDP-RMI_logdj_BLOCK_

![](https://lh3.googleusercontent.com/HoucB8IsyBptTnM0AguXEJYC1E1OHjXGtdboE52O5XTkJwRXKAjpj4QGU_0SzuqBd_GaPr-qJTTLZxBjGwbIlKfIMgTraYbZ-YEwXx3BGXJuQa42OoqY-ENyn-8Wg3-0QQKTPAcpDjzkK33J0A)

![](https://lh6.googleusercontent.com/j0_vGr9L5n6rM8pkQW7lF4CT5bqftDg_Sds7xOmcaBMJIz0oKrgCyLViSh-BarAXw0MCd9-KlzYzFk6WspOO_jVMITEGl7gbunEk-XVWn5AaLnfcbyyaDqsMvjyrikvM0LmIwbR0YXgPCjZQYg)

![](https://lh3.googleusercontent.com/c6W1pr_qAr1jmOO2oTAMcjkRwJSMhke8JcfZi8QJKhLHF-yTgFcAznSKq52vSQMjECJktwIOxJ7lhNn7zvY9lwfKie58TtKeEXLJkPOercsQbuM9m_ceVxfGtZKJE7X7fL5iZLOrfZNTsNLgzw)

3. Commit the changes and push to device

![](https://lh6.googleusercontent.com/6NeosoFZ20OWQe0jb51wt8w4IH65WP7C_4Pwm-FA2Aowilwl2G10ahdIHhTJTQr6cHfhtRj8PMsD7BRzDdFo1qGdZcp7_sZeuO1yav5EDwK4meQrKLKQX4LwzTta48y3xUWjHQROEUD-M4LiKg)

![](https://lh3.googleusercontent.com/mVRtZcskm_t_O6VQws89_abTLgLUo4gg6s0-oZ68M4wgM8UzDrImdVFJh1LqRSiko16TQUnziZl_402LiVKckHieXf-CMByHM9bKd_BATEBOsfzAuk49ATHdhGHUAhSGnFe-U-bRA9lAqubvBQ)

4. Wait for status to complete.

![](https://lh3.googleusercontent.com/NeuKVelSEAmmKIgoRamL2YCBDAavPv46jjyHYNAaLkUm70_3AEBGjy7rHWI2dMiewDzNjczHqJDKFsjd0J_gsBtGx7kPuxG-UI5LR081NlixBg-1ASudUU77eSkVqxzSWRhGwti9katVxCBL1w)

5. If you see the message ‘Not all Commit-All jobs got triggered”, close the window.

- On the top right click on Commit again and select ‘Push to Devices’

![](https://lh6.googleusercontent.com/h6WDJaot1RCFmrvFZ3wKYk46TovROQfODEqJhV40VBVe9d7tTi6fgR3iPnknyW8ihslg-Xfijre-JJZ_q9DfhHc5OjGMXnml-jyeqqcN0TNBV2B04Zey3UmRqsI1M_rEUAlpBBMugUsdJ1WU5A)

- Click in ‘Tasks’ button![](https://lh6.googleusercontent.com/k8qzwKTAjZOv8HkjOYRuv12KozmTRnFJhszL3Jbd_mQI1AY5g8fP_hTv4sL6WLiaFiKEMkwAk6pBc9Q0PJmKv89F8P8Jo5O1egqOxwccPrwRrNhKB5VoaIzsE9V2OjxxWCSmbdCqGevrHjjRiw) on the bottom horizontal bar  and ensure that ‘commit all’ job finishes. Click on Close to exit out of the window.

![](https://lh6.googleusercontent.com/gr1ceI-sDJHNuNp2mrXWXZjd4Ss26qk6HddbVJb88LYBnlqlaKjqDuHwjutBhM-HeGegpkheQu4HzTBTHX5puZ_CHu8AmrY02Wwwn0pHYW5jPBl8hf_ufjnRoEiwpUlqjFeyHo_fZK-uM7z79w)

- Ensure that all commit processes are completed by monitoring

6. Relaunch the attack by navigating to the SSH session on **att-app-server** and issue the command.

```
/tmp/launch_attack.sh
```

7. Attack fails as the firewall block application access
8. Navigate to Panorama > Monitor > Traffic. On the Filter search bar, paste the below query.

```
((addr.src in 10.1.1.100) and (addr.dst in 10.2.1.100) or (addr.src in 10.2.1.100) and (addr.dst in 10.1.1.100))
```

![](https://lh3.googleusercontent.com/BreWkX4nHxSsV_CxE4Nbzzev0SqR95Nzae0dWIkytjFbo1EzsuAnxpCs50oC1A_SlNSajhz-oHFPN_6AojAzv0yZvzPLLJzmJdl3JJVH5GYWWfxQ4uez7CqyoRetfpI_YUtF63bVU_wzb8iErw)


## Activity Final Thoughts

As we conclude this session, you have familiarized yourself with building a policy model that provides multi-tier protection for your applications on AWS against Log4j, following best practices guidelines.
