# Table of Contents
- [Ideas List](#ideas-list)
  * [Usage Growth and Quality Assurance Dashboards](#usage-growth-and-quality-assurance-dashboards)
  * [Website Security and Penetration Testing](#website-security-and-penetration-testing)
  * [User Badges](#user-badges)
  * [Quality Contents: Collect feedback from unsuccessful problem solving attempts.](#quality-contents-collect-feedback-from-unsuccessful-problem-solving-attempts)
  * [omegaUp for Schools: Plagiarism Detector](#omegaup-for-schools-plagiarism-detector)
  * [omegaUp for Schools: Integrate an Online IDE](#omegaup-for-schools-integrate-an-online-ide)
  * [User Experience: Redesign `/arena` and `/problem`](#user-experience-redesign-arena-and-problem)
  * [User Experience: Expand Problem Authoring Tool](#user-experience-expand-problem-authoring-tool)
- [How to Ramp Up](#how-to-ramp-up)
    + [Phase One: Complete our test](#phase-one-complete-our-test)
    + [Phase Two: Familiarize yourself with our codebase](#phase-two-familiarize-yourself-with-our-codebase)
    + [Phase Three: Writing your proposal](#phase-three-writing-your-proposal)
- [Communications](#communications)
- [Application Process](#application-process)
- [Frequently Asked Questions](#frequently-asked-questions)

# Ideas List

## Usage Growth and Quality Assurance Dashboards

**Brief description**:

Create a pipeline to display data on an existing dashboard engine (e.g. [Grafana](https://grafana.com/)) to monitor usage growth and quality assurance for our top priority features (omegaUp for Schools, Content Quality, Contests and Ephemeral Grader). Examples of analyses that should be displayed:
* User base growth rate
* Percentage of users giving feedback about problems.
* Number of coursers created on omegaUp for Schools.

**Expected results**:

Feature stakeholders will be able to access a dashboard where relevant information about their features is displayed. They will use this information to make decisions about future development at omegaUp.

**Preferred skills**:
  * Data Analysis
  * SQL
  * PHP

**Possible mentor**:

[tvanessa](https://github.com/tvanessa), [yoniihdc](https://github.com/yoniihdc)

**Skill level**:

Medium

## Website Security and Penetration Testing

**Brief description**:

omegaUp is an online platform that handles confidential information about tens of thousands of users, and the source code responsible for securing that information is open for anyone in the world to see. That leaves omegaUp with no room for security mistakes.

**Expected results**:

A security and penetration testing plan should be proposed and performed. Vulnerabilities found should be promptly fixed and documented.

**Preferred skills**:
  * Computer systems security
  * PHP
  * Go

**Possible mentor**:

[heduenas](https://github.com/heduenas)

**Skill level**:

Medium

## User Badges

**Brief description**:

In order to foster motivation and competition between users we want to make it easier to introduce more achievement emblems. omegaUp would greatly benefit from a framework that makes it easy for someone to introduce a badge of their own by submitting a straightforward PR. As part of this project, the student should use their own framework to introduce some badges. Some badge ideas:
* "Hour of code" badge for users who solved at least 1 problem during the hour of code week.
* "Legacy user" badge for users who created their account within the first year after omegaUp launched.
* "Coder of the month" badge for users who were coder of the month at least once.

**Expected results**:

Anyone interested in introducing a new badge to omegaUp will be directed to the documentation for the framework. They will craft an straightforward PR and submit it for review to the omegaUp engineers. Once it's merged and deployed to production, it should go live.

**Preferred skills**:
  * PHP
  * SQL
  * Python
  * Vue.js

**Possible mentor**:

[heduenas](https://github.com/heduenas)

**Skill level**:

Medium / Hard

## Quality Contents: Collect feedback from unsuccessful problem solving attempts.

**Brief description**:

Recently we introduced the capability of gathering feedback from users about a problem right after they solve it. Explicitly, we ask for quality, difficulty and topics related to the task. We aggregate that feedback every night and show a measurement of quality and difficulty as well as a list of tags for each problem to users looking at the [problem list](https://omegaup.com/problem/?query=&language=all&order_by=difficulty&mode=desc). In this project we want to also collect feedback from users that attempted the problem but could not solve it and aggregate that data together with the feedback from users who did solve the problem.

**Expected results**:

After a user makes a number (TBD) of unsuccessful attempts to solve a problem, they are asked for feedback about the problem. That feedback will directly influence the quality/difficulty/topics tags assigned to the problem.

**Preferred skills**:
  * PHP
  * SQL
  * Python

**Possible mentors**:

[heduenas](https://github.com/heduenas), [tvanessa](https://github.com/tvanessa)

**Skill level**:

Medium

## omegaUp for Schools: Plagiarism Detector

**Brief description**:

Whenever there is an online contest/programming course, there is the risk of participants cheating by sharing their solution amongst themselves. This is currently done in a very ad-hoc way (by manually inspecting all submissions that have similar scores) and taking into account which students get along with which other students, which does not scale. It would be very beneficial to have a report of similarity that is generated at the end of each contest/course. This can be achieved by calling a service such as [MOSS](https://theory.stanford.edu/~aiken/moss/).

**Expected results**:

Build a service that manages a queue of plagiarism analysis requests. Each request is a set of code submissions that will be uploaded to the plagiarism analysis service. Once the analysis is finished, it should be transformed in a way that can be presented to the user.

**Preferred skills**:
  * PHP
  * SQL
  * Golang
  * Vue.js

**Possible mentor**:

[heduenas](https://github.com/heduenas)

**Skill level**:

Medium

## omegaUp for Schools: Integrate an Online IDE

**Brief description**:

We currently have an online IDE of our own [grader/ephemeral/](https://omegaup.com/grader/ephemeral/). In the near future it will be [displayed in our problem page for all problems](https://github.com/omegaup/omegaup/pull/2298). We would like to integrate a third-party so that we don't have to maintain [grader/ephemeral/](https://omegaup.com/grader/ephemeral/).

**Expected results**:

Users see a functional IDE at [grader/ephemeral/](https://omegaup.com/grader/ephemeral/) and at our problem page just below the problem description. omegaUp engineers maintain the integration of that IDE but not the IDE itself.

**Preferred skills**:
  * PHP
  * SQL

**Possible mentor**:

[heduenas](https://github.com/heduenas)

**Skill level**:

Easy / Medium

## User Experience: Redesign [/arena](https://omegaup.com/arena) and [/problem](https://omegaup.com/problem)

**Brief description**:

Improving the UX of omegaUp is one of our biggest challenges right now. There are currently undergoing efforts to redesign our homepage, which is our most visited page. [/arena](https://omegaup.com/arena) and [/problem](https://omegaup.com/problem) are our second and third most visited pages. Both existing and potential omegaUp users would greatly benefit from having the user experience of these two pages improved.

**Expected results**:

Returning and new users should find [/arena](https://omegaup.com/arena) and [/problem](https://omegaup.com/problem) engaging, functional and easy to use.

**Preferred skills**:
  * UX Design.
  * Vue.js
  * PHP
  * SQL

**Possible mentor**:

[yoniihdc](https://github.com/yoniihdc)

**Skill level**:

Hard

## User Experience: Expand Problem Authoring Tool

**Brief description**:

When a user wants to craft a new problem and add it to the omegaUp problem base, they use [redaccion.php](https://omegaup.com/redaccion.php) to write the description. Right now it is a very basic tool that let's the user write the task description in markdown and shows them a preview of the text. Problem authors would greatly benefit from having a more complete tool to create/edit problem descriptions. Features that the tool should include: multi-language task description writing, upload/download zip file with markdown files, update images,  etc.

**Expected results**:

[redaccion.php](https://omegaup.com/redaccion.php) will redirect users to [/preview](https://omegaup.com/previw), and it will be a one-stop shop for problem authors. As a stretch goal, it will also be integrated to the [problem create](https://omegaup.com/problem/new/) and edit views.

**Preferred skills**:
  * UX Design.
  * Vue.js
  * PHP

**Possible mentor**:

[yoniihdc](https://github.com/yoniihdc)

**Skill level**:

Easy

# How to Ramp Up

If you are interested spending this summer collaborating with us, first of all, we're honored that you are interested in our organization and we want to make the application process as smooth and enjoyable as possible for you. In order to familiarize yourself with [omegaUp.com](omegaup.com) and start collaborating with us please follow these steps:

 - Visit [omegaup.org](omegaup.org) to learn more about our work, our vision, and the people who are being benefited by our work.
 - Read [this article](http://www.ioinformatics.org/oi/pdf/v8_2014_169_178.pdf) published by our co-founders to learn about the architecture and overall design of our platform.
 - Join our [slack channel](https://omegaup-slack.herokuapp.com/) (token is 'GSOC2019') and greet fellow candidates and omegaUp volunteers.

# Communications
## If you have questions about the [development evironment](https://github.com/omegaup/omegaup/blob/main/frontend/www/docs/I-Want-to-Develop-in-omegaUp.md) or the [codebase](https://github.com/omegaup/omegaup) or how the GSoC application process works at omegaUp, please follow our [Getting Help page](https://github.com/omegaup/omegaup/blob/main/frontend/www/docs/How-to-Get-Help.md) to effectively getting your question answered.

Communication with our organization and fellow candidates is carried through our [slack channel](https://omegaup-slack.herokuapp.com/) (token is 'GSOC2019'). We encourage you to join it :)

# Application Process

#### This year our application process consists of three phases. If you want to participate with us this year, you must complete each of them in order.

### Phase One: Complete our test 

 - First create an account at [omegaUp.com](https://omegaUp.com).
 - Join to our [GSoC 2019 omegaUp Test](https://omegaup.com/arena/gsoc2019/). The test consists of three problems, you have to solve any two of them in order to pass. In case of plagiarism we will disqualify those applicants involved.

### Phase Two: Familiarize yourself with our codebase

We ask that you complete phase one before you start working with our codebase.

 - Follow these [instructions](https://github.com/omegaup/omegaup/blob/main/frontend/www/docs/Development-Environment-Setup-Process.md) to set up your development environment.
 - Find yourself an interesting bug to solve from our [issue tracker](https://github.com/omegaup/omegaup/issues), or reach out to the [slack channel](https://omegaup-slack.herokuapp.com/) asking for one and we will be happy to find a good fit for you. Most of the conversations in the issue tracker are in Spanish, but feel free to switch the conversation to English on any issue. Alternatively, you can go and find bugs on omegaup.com    yourself, then report them in our issue tracker, and then fix them.
 - Implement your fix and submit is for review. Once it's merged you can move onto the third phase.

### Phase Three: Writing your proposal

At this step we hope you are familiar with our development environment and code since that makes it easier to understand our project ideas. **We ask that you get at least one PR merged into one of the omegaUp repositories before working on a design for a specific project.**

 - Craft a design document for your project using [this template](https://docs.google.com/document/d/1_FKfpc2M3VLDVYqvT8ZgsgwIJ3zaZnyUVmSm-H3h6UQ/edit). If you want to work in more than one project, we ask that you mention that in your application but include only one design. This is to reduce the workload for reviewers. Starting this year we also accept proposals written in Spanish.
 - We also encourage you to **send us your draft proposal to review and give feedback**. Send the link of your draft to `googlesummerofcode@omegaup.com`. Make sure that the subject says _Proposal_ and that anyone with the 
 link can see and comment.
 - We will try to provide you with as much feedback as we can and as soon as we can. However, we will not provide feedback to candidates who have not successfully completed phases 1 or 2.
 - When you consider that your application is ready, don't forget to **send it to [Google](https://summerofcode.withgoogle.com/age-verification/student/?next=%2Fstudent-signup%2F)** because if you don't do it, you will not be able to be considered in GSoC 2019.

We will only consider candidates that finished all 3 phases of the application.

# Frequently Asked Questions #
* **The development environment installation script is throwing me an error.** Please follow our [Getting Help page](https://github.com/omegaup/omegaup/blob/main/frontend/www/docs/How-to-Get-Help.md) to effectively getting your issue resolved.
* **Am I expected to speak Spanish?** Of course not. We try our best to be as inclusive as possible to non-Spanish volunteers. Please feel free to use English throughout our communication channels and in your code. We have also found Google Translate to do a decent job in translating the Spanish contents of our github page, we advise you to use it to navigate our issue tracker, wiki, etc.
* **How many spots will your organization have for GSoC 2019?** We will ask for 3 students this year, but there is no guarantee yet, we will know for sure until around mid April 2019.
* **How do you choose your students?** We will review each application that we receive and will choose our candidates based on three things:
    * Candidate's skill level. There are two good ways to show your skill level in your application: Through impactful pull requests sent to our repositories (this is the recommended way), or through previous experience. Make sure to include evidence of at least one of those in your application.
    * Candidate's work plan. We ask you to write a high level design of your project following our [proposal template](https://docs.google.com/document/d/1_FKfpc2M3VLDVYqvT8ZgsgwIJ3zaZnyUVmSm-H3h6UQ/edit)
    * Cultural fit. We like people who promote inclusion in the organization and are proactively helping out peers. A good way to show help out other candidates when they ask questions on the slack channel.
* **Are there any sample applications for I can look at?** Two good samples are:
    * Vincent Fango's [proposal from last year](https://docs.google.com/document/d/1ei3AV1ByLpONbTgO3Grnl8aVOIL2hwz48IxLmDyuOWA/edit#heading=h.gjdgxs). You can also watch Vincent's final project presentation: <br>
[![omegaUp dev environment installation on Windows](https://img.youtube.com/vi/cOnJ_5M1DFs/0.jpg)](https://www.youtube.com/watch?v=cOnJ_5M1DFs)
    * Carlos Cordoba's [proposal from last year](https://docs.google.com/document/d/1ZEnC33hW4WjZ1WcsDjEtuIeNPuvW62q_hBFjhFosLOI/edit#heading=h.30j0zll)
* **Can I propose solution to multiple problems from the ideas list?** This year we ask that you include the design for only one project in your application. When you are in the coding phase and if you finish that project early, you are more than welcome to work on an additional project.
* **Are there more opportunities at omegaUp for me if I don't get selected for GSoC?** Of course there are. We always welcome new volunteers who are interested in supporting our efforts. Around the time when results are released we will announce a plan to onboard those of you how are interested in becoming volunteers.

