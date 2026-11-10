<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ooo.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
    <style>
        /* Base Layout */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8fafc;
            color: #334155;
        }

        .main-content {
            padding: 30px;
            max-width: 1100px;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 24px;
        }

        /* Stats Cards Layout */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: #ffffff;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            border-left: 5px solid #2c3e50;
            transition: transform 0.2s ease;
        }

            .stat-card:hover {
                transform: translateY(-3px);
            }

            .stat-card.card-products {
                border-left-color: #2c3e50;
            }

            .stat-card.card-cart {
                border-left-color: #8b4513;
            }

            .stat-card.card-orders {
                border-left-color: #2563eb;
            }

            .stat-card h3 {
                margin: 0 0 10px 0;
                font-size: 14px;
                color: #64748b;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .stat-card .number {
                font-size: 32px;
                font-weight: 700;
                color: #0f172a;
                margin: 0;
            }

        /* Recent Activity / Welcome Box */
        .welcome-card {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 24px;
        }

            .welcome-card h3 {
                margin-top: 0;
                color: #1e293b;
                font-size: 20px;
            }

            .welcome-card p {
                color: #64748b;
                font-size: 15px;
                line-height: 1.6;
            }

        .quick-actions {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .btn-dash {
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            color: #ffffff;
            transition: opacity 0.2s;
        }

            .btn-dash:hover {
                opacity: 0.9;
            }

        .btn-add {
            background-color: #2c3e50;
        }

        .btn-manage {
            background-color: #8b4513;
        }
        /* Report Button Styling */
        .btn-report {
            background-color: #2c3e50; /* Dark Executive Blue/Charcoal */
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
            font-weight: 600;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

            /* Hover Effect (Jyare cursor button par jase) */
            .btn-report:hover {
                background-color: #1a252f;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
                transform: translateY(-1px);
            }

            /* Click Effect */
            .btn-report:active {
                transform: translateY(1px);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-content">
        <h2 class="page-title">Admin Dashboard</h2>

        <!-- Stats Cards Grid -->
        <div class="stats-container">
            <div class="stat-card card-products">
                <h3>Total Products</h3>
                <p class="number">
                    <asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label>
                </p>
            </div>

            <div class="stat-card card-cart">
                <h3>Items in Cart</h3>
                <p class="number">
                    <asp:Label ID="lblTotalCartItems" runat="server" Text="0"></asp:Label>
                </p>
            </div>

            <div class="stat-card card-orders">
                <h3>Total Revenue</h3>
                <p class="number">
                    ₹
                    <asp:Label ID="lblTotalRevenue" runat="server" Text="0.00"></asp:Label>
                </p>
            </div>
        </div>

        <!-- Welcome & Quick Links -->
        <div class="welcome-card">
            <h3>Welcome to Admin Panel</h3>
            <p>From here you can manage your store products, active shopping carts, and order details efficiently.</p>

            <div class="quick-actions">
                <a href="AddProduct.aspx" class="btn-dash btn-add">+ Add New Product</a>
                <a href="ManageProducts.aspx" class="btn-dash btn-manage">Manage Products</a>
            </div>
        </div>
        <asp:Button ID="WishlistReport" runat="server" Text="Report"
            CssClass="btn-report" OnClick="btnWishlistReport_Click" formtarget="_blank" />
    </div>
</asp:Content>
