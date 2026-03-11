<%@ page import="java.util.*, com.hrms.model.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #f3f4f6;
            min-height: 100vh;
            padding: 60px 24px;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            color: #111827;
        }

        .page-container {
            max-width: 720px;
            margin: 0 auto;
        }

        
        .page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 28px;
        }

        .page-header h2 {
            font-size: 22px;
            font-weight: 700;
            color: #111827;
        }

        /* ── Card ── */
        .card {
            background: #ffffff;
            border-radius: 14px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.08), 0 2px 4px -1px rgba(0,0,0,0.05);
            overflow: hidden;
            margin-bottom: 24px;
        }

        .card-header {
            padding: 16px 24px;
            border-bottom: 1px solid #e5e7eb;
            background: #f9fafb;
        }

        .card-header h3 {
            font-size: 13px;
            font-weight: 600;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        /* ── Detail grid ── */
        .detail-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0;
        }

        .detail-item {
            padding: 18px 24px;
            border-bottom: 1px solid #f3f4f6;
            border-right: 1px solid #f3f4f6;
        }

        .detail-item:nth-child(2n) {
            border-right: none;
        }

        .detail-item:nth-last-child(-n+2) {
            border-bottom: none;
        }

        .detail-label {
            font-size: 11px;
            font-weight: 600;
            color: #9ca3af;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            margin-bottom: 4px;
        }

        .detail-value {
            font-size: 15px;
            font-weight: 500;
            color: #111827;
        }

        /* ── Salary table ── */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        thead tr {
            background-color: #f9fafb;
            border-bottom: 1px solid #e5e7eb;
        }

        thead th {
            padding: 13px 24px;
            text-align: left;
            font-size: 12px;
            font-weight: 600;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        tbody tr {
            border-bottom: 1px solid #f3f4f6;
            transition: background-color 0.12s ease;
        }

        tbody tr:last-child {
            border-bottom: none;
        }

        tbody tr:hover {
            background-color: #f9fafb;
        }

        tbody td {
            padding: 14px 24px;
            color: #374151;
        }

        .empty-row td {
            color: #9ca3af;
            font-style: italic;
            text-align: center;
        }

       
        .back-link {
            display: inline-block;
            font-size: 13px;
            color: #6b7280;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.15s ease;
        }

        .back-link:hover {
            color: #2563eb;
        }

        .back-link::before {
            content: '← ';
        }
    </style>
</head>

<body>

    <%
        Employee employee  = (Employee) request.getAttribute("employee");
        String   deptName  = (String)   request.getAttribute("deptName");
        String   roleName  = (String)   request.getAttribute("roleName");
        String   username  = (String)   request.getAttribute("username");
        List<Salary> salaries = (List<Salary>) request.getAttribute("salaries");
    %>

    <div class="page-container">

        <div class="page-header">
            <h2>Employee Details</h2>
        </div>

      
        <div class="card">
            <div class="card-header">
                <h3>Profile</h3>
            </div>
            <div class="detail-grid">

                <div class="detail-item">
                    <div class="detail-label">Employee ID</div>
                    <div class="detail-value"><%= employee.getEmpId() %></div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Username</div>
                    <div class="detail-value"><%= username %></div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">First Name</div>
                    <div class="detail-value"><%= employee.getName() %></div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Surname</div>
                    <div class="detail-value"><%= employee.getSurname() %></div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Department</div>
                    <div class="detail-value"><%= deptName %></div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Role</div>
                    <div class="detail-value"><%= roleName %></div>
                </div>

                <div class="detail-item">
                    <div class="detail-label">Experience</div>
                    <div class="detail-value"><%= employee.getExperienceYears() %> yr<%= employee.getExperienceYears() != 1 ? "s" : "" %></div>
                </div>

            </div>
        </div>

        <!-- ── Salary History ── -->
        <div class="card">
            <div class="card-header">
                <h3>Salary History</h3>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Salary ID</th>
                        <th>Amount</th>
                        <th>Effective Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (salaries != null && !salaries.isEmpty()) {
                            for (Salary sal : salaries) {
                    %>
                    <tr>
                        <td><%= sal.getSalaryId() %></td>
                        <td>$<%= String.format("%,.2f", sal.getAmount()) %></td>
                        <td><%= sal.getEffectiveDate() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr class="empty-row">
                        <td colspan="3">No salary records found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <a class="back-link" href="<%= request.getContextPath() %>/ViewEmployeesServlet">Back to Employee List</a>

    </div>

</body>
</html>
