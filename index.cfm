<head>
    </head>
    <body>
<cfparam name="form.full_name" default = "">
<cfparam name="form.email" default = "">
<cfparam name="form.guest_count" default="0">
<cfparam name="form.comments" default="">
<h1>RSVP to Our Event!</h1>
<cfoutput>
    <form method="POST" action="index.cfm">
        <label for="full_name">Name:</label>
        <input type="text" name="full_name" id="full_name" value="#form.full_name#"/><br>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="#form.email#"/><br>
        <label for="guest_count">Number of Guests:</label>
        <input type="number" name="guest_count" id="guest_count" value="#form.guest_count#" min="0"/><br>
        <label for="comments">Comments:</label>
        <textarea name="comments" id="comments">#form.comments#</textarea><br><br>
        <input type="submit" name="submitForm" value="RSVP"/>
    </form>
</cfoutput>
</body>