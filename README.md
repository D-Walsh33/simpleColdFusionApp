# simpleColdFusionApp

This is for practicing ColdFusion

## RSVP WEB APP

🧱 Basic Features (Phase 1)
Public RSVP Form
Guests enter: name, email, number of guests, and comments.

Form Submission
Submissions are saved to a database.

Confirmation Page
A thank-you message is displayed after submission.

Admin View Page
A simple page that shows a list of all RSVPs.

📊 Database Table: rsvps
Field Type Description
id INT (PK) Auto-increment ID
name VARCHAR Guest name
email VARCHAR Guest email
guest_count INT Number of additional guests
comments TEXT Optional message
submitted_at DATETIME Timestamp of RSVP
