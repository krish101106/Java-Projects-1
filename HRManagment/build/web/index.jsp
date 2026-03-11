<%@ page language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HR System Login</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            body {
                background-color: #f3f4f6;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                color: #111827;
            }

            .login-card {
                background: #ffffff;
                border-radius: 12px;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                padding: 40px;
                width: 100%;
                max-width: 400px;
                border: 1px solid #e5e7eb;
            }

            h2 {
                font-size: 24px;
                font-weight: 600;
                margin-top: 0;
                margin-bottom: 28px;
                text-align: center;
                color: #111827;
            }

            form {
                font-size: 14px;
                font-weight: 500;
                color: #4b5563;
            }

            form br {
                display: none;
            }

            input[type="text"],
            input[type="password"] {
                display: block;
                width: 100%;
                padding: 12px 14px;
                margin-top: 8px;
                margin-bottom: 20px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                font-size: 14px;
                background-color: #f9fafb;
                transition: outline 0.2s, border-color 0.2s, background-color 0.2s;
                font-family: inherit;
                box-sizing: border-box;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                outline: none;
                border-color: #3b82f6;
                background-color: #ffffff;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
            }

            input[type="radio"] {
                margin-left: 12px;
                margin-right: 4px;
                accent-color: #3b82f6;
                cursor: pointer;
                vertical-align: middle;
                width: 16px;
                height: 16px;
                position: relative;
                top: -1px;
            }

            input[type="submit"] {
                display: block;
                width: 100%;
                padding: 12px;
                margin-top: 28px;
                background-color: #2563eb;
                color: #ffffff;
                border: none;
                border-radius: 8px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.2s ease, transform 0.1s ease;
                font-family: inherit;
            }

            input[type="submit"]:hover {
                background-color: #1d4ed8;
            }

            input[type="submit"]:active {
                transform: translateY(1px);
            }

            .error-message {
                margin-top: 24px;
                background-color: #fef2f2;
                color: #b91c1c;
                padding: 12px 16px;
                border-radius: 8px;
                font-size: 14px;
                font-weight: 500;
                border: 1px solid #fecaca;
                text-align: center;
                box-sizing: border-box;
            }
        </style>
    </head>

    <body>

        <div class="login-card">

            <h2>HR Management System</h2>

            <form action="LoginServlet" method="post">

                Username:
                <input type="text" name="username" required><br><br>

                Password:
                <input type="password" name="password" required><br><br>

                Login As:
                <input type="radio" name="role" value="HR" required> HR
                <input type="radio" name="role" value="Employee"> Employee

                <br><br>

                <input type="submit" value="Login">

            </form>

            <% String error=(String) request.getAttribute("error"); if(error !=null){ %>
                <p class="error-message">
                    <%= error %>
                </p>
                <% } %>

        </div>

    </body>

    </html>