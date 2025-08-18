# Incident Management System

## Overview

The **Incident Management System** is a robust desktop and mobile application built using the **MEAN stack** (MongoDB, Express.js, Angular, Node.js) and **Flutter**. It simplifies incident management by allowing employees to submit and track complaints (tickets) while providing administrators and service teams with comprehensive tools to monitor and resolve incidents efficiently. The system enhances visibility, automates workflows, and tracks technician performance to ensure timely and effective incident handling.

## Features

### Employee/User Features
- **📝 Submit and Track Complaints**: Create and monitor the progress of incident tickets.
- **📊 Access Ticket Status**: View real-time status updates (pending, in progress, resolved).
- **🔄 Ticket Reassignment**: Unresolved tickets are reassigned to ensure timely resolution.
- **📈 Statistical Reports**: Reuse submitted data to generate reports (e.g., average resolution time, tickets processed per week).

### Admin/Service Desk Features
- **📂 Centralize Complaints**: Manage all employee complaints in a single platform.
- **✅ Review and Resolve**: Efficiently review and update the status of complaints.
- **📊 Visual Dashboards**: Monitor ticket progress with intuitive, visual dashboards.
- **🤖 Automated Workflow**: Shorten resolution times with automated processes and personalized responses.
- **🔔 Generate Notifications**: Automatically notify technicians of ticket assignments.
- **🔍 Two-Dimensional Control**: Provide oversight for employees, admins, and technicians.

### Technician Features
- **📩 Receive and Process Tickets**: Access and handle assigned incident tickets.
- **🔄 Update Ticket Status**: Log progress and update ticket statuses in real time.
- **📜 Historical Data Access**: Track performance and view statistics for past incidents.

### Benefits
- Streamlined incident submission and resolution processes.
- Reduced resolution times through automation.
- Increased employee satisfaction with timely and personalized responses.
- Enhanced visibility and control for administrators and technicians.

## Getting Started

### Prerequisites
To set up and run the Incident Management System, ensure the following are installed:

#### For MEAN Stack (Backend and Web Frontend)
- **Node.js** (>= 16.x recommended) and **npm**: For running the Express.js server and Angular frontend.
- **MongoDB**: Database for storing tickets, user data, and statistics.
- **Angular CLI**: For building and serving the Angular frontend (install globally with `npm install -g @angular/cli`).

#### For Flutter (Mobile App)
- **Flutter SDK** (>= 3.x recommended): For building the mobile application.
- **Dart**: Included with Flutter, required for development.
- A compatible IDE (e.g., VS Code, IntelliJ IDEA) with Flutter and Dart plugins.

#### General
- **Git**: For cloning the repository.
- A web server or local development environment (e.g., Node.js for backend, Flutter for mobile).

> **⚠️ Note**: Ensure you have sufficient permissions to configure the server, database, and mobile development environment.

### Installation

#### Backend (MEAN Stack)
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/molka-attia/helpdesk-system.git
   cd helpdesk-system/backend
