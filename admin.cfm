<head>
    <title>RSVP Admin Page!</title>
    <link rel="stylesheet" type="text/css" href="/simpleColdFusionApp/styles.css">
</head>
<body>
    <cfparam name="url.start_date" default="">
    <cfparam name="url.end_date" default="#dateFormat(now(), 'yyyy-mm-dd')#">
    <h1>Admin Page</h1>
    <cfoutput>
        <div>
            <p>View RSVPs by Date:</p>
            <form class="filterForm" method="get" action="admin.cfm">
                <label for="start_date">Start Date:</label>
                <input type="date" name="start_date" id="start_date" value="#url.start_date#">
                
                <label for="end_date">End Date:</label>
                <input type="date" name="end_date" id="end_date" value="#url.end_date#">
                
                <input type="submit" value="Filter">
                <a href="admin.cfm" class="button-link">Clear Filters</a>
            </form>
        </div>
    </cfoutput>
    <cfquery name="rsvpResults" datasource="RSVPAccessDB">
        SELECT * FROM rsvps
        WHERE 1=1
        <cfif len(url.start_date)>
          AND submitted_at >= <cfqueryparam value="#url.start_date#" cfsqltype="cf_sql_date">
        </cfif>
        <cfif len(url.end_date)>
          AND submitted_at <= <cfqueryparam value="#dateAdd('d', 1, url.end_date)#" cfsqltype="cf_sql_timestamp">
        </cfif>
        ORDER BY submitted_at DESC
      </cfquery>
      
      <cfquery name="totalGuestsQuery" datasource="RSVPAccessDB">
        SELECT SUM(guest_count) AS total_guests FROM rsvps
        WHERE 1=1
        <cfif len(url.start_date)>
          AND submitted_at >= <cfqueryparam value="#url.start_date#" cfsqltype="cf_sql_date">
        </cfif>
        <cfif len(url.end_date)>
          AND submitted_at < <cfqueryparam value="#dateAdd('d', 1, url.end_date)#" cfsqltype="cf_sql_timestamp">
        </cfif>
      </cfquery>
    <cfoutput>
        <p class="total-guests"><strong>Total Guests Attending:</strong> #totalGuestsQuery.total_guests#</p>
    </cfoutput>
<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Number of Guests:</th>
        <th>Comments</th>
        <th>Date Submitted</th>
    </tr>
    <cfoutput query="rsvpResults">
        <tr>
            <td>
                #full_name#
            </td>
            <td>
                #email#
            </td>
            <td>
                #guest_count#
            </td>
            <td>
                #comments#
            </td>
            <td>
                #dateFormat(submitted_at, 'mm-dd-yyyy')#
            </td>
        </tr>
    </cfoutput>
</table>
</body>
