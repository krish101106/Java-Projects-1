<%@ page language="java" %>

    <% if (session.getAttribute("username")==null) { response.sendRedirect("../index.jsp"); } %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Employee Dashboard</title>
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
                    display: flex;
                    justify-content: center;
                    align-items: flex-start;
                    padding: 60px 20px;
                    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                    color: #111827;
                }

                .dashboard-card {
                    background: #ffffff;
                    border-radius: 14px;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.08), 0 2px 4px -1px rgba(0, 0, 0, 0.05);
                    border: 1px solid #e5e7eb;
                    width: 100%;
                    max-width: 440px;
                    overflow: hidden;
                }

                .dashboard-header {
                    padding: 32px 36px 24px;
                    border-bottom: 1px solid #f0f0f0;
                }

                .dashboard-header h2 {
                    font-size: 22px;
                    font-weight: 700;
                    color: #111827;
                    margin-bottom: 6px;
                }

                .welcome-message {
                    font-size: 14px;
                    color: #6b7280;
                    font-weight: 400;
                }

                .welcome-message strong {
                    color: #374151;
                    font-weight: 600;
                }

                .dashboard-nav {
                    padding: 20px 24px;
                    display: flex;
                    flex-direction: column;
                    gap: 8px;
                    list-style: none;
                }

                .dashboard-nav li a {
                    display: flex;
                    align-items: center;
                    padding: 14px 18px;
                    text-decoration: none;
                    font-size: 14px;
                    font-weight: 500;
                    color: #374151;
                    background-color: #f9fafb;
                    border-radius: 8px;
                    border: 1px solid #e5e7eb;
                    transition: background-color 0.15s ease, color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease;
                }

                .dashboard-nav li a:hover {
                    background-color: #2563eb;
                    color: #ffffff;
                    border-color: #2563eb;
                    box-shadow: 0 2px 8px rgba(37, 99, 235, 0.25);
                }

                .dashboard-nav li:last-child a {
                    color: #9ca3af;
                    border-color: transparent;
                    background-color: transparent;
                    justify-content: center;
                    font-size: 13px;
                }

                .dashboard-nav li:last-child a:hover {
                    background-color: #fef2f2;
                    color: #b91c1c;
                    border-color: #fecaca;
                    box-shadow: none;
                }
            </style>
        </head>

        <body>

            <div class="dashboard-card">

                <div class="dashboard-header">
                    <h2>Employee Dashboard</h2>
                    <p class="welcome-message">Welcome back, <strong>
                            <%= session.getAttribute("username")%>
                        </strong></p>
                </div>

                <ul class="dashboard-nav">

                    <li><a href="<%= request.getContextPath() %>/employee/editProfile.jsp">Edit Profile</a></li>

                    <li><a href="<%= request.getContextPath() %>/logout.jsp">Logout</a></li>

                </ul>

            </div>

        </body>

        </html>