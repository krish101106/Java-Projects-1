<%@ page import="java.util.*, com.hrms.model.Employee" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee List</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

            *,
            *::before,
            *::after {
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
                max-width: 900px;
                margin: 0 auto;
            }

            .page-header {
                margin-bottom: 24px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .page-header h2 {
                font-size: 22px;
                font-weight: 700;
                color: #111827;
            }

            .table-card {
                background: #ffffff;
                border-radius: 14px;
                border: 1px solid #e5e7eb;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.08), 0 2px 4px -1px rgba(0, 0, 0, 0.05);
                overflow: hidden;
            }

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
                padding: 13px 20px;
                text-align: left;
                font-size: 12px;
                font-weight: 600;
                color: #6b7280;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                white-space: nowrap;
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
                padding: 14px 20px;
                color: #374151;
                font-size: 14px;
                font-weight: 400;
            }

            .action-cell {
                display: flex;
                gap: 8px;
                align-items: center;
            }

            .view-link {
                display: inline-block;
                padding: 5px 12px;
                font-size: 12px;
                font-weight: 500;
                color: #1d4ed8;
                background-color: #eff6ff;
                border: 1px solid #bfdbfe;
                border-radius: 6px;
                text-decoration: none;
                transition: background-color 0.15s ease, color 0.15s ease, border-color 0.15s ease;
                white-space: nowrap;
            }

            .view-link:hover {
                background-color: #1d4ed8;
                color: #ffffff;
                border-color: #1d4ed8;
            }

            .delete-link {
                display: inline-block;
                padding: 5px 12px;
                font-size: 12px;
                font-weight: 500;
                color: #b91c1c;
                background-color: #fef2f2;
                border: 1px solid #fecaca;
                border-radius: 6px;
                text-decoration: none;
                transition: background-color 0.15s ease, color 0.15s ease, border-color 0.15s ease;
                white-space: nowrap;
            }

            .delete-link:hover {
                background-color: #b91c1c;
                color: #ffffff;
                border-color: #b91c1c;
            }

            .back-link {
                display: inline-block;
                margin-top: 24px;
                font-size: 13px;
                color: #6b7280;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.15s ease;
            }

            .back-link:hover {
                color: #2563eb;
            }
        </style>
    </head>

    <body>

        <div class="page-container">

            <div class="page-header">
                <h2>Employees</h2>
            </div>

            <div class="table-card">
                <table>

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Surname</th>
                            <th>Experience</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>

                        <% List<Employee> employees = (List<Employee>) request.getAttribute("employeeList");

                                if (employees != null) {

                                for (Employee emp : employees) {
                                %>

                                <tr>

                                    <td>
                                        <%= emp.getEmpId()%>
                                    </td>
                                    <td>
                                        <%= emp.getName()%>
                                    </td>
                                    <td>
                                        <%= emp.getSurname()%>
                                    </td>
                                    <td>
                                        <%= emp.getExperienceYears()%> yr<%= emp.getExperienceYears() != 1 ? "s" : "" %>
                                    </td>

                                    <td>
                                        <div class="action-cell">
                                            <a class="view-link"
                                                href="<%= request.getContextPath() %>/ViewEmployeeServlet?emp_id=<%= emp.getEmpId()%>">View</a>
                                            <a class="delete-link"
                                                href="<%= request.getContextPath() %>/DeleteEmployeeServlet?emp_id=<%= emp.getEmpId()%>">Delete</a>
                                        </div>
                                    </td>

                                </tr>

                                <% } } %>

                    </tbody>

                </table>
            </div>

            <a class="back-link" href="<%= request.getContextPath() %>/hr/hrDashboard.jsp">Back</a>

        </div>

    </body>

    </html>