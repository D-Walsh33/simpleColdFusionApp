# ColdFusion RSVP Web Application

![Simple RSVP Form](screenshots/rsvpForm.png)

This is a simple RSVP web application built with Adobe ColdFusion and Microsoft Access. It allows users to RSVP to an event, and provides an admin dashboard for viewing and filtering submissions. Designed as a portfolio project to demonstrate form handling, database integration, and dynamic filtering in ColdFusion.

## 🧠 Features

- Submit RSVP form with validation
- Store entries in an Access database
- Admin dashboard to view all submissions
- Filter RSVPs by date range
- Total guest count calculation
- Clear filter option
- Styled with custom CSS

## 🛠 Tech Stack

- **Backend:** Adobe ColdFusion (CFML)
- **Database:** Microsoft Access (connected via ODBC)
- **Frontend:** HTML, CSS
- **Deployment:** Local development via ColdFusion Server (Lucee or Adobe CF)

## 📁 File Structure

```
rsvp-app/
│
├── index.cfm         # User-facing RSVP form
├── submit.cfm        # Handles form submission, validation, and DB insert
├── thanks.cfm        # Confirmation page after successful RSVP
├── admin.cfm         # Admin dashboard with RSVP list, filters, and total guests
├── styles.css        # Custom CSS for layout and design
├── rsvps.accdb       # Microsoft Access database file
├── /screenshots/     # (Optional) Folder for screenshots used in README
```

![Succesful RSVP](screenshots/SuccessfulInsert.png)

![Error on Submission](screenshots/errorExample.png)

![Admin Page](screenshots/Admin.png)
