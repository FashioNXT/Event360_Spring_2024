# Team Roles
- **Product Owner:** Alex Wise
- **Scrum Master:** Louis Turrubiartes
- **Developers:** Amalesh Arivanan, Tiachen Huang, Tong Wu, Xin Tong

# Customer Meeting
- **Date/Time/Place:** Every Tuesday at 7:30pm CST on Zoom

# Summary
The wrapper, a web application, addresses a critical customer need for FashionNXT, a leading fashion show with a small team and budget constraints. The application integrates three specialized apps - CastNXT, EventNXT, and PlanNXT that help to streamline and automate talent management, guest management, and event floor plan planning. FashionNXT's challenges include managing a multi day fashion show with nearly 3000 attendees per event on a limited budget. CastNXT simplifies the casting process, consolidating talent recruitment, negotiation with producers, and communication with models into a single hub. EventNXT focuses on guest management, efficiently handling guest lists, RSVPs, and ticket distribution, with a unique emphasis on referral rewards. PlanNXT aids in chronological floor plan planning, ensuring a seamless setup and teardown of the event space. The wrapper's goal is to provide a unified solution, simplifying complex event planning processes and offering a consolidated hub for casting, guest management, and floorplan planning. 
 
Stakeholders in this venture include the professor, teacher assistant, group members, and Tito Chowdhury, the CEO of FashionNXT. The success of the wrapper web application is paramount to the efficiency of FashionNXT's event planning. The application's unique features, such as consolidated login and analytics for owner control, align with the stakeholders' specific requirements. Drawing parallels to the Office360 experience, where a single login provides access to various tools, the wrapper web application aims to offer a solution for FashionNXT's event planning, fostering collaboration and efficiency. The stakeholders are deeply invested in the success of the application, ensuring it meets the distinct challenges and demands of organizing a multi day fashion show with limited resources. 
The progression of the three integrated apps, CastNXT, EventNXT, and PlanNXT, varies in terms of development and functionality. CastNXT, focused on talent management, is the most advanced and straightforward, nearing completion for a public release. It streamlines the casting process, allowing for model recruitment, negotiation, communication, and even payment within a single application. EventNXT, dedicated to guest management, has made significant progress but encountered a setback due to a stakeholder's request for the consolidated login. Despite this, the app is well positioned to meet the needs of the upcoming FashionNXT events, with features like RSVP management and referral rewards. PlanNXT, dealing with event floorplan planning, is still refining its 3D visualization tool but aims to be sophisticated enough for FashionNXT to utilize in the near future. 
 
The wrapper web applications importance lies not only in its ability to meet the immediate needs of FashionNXT but also in its potential as a multi-user application. The front-end, which allows a single login for all three apps, is almost complete, offering a seamless experience for users. The back-end, with a focus on owner control and analytics, is being designed to ensure efficient management and prevent misuse, aligning with the stakeholders' concerns. Overall, the wrapper web-app stands as a comprehensive solution for FashionNXT's intricate event planning requirements, with the potential to expand its utility beyond the specific needs of the fashion show, benefiting a broader user base. 

# User Stories
## User Story 1: Consolidated Sign-on System
- **Feature:** Progress Tracking
- **As a FashionNXT customer,** So that I can avoid signing in with each use, I want to sign in once and be signed in to the three apps.


## User Story 2: Increasing Sales
- **Feature:** App Deployment
- **As a FashionNXT CEO,** So that I can increase sales, I want to implement a reward system for referrals for an event.

## User Story 3: CRM Enhancement for Informative Analytics
- **Feature:** CRM Analytics Integration
- **As a user across all member apps (CastNXT, EventNXT, and PlanNXT),** So that I can make informed decisions and enhance my event planning process, I want the CRM system to be improved with analytics, providing comprehensive insights that are consistent across all member apps.

## User Story 4: Enhanced Data Collection
- **Feature:** Additional Spec Collection
- **As a user of the event planning apps,** So that I can gather comprehensive information for event planning, I want the system to enable the collection of additional specifications beyond the existing data fields.

