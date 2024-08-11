# Device_mngmnt_system
This project is a Database Management System (DBMS) designed to manage devices within an organization. It handles various aspects of device management, including tracking devices, support requests, and solutions provided.
The project aims to create a database management system that effectively handles:

Device Categories
Individual Devices
Users/Employees
Support Requests
Support Staff
Priority Levels
Request History
Skill Sets
Solutions
Database Structure

Tables Created
DeviceCategory: Stores types of devices, e.g., laptops, mobile phones.
Device: Information about individual devices, including status and user assignment.
User: Details about users, including name, contact information, and department.
SupportRequest: Tracks support requests made by users for device-related issues.
SupportStaff: Information about support staff responsible for resolving device issues.
PriorityType: Stores different priority levels for support requests.
History: Stores the history of support requests, including assigned staff and solutions.
SkillSet: Stores skill sets or expertise areas of support staff members.
Solution: Contains solutions provided for support requests.
Relationships
One-to-many relationships exist between entities such as DeviceCategory and Device, User and SupportRequest, PriorityType and History, etc.
Keys
Primary Keys: category_id, device_id, user_id, request_id, staff_id, priority_id, history_id, skill_id, solution_id
Foreign Keys: category_id, device_id, user_id, priority_id, staff_id, request_id, history_id
Technologies Used

Database Management System: MySQL
