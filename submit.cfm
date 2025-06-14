<head>
    <title>RSVP Submission</title>
    <link rel="stylesheet" type="text/css" href="/simpleColdFusionApp/styles.css">
</head>
<body>
    <cfif NOT structIsEmpty(form)>
        <!--- Validate data and add it to a database if no errors --->
        <cfset errorArray = arrayNew(1)>
        <cfif NOT structKeyExists(form, 'full_name') OR trim(form.full_name) EQ ''>
            <cfset arrayAppend(errorArray, 'Error: Enter a name.')>
        </cfif>
        <cfif NOT isValid('email', form.email)>
            <cfset arrayAppend(errorArray, 'Error: Please provide an email.')>
        </cfif>
        <cfif NOT isValid('integer', form.guest_count) OR form.guest_count LT 1>
            <cfset arrayAppend(errorArray, 'Please enter a number for guests attending.')>
        </cfif>
        <cfif arrayIsEmpty(errorArray)>
            <!--- Query to database --->
                <cfquery datasource="RSVPAccessDB" name="insertQuery">
                    INSERT INTO rsvps (full_name, email, guest_count, comments, submitted_at)
                    VALUES (
                        <cfqueryparam value="#trim(form.full_name)#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#form.guest_count#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#form.comments#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
                    )
                </cfquery>
            <!--- Redirect to thanks page --->
            <cflocation url="thanks.cfm?full_name=#urlEncodedFormat(form.full_name)#&guest_count=#form.guest_count#">
        <cfelse>
            <cfoutput>
                <h2>We found #arrayLen(errorArray)# Error(s) with your submission:</h2>
                <!--- Display Error Messages --->
                <cfloop array="#errorArray#" item="error">
                    <p class="error">#error#</p>
                </cfloop>
                <!--- Display the form again with values pre filled --->
                <form class="rsvpForm" method="POST" action="submit.cfm">
                    <label for="full_name">Name:</label>
                    <input type="text" name="full_name" id="full_name" value="#form.full_name#" required/><br>
                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" value="#form.email#" /><br>
                    <label for="guest_count">Number of Guests:</label>
                    <input type="number" name="guest_count" id="guest_count" value="#form.guest_count#" min="1" required/><br>
                    <label for="comments">Comments:</label>
                    <textarea name="comments" id="comments">#form.comments#</textarea><br><br>
                    <input type="submit" name="submitForm" value="RSVP"/>
                </form>
            </cfoutput>
        </cfif>
    <cfelse>
        <cflocation url="index.cfm">
    </cfif>
</body>