## User Story 5: Production-Ready Deployment
- **Feature:** Production Readiness
- **As a user preparing for actual event deployment,** So that I can ensure a smooth and successful event, I want the system to undergo the necessary steps to become production-ready.

## User Story 6: User-Friendly Interface Enhancement
- **Feature:** Intuitive User Interface
- **As a user of the event planning apps (CastNXT, EventNXT, and PlanNXT),** So that I can navigate and utilize the apps with ease, I want the interface to be enhanced for a more user-friendly experience.

## User Story 7: Environment Setup for Event Planning Apps
- **Feature:** Development Environment Configuration
- **As a developer working on the event planning apps (CastNXT, EventNXT, and PlanNXT),** So that I can efficiently contribute to the project, I want the development environment to be set up with the necessary tools and dependencies.

## User Story 8: Visualization for Facility Management
- **Feature:** Visualization for Project Management
- **As a project manager using PlanNXT,** So that I can manage all stuff in the event in order, I want a clear visualization for furniture, electricals, and staff placement.

## User Story 9: Document Management Improvement
- **Feature:** Document Management for Producers
- **As a producer of the event using CastNXT,** So that I can communicate with clients efficiently, I want a systematic and efficient way to collect all kinds of documents with different kinds of clients.

## Sprint Backlog: 

A clear objective was established after our introduction to the stakeholder, FashioNXT CEO Tito, for the team to develop the event planning apps: CashNXT, EventNXT, and PlaNXT. The core component to the Sprint Plan 1 is User Story 7, which is to focus our attention and set up our system with the necessary tools and dependencies. The integration of this workflow ensures all team members have an adequately developed system with necessary tools and dependencies for effective collaboration.  

A point value of 3 has been allocated to this user story due to its crucial role in our development foundation. This value has been assigned due to the nature of our team’s experience with the preexistent apps and its ability to be done in one week. 

The responsibility of User Story 7 has been assigned to each team member. The task associated with this user story is to communicate with previous developers to demo a “new app installation” through a virtual meeting. By the end of this sprint, our system will be equipped with the necessary environment to proceed with development.  


## Links to GitHub Repo, Pivotal Tracker, and Slack:
- **GitHub:** [FashioNXT/Event360_Spring_2024](https://github.com/FashioNXT/Event360_Spring_2024)
- **Pivotal Tracker:** [Project 2676556](https://www.pivotaltracker.com/n/projects/2676556)
- **Slack:** [Slack Workspace](https://app.slack.com/client/T06G2CUA9KL/C06G29HV9L3)

## Legacy Projects Summary:

# Current State Assessment:
The 2023F team made commendable efforts with the provided resources, faithfully implementing project progress recommendations. They extensively wrote acceptance tests and provided a detailed Final Report. Despite initial client dissatisfaction, challenges such as lacking test cases were faced.

It is recommended to review the Final Report.pdf for a comprehensive understanding of the project's final state. The MVC pattern is followed, with potential issues arising from controller definitions deviating from OOP principles.

# Challenges and Issues:
The client lacks confidence in the project due to legacy issues. Recommendations include running test automation scripts, seeking help from linters and debuggers, and acknowledging the difficulty of communication with past project developers. The client expects production-ready deliverables, necessitating an honest assessment of the current state.

Issues such as integrating 2D and 3D floor plans in PlaNXT, and frustrations with user authentication, require attention. Some projects depend on paid services.

# Technical Specifics:
Deviation from syllabus recommendations is noted, with opinionated choices in libraries and frameworks. It is suggested to adopt tools used by the 2023F team. Automation using git flow is recommended. Attempts to use Docker for platform-neutral development are noted, with complications mentioned in the Final Report.pdf.

Detailed information about specific projects (EventNXT, CastNXT, PlaNXT) is provided, including challenges faced and recommended actions.


# Resource Allocation:
Considerations about role switching, memory limitations, and energy constraints are discussed. A recommendation is made for 2-3 members to work consistently on each of the three projects, with dedicated roles and oversight by a Scrum Master.
