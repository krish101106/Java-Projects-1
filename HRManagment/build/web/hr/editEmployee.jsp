<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
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

        .form-card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.08), 0 2px 4px -1px rgba(0, 0, 0, 0.05);
            border: 1px solid #e5e7eb;
            width: 100%;
            max-width: 480px;
            overflow: hidden;
        }

        .form-header {
            padding: 28px 36px 22px;
            border-bottom: 1px solid #f0f0f0;
        }

        .form-header h2 {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
        }

        .form-body {
            padding: 28px 36px 32px;
        }

        .field-group {
            display: flex;
            flex-direction: column;
            gap: 4px;
            margin-bottom: 18px;
        }

        .field-group label {
            font-size: 13px;
            font-weight: 500;
            color: #374151;
        }

        .field-group input {
            padding: 11px 14px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            color: #111827;
            background-color: #f9fafb;
            font-family: inherit;
            transition: border-color 0.15s ease, background-color 0.15s ease, box-shadow 0.15s ease;
            width: 100%;
        }

        .field-group input:focus {
            outline: none;
            border-color: #3b82f6;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
        }

        button[type="submit"] {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            font-family: inherit;
            transition: background-color 0.15s ease, transform 0.1s ease;
        }

        button[type="submit"]:hover {
            background-color: #1d4ed8;
        }

        button[type="submit"]:active {
            transform: translateY(1px);
        }

        .btn-back {
            display: block;
            width: 100%;
            padding: 11px;
            margin-top: 10px;
            background-color: transparent;
            color: #374151;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            font-family: inherit;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.15s ease, border-color 0.15s ease;
        }

        .btn-back:hover {
            background-color: #f3f4f6;
            border-color: #9ca3af;
        }
    </style>
</head>

<body>

    <div class="form-card">

        <div class="form-header">
            <h2>Edit Employee</h2>
        </div>

        <div class="form-body">

            <form action="<%= request.getContextPath() %>/UpdateEmployeeServlet" method="post">

                <div class="field-group">
                    <label>Employee ID</label>
                    <input type="number" name="emp_id">
                </div>

                <div class="field-group">
                    <label>Name</label>
                    <input type="text" name="name">
                </div>

                <div class="field-group">
                    <label>Surname</label>
                    <input type="text" name="surname">
                </div>

                <div class="field-group">
                    <label>Experience Years</label>
                    <input type="number" name="experience_years">
                </div>

                <div class="field-group">
                    <label>Department ID</label>
                    <input type="number" name="dept_id">
                </div>

                <div class="field-group">
                    <label>Role ID</label>
                    <input type="number" name="role_id">
                </div>

                <button type="submit">Update Employee</button>

            </form>

            <a href="hrDashboard.jsp" class="btn-back">&#8592; Back to Dashboard</a>

        </div>

    </div>

</body>

</html